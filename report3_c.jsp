<html>

<body>
    <table border="3">
        <tr>
            <td valign="top">
                <%-- -------- Include menu HTML code -------- --%>
                <jsp:include page="menu.html" />
            </td>
            <td>

            <%-- Set the scripting language to Java and --%>
            <%-- Import the java.sql package --%>
            <%@ page language="java" import="java.sql.*" %>
    
            <%-- -------- Open Connection Code -------- --%>
            <%
			try {
				// Load Oracle Driver class file
				Class.forName("org.postgresql.Driver");
                    String dbURL = "jdbc:postgresql:cse132b?user=postgres&password=admin";
                    Connection conn = DriverManager.getConnection(dbURL);

            %>
			
				<%
				// Create the statement
				Statement statement = conn.createStatement();
				ResultSet c_rs = statement.executeQuery("SELECT DISTINCT COURSE_NUM FROM SECTION WHERE ((YEAR != 2018 AND QUARTER <> 'Spring') OR (YEAR < 2018))");				
				%>
				<!-- Add an HTML table header row to format the results -->
				<table border="0"><th><font face = "Arial Black" size = "6">Report III - part c</font></th></table>
					<table border="1">
						<form action="report3_c.jsp" method="get">
							<input type="hidden" value="choose" name="action">
						<tr>
							<th>Course ID</th>	
							<th>
								<select name="course_list">
								<%
									while(c_rs.next()){
								%>								
									<option><%=c_rs.getString("COURSE_NUM")%></option>
								<%
									}
								%>
								</select>
							</th>

							<%-- Button --%>
								<td>
									<input type="submit" name="choose" value="Select">
								</td>
						</form>
						</tr>
					</table>

            <%-- -------- INSERT Code -------- --%>
            <%
				String action = request.getParameter("action");
				// Check if an insertion is requested
				if (action != null && action.equals("choose")) {
						
					conn.setAutoCommit(false); 
				
					//get the section ID from the selection
					PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT YEAR FROM SECTION WHERE COURSE_NUM = ? AND ((YEAR != 2018 AND QUARTER <> 'Spring') OR (YEAR < 2018))");
					pstmt.setString(1, request.getParameter("course_list"));

					ResultSet rs = pstmt.executeQuery();	
					
					int a_grade = 0;
					int b_grade = 0;
					int c_grade = 0;
					int d_grade = 0;
					int other = 0;
					
					//loop for each year
					while(rs.next()){
						PreparedStatement subquery = conn.prepareStatement("SELECT DISTINCT FACULTY_NAME FROM SECTION WHERE COURSE_NUM = ? AND YEAR = ?");
						subquery.setString(1, request.getParameter("course_list"));
						subquery.setInt(2, rs.getInt("YEAR"));
						
						ResultSet f_rs = subquery.executeQuery();

						//loop through each faculty
						while(f_rs.next()){
							int classNum = 0;
							int atemp = 0;
							int btemp = 0;
							int ctemp = 0;
							int dtemp = 0;
							int othertemp = 0;
							
							PreparedStatement subsub = conn.prepareStatement("SELECT SECTION_ID FROM SECTION WHERE COURSE_NUM = ? AND FACULTY_NAME = ? AND YEAR = ?");
							subsub.setString(1, request.getParameter("course_list"));
							subsub.setString(2, f_rs.getString("FACULTY_NAME"));
							subsub.setInt(3, rs.getInt("YEAR"));
						
							ResultSet y_rs = subsub.executeQuery();
							
							//loop through each year by section
							while(y_rs.next()){								
								classNum++;
								//get all students who took this section in the past and count the grades
								PreparedStatement stemp = conn.prepareStatement("SELECT GRADE FROM TAKEN WHERE SECTION_ID = ?");
								stemp.setInt(1, y_rs.getInt("SECTION_ID"));
								
								ResultSet stempRS = stemp.executeQuery();
								while(stempRS.next()){	
									if(stempRS.getString("GRADE").contains("A")){
										a_grade++;
										atemp++;
									}
									else if(stempRS.getString("GRADE").contains("B")){
										b_grade++;
										btemp++;
									}
									else if(stempRS.getString("GRADE").contains("C")){
										c_grade++;
										ctemp++;
									}
									else if(stempRS.getString("GRADE").contains("D")){
										d_grade++;
										dtemp++;
									}
									else{//F,S,U,IN
										other++;
										othertemp++;
									}
								}
								stempRS.close();
							}
							
						%>
							<table border="0"><th><font face = "Monospace" size = "5"><%= rs.getInt("YEAR")%> - <%= f_rs.getString("FACULTY_NAME")%>|Sections total: <%= classNum%> </font></th></table>
							<table border="0">
							<tr>
								<th style="border-bottom: thin solid;">A Grades: <%=atemp%></th>
							</tr>
							<tr>
								<th style="border-bottom: thin solid;">B Grades: <%=btemp%></th>
							</tr>
							<tr>
								<th style="border-bottom: thin solid;">C Grades: <%=ctemp%></th>
							</tr>
							<tr>
								<th style="border-bottom: thin solid;">D Grades: <%=dtemp%></th>
							</tr>
							<tr>
								<th style="border-bottom: thin solid;">Other: <%=othertemp%></th>
							</tr>
							</table>
								
						<%
							y_rs.close();
						}														
						f_rs.close();
					}													
								
					%>
						<table border="0"><th><font face = "Monospace" size = "6">Course ID <%= request.getParameter("course_list")%></font></th></table>
				
						<table border="0"><th style="border-bottom: thin solid;"><font face = "Monospace" size = "5">Overall Grade Distribution</font></th></table>
						<table border="0">
						<tr>
							<th style="border-bottom: thin solid;">A Grades: <%=a_grade%></th>
						</tr>
						<tr>
							<th style="border-bottom: thin solid;">B Grades: <%=b_grade%></th>
						</tr>
						<tr>
							<th style="border-bottom: thin solid;">C Grades: <%=c_grade%></th>
						</tr>
						<tr>
							<th style="border-bottom: thin solid;">D Grades: <%=d_grade%></th>
						</tr>
						<tr>
							<th style="border-bottom: thin solid;">Other: <%=other%></th>
						</tr>
						</table>
							
			<%				
					rs.close();
					//Commit transaction					
					conn.commit();
					conn.setAutoCommit(true);				
				}
			%>

            

            <%-- -------- Close Connection Code -------- --%>
            <%
                    // Close the ResultSet
                    c_rs.close();
    
                    // Close the Statement
                    statement.close();
    
                    // Close the Connection
                    conn.close();
                } catch (SQLException sqle) {
                    out.println(sqle.getMessage());
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
                </table>
				
            </td>
        </tr>
    </table>
</body>

</html>
