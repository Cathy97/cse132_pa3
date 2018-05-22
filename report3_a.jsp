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
				ResultSet c_rs = statement.executeQuery("SELECT DISTINCT SECTION.COURSE_NUM, SECTION.YEAR, SECTION.QUARTER, SECTION.FACULTY_NAME FROM SECTION");				
				%>
				<!-- Add an HTML table header row to format the results -->
				<table border="0"><th><font face = "Arial Black" size = "6">Report III - part a</font></th></table>
					<table border="1">
						<form action="report3_a.jsp" method="get">
							<input type="hidden" value="choose" name="action">
						<tr>
							<th>Quarter Selection</th>	
							<th><name="selection" size="25">
							<select name = "selection">
								<% 
									while (c_rs.next()){
										if(!(c_rs.getString("QUARTER").equals("Spring") && c_rs.getInt("YEAR") == 2018)){
								%>
									 <option value="<%= c_rs.getString("COURSE_NUM") %>,<%= c_rs.getString("QUARTER") %>,<%= c_rs.getInt("YEAR") %>,<%= c_rs.getString("FACULTY_NAME") %>"><%= c_rs.getString("COURSE_NUM") %> | <%= c_rs.getString("QUARTER") %> <%= c_rs.getInt("YEAR") %> - <%= c_rs.getString("FACULTY_NAME") %></option>	
								<%
										}
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

					String before_parse = request.getParameter("selection");
					String[] tokens = before_parse.split(",");
					String course_num = tokens[0];
					String quarter = tokens[1];
					String year = tokens[2];
					String faculty_name = tokens[3];
				
					//get the section ID from the selection
					PreparedStatement pstmt = conn.prepareStatement("SELECT SECTION_ID FROM SECTION WHERE COURSE_NUM = ? AND FACULTY_NAME = ? AND QUARTER = ? AND YEAR = ?");
					pstmt.setString(1, course_num);
					pstmt.setString(2, faculty_name);
					pstmt.setString(3, quarter);
					pstmt.setInt(4, Integer.parseInt(year));

					ResultSet rs = pstmt.executeQuery();			
					
					//get the section ID
					int sectionID = 0;						
					if(rs.next())
						sectionID = rs.getInt("SECTION_ID");
					
					int a_grade = 0;
					int b_grade = 0;
					int c_grade = 0;
					int d_grade = 0;
					int other = 0;
					
					
					//get all students who took this section in the past and count the grades
					PreparedStatement stemp = conn.prepareStatement("SELECT GRADE FROM TAKEN WHERE SECTION_ID = ?");
					stemp.setInt(1, sectionID);
					ResultSet stempRS = stemp.executeQuery();
					
					%>
						<table border="0"><th><font face = "Monospace" size = "6">Course ID <%= course_num%> <%= faculty_name%> <%= quarter%> <%= year%></font></th></table>
					<%
					while(stempRS.next()){	
						if(stempRS.getString("GRADE").contains("A"))
							a_grade++;
						else if(stempRS.getString("GRADE").contains("B"))
							b_grade++;
						else if(stempRS.getString("GRADE").contains("C"))
							c_grade++;
						else if(stempRS.getString("GRADE").contains("D"))
							d_grade++;
						else //F,S,U,IN
							other++;			
					}
					
						%>
						<table border="0"><th style="border-bottom: thin solid;"><font face = "Monospace" size = "5">Grade Distribution</font></th></table>
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
					stempRS.close();
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
