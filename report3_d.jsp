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
                    String dbURL = "jdbc:postgresql:cse132b?user=postgres&password=970303";
                    Connection conn = DriverManager.getConnection(dbURL);

            %>
			
				<%
				// Create the statement
				Statement statement = conn.createStatement();
				ResultSet c_rs = statement.executeQuery("SELECT DISTINCT SECTION.COURSE_NUM, SECTION.FACULTY_NAME FROM SECTION WHERE ((YEAR != 2018 AND QUARTER <> 'Spring') OR (YEAR < 2018))");				
				%>
				<!-- Add an HTML table header row to format the results -->
				<table border="0"><th><font face = "Arial Black" size = "6">Report III - part d Avg Grade</font></th></table>
					<table border="1">
						<form action="report3_d.jsp" method="get">
							<input type="hidden" value="choose" name="action">
						<tr>
							<th>Quarter Selection</th>	
							<th><name="selection" size="25">
							<select name = "selection">
								<% 
									while (c_rs.next()){
								%>
									 <option value="<%= c_rs.getString("COURSE_NUM") %>,<%= c_rs.getString("FACULTY_NAME") %>"><%= c_rs.getString("COURSE_NUM") %> - <%= c_rs.getString("FACULTY_NAME") %></option>	
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

					String before_parse = request.getParameter("selection");
					String[] tokens = before_parse.split(",");
					String course_num = tokens[0];
					String faculty_name = tokens[1];					
				
					//get the section ID from the selection
					PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT YEAR FROM SECTION WHERE COURSE_NUM = ? AND FACULTY_NAME = ? AND ((YEAR != 2018 AND QUARTER <> 'Spring') OR (YEAR < 2018))");
					pstmt.setString(1, course_num);
					pstmt.setString(2, faculty_name);

					ResultSet rs = pstmt.executeQuery();	
					
					int a_grade = 0;
					int b_grade = 0;
					int c_grade = 0;
					int d_grade = 0;
					int other = 0;
					double overall = 0;
					int stuNum = 0;
					
					//loop for each year
					while(rs.next()){
						PreparedStatement subquery = conn.prepareStatement("SELECT SECTION_ID FROM SECTION WHERE COURSE_NUM = ? AND FACULTY_NAME = ? AND YEAR = ?");
						subquery.setString(1, course_num);
						subquery.setString(2, faculty_name);
						subquery.setInt(3, rs.getInt("YEAR"));
						
						ResultSet y_rs = subquery.executeQuery();
						
						int atemp = 0;
						int btemp = 0;
						int ctemp = 0;
						int dtemp = 0;
						int othertemp = 0;
						int stuNumtemp = 0;
						double overalltemp = 0;
						
						while(y_rs.next()){
							//get all students who took this section in the past and count the grades
							PreparedStatement stemp = conn.prepareStatement("SELECT GRADE FROM TAKEN WHERE SECTION_ID = ?");
							stemp.setInt(1, y_rs.getInt("SECTION_ID"));
							ResultSet stempRS = stemp.executeQuery();
							
							while(stempRS.next()){
								//get the grade as gpa numbers
								if(!(stempRS.getString("GRADE").contains("F")) && !(stempRS.getString("GRADE").contains("IN")) && !(stempRS.getString("GRADE").contains("S")) && !(stempRS.getString("GRADE").contains("U"))){
									PreparedStatement gpa = conn.prepareStatement("SELECT NUMBER_GRADE FROM GRADE_CONVERSION WHERE LETTER_GRADE = ?");
									gpa.setString(1, stempRS.getString("GRADE"));
									ResultSet gpaRS = gpa.executeQuery();
									if(gpaRS.next()){
										overalltemp = overalltemp + gpaRS.getBigDecimal(1).doubleValue();
										overall = overall + gpaRS.getBigDecimal(1).doubleValue();
										stuNum++;
										stuNumtemp++;
									}
								}
				
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
							<table border="0"><th><font face = "Monospace" size = "6"><%= rs.getInt("YEAR")%></font></th></table>
							<table border="0">							
							<% 	
								int length = Math.max(Math.max(atemp, btemp),Math.max(ctemp, dtemp));
								while(length > 0){
							%>
								<tr>
								<% 	
									if(atemp > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										atemp--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(btemp > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										btemp--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(ctemp > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										ctemp--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(dtemp > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										dtemp--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(othertemp > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										othertemp--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								</tr>
							<%
									length--;
								}
							%>	
							
							<tr>
								<th style="border-top: thin solid;">A</th>
								<th style="border-top: thin solid;">B</th>
								<th style="border-top: thin solid;">C</th>
								<th style="border-top: thin solid;">D</th>
								<th style="border-top: thin solid;">--</th>
							</tr>
							</table>
							
							<table border="1">
							<tr>
								<th style="border-bottom: thin solid;">OverallGPA: <%=overalltemp%> / <%=stuNumtemp%> = <%=overalltemp/stuNumtemp%></th>
							</tr>							
							</table>
								
						<%	
						y_rs.close();
					}
					
					
					%>
						<table border="0"><th><font face = "Monospace" size = "6">Course ID <%= course_num%> <%= faculty_name%></font></th></table>
				
						<table border="0"><th style="border-bottom: thin solid;"><font face = "Monospace" size = "5">Overall Grade Distribution</font></th></table>
						<table border="0">							
							<% 	
								int length = Math.max(Math.max(a_grade, b_grade),Math.max(c_grade, d_grade));
								while(length > 0){
							%>
								<tr>
								<% 	
									if(a_grade > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										a_grade--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(b_grade > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										b_grade--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(c_grade > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										c_grade--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(d_grade > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										d_grade--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								<% 	
									if(other > 0){
										%>
										<td height="20" bgcolor="#FF0000"> </td>
										<%
										other--;
									}
									else{
										%>
										<td height="20"> </td>
										<%
									}
								%>
								</tr>
							<%
									length--;
								}
							%>	
							
							<tr>
								<th style="border-top: thin solid;">A</th>
								<th style="border-top: thin solid;">B</th>
								<th style="border-top: thin solid;">C</th>
								<th style="border-top: thin solid;">D</th>
								<th style="border-top: thin solid;">--</th>
							</tr>
							</table>
							
							<table border="1">
							<tr>
								<th style="border-bottom: thin solid;">OverallGPA: <%=overall%> / <%=stuNum%> = <%=overall/stuNum%></th>
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
