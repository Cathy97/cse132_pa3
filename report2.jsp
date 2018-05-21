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

            <%-- -------- INSERT Code -------- --%>
            <%
                    String action = request.getParameter("action");
                    // Check if an insertion is requested
                    if (action != null && action.equals("choose")) {
						
                        conn.setAutoCommit(false);  

						PreparedStatement empty = conn.prepareStatement("DELETE FROM S_TEMP");
						empty.executeUpdate();
						conn.commit();						
					
						int ssn = Integer.parseInt(request.getParameter("SSN"));
							
						//get Section_ID and Class_type from TAKES table for that particular student
						PreparedStatement pstmt = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE FROM TAKES WHERE SSN = ?");
						pstmt.setInt(1, ssn);
						ResultSet rs = pstmt.executeQuery();
						%>
						<table border="0"><th><font face = "Monospace" size = "6">STUDENT <%= request.getParameter("")%> conflits with the following sections</font></th></table>
						<%
						//get each section info from MEETING table
						while(rs.next()){
							//get all the sections that this student is taking in the corrent quarter
							PreparedStatement stemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID = ? AND CLASS_TYPE = ?");
						    stemp.setInt(1, rs.getInt("SECTION_ID"));
							stemp.setString(2, rs.getString("CLASS_TYPE"));
							ResultSet stempRS = stemp.executeQuery();
							
							int secID = rs.getInt("SECTION_ID");
							//loop through each class that the student is taking in the corrent quarter
							while (stempRS.next()) { 
								//get the start hour and end hour; if PM then add 12
								int sh = stempRS.getInt("START_H");
								int eh = stempRS.getInt("END_H");
								int sm = stempRS.getInt("START_M");
								int em = stempRS.getInt("END_M");
								
								//check day by day
								if(stempRS.getString("MONDAY") != null){
									PreparedStatement dayTemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID <> ? AND MONDAY = 'M'");
									dayTemp.setInt(1, secID);
									ResultSet dayQ_rs = dayTemp.executeQuery();
									
									//loop through all courses offered in the day specified
									while(dayQ_rs.next()){										
										//get the start hour and end hour; if PM then add 12
										int check_sh = dayQ_rs.getInt("START_H");
										int check_eh = dayQ_rs.getInt("END_H");
										int check_sm = dayQ_rs.getInt("START_M");
										int check_em = dayQ_rs.getInt("END_M");
										
										//check whether time conflicts, add the conflits ones to the s_temp table
										//(MEETING.START_H < @eh OR (MEETING.START_H = @eh AND MEETING.START_M < @em)) AND
										//(MEETING.END_H > @sh OR (MEETING.END_H = @sh AND MEETING.END_M > @sm))			
										if((sh < check_eh || (sh == check_eh && sm < check_em)) && (eh > check_sh || (eh == check_sh && em > check_sm))){
											//conflict
											PreparedStatement query = conn.prepareStatement("INSERT INTO S_TEMP VALUES (?,?)");
											query.setInt(1, secID);
											query.setInt(2, dayQ_rs.getInt("SECTION_ID"));
											query.executeUpdate();
											conn.commit();										
										}										
									}
									dayQ_rs.close();
								}
								if(stempRS.getString("TUESDAY") != null){
									PreparedStatement dayTemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID <> ? AND TUESDAY = 'Tu'");
									dayTemp.setInt(1, secID);
									ResultSet dayQ_rs = dayTemp.executeQuery();
									
									//loop through all courses offered in the day specified
									while(dayQ_rs.next()){										
										//get the start hour and end hour; if PM then add 12
										int check_sh = dayQ_rs.getInt("START_H");
										int check_eh = dayQ_rs.getInt("END_H");
										int check_sm = dayQ_rs.getInt("START_M");
										int check_em = dayQ_rs.getInt("END_M");
										
										//check whether time conflicts, add the conflits ones to the s_temp table
										if((sh < check_eh || (sh == check_eh && sm < check_em)) && (eh > check_sh || (eh == check_sh && em > check_sm))){
											//conflict
											PreparedStatement query = conn.prepareStatement("INSERT INTO S_TEMP VALUES (?,?)");
											query.setInt(1, secID);
											query.setInt(2, dayQ_rs.getInt("SECTION_ID"));
											query.executeUpdate();
											conn.commit();										
										}																					
									}
									dayQ_rs.close();
								}
								if(stempRS.getString("WEDNESDAY") != null){
									PreparedStatement dayTemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID <> ? AND WEDNESDAY = 'W'");
									dayTemp.setInt(1, secID);
									ResultSet dayQ_rs = dayTemp.executeQuery();
									
									//loop through all courses offered in the day specified
									while(dayQ_rs.next()){										
										//get the start hour and end hour; if PM then add 12
										int check_sh = dayQ_rs.getInt("START_H");
										int check_eh = dayQ_rs.getInt("END_H");
										int check_sm = dayQ_rs.getInt("START_M");
										int check_em = dayQ_rs.getInt("END_M");
										
										//check whether time conflicts, add the conflits ones to the s_temp table
										if((sh < check_eh || (sh == check_eh && sm < check_em)) && (eh > check_sh || (eh == check_sh && em > check_sm))){
											//conflict
											PreparedStatement query = conn.prepareStatement("INSERT INTO S_TEMP VALUES (?,?)");
											query.setInt(1, secID);
											query.setInt(2, dayQ_rs.getInt("SECTION_ID"));
											query.executeUpdate();
											conn.commit();										
										}												
									}
									dayQ_rs.close();
								}
								if(stempRS.getString("THURSDAY") != null){
									PreparedStatement dayTemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID <> ? AND THURSDAY = 'Th'");
									dayTemp.setInt(1, secID);
									ResultSet dayQ_rs = dayTemp.executeQuery();
									
									//loop through all courses offered in the day specified
									while(dayQ_rs.next()){										
										//get the start hour and end hour; if PM then add 12
										int check_sh = dayQ_rs.getInt("START_H");
										int check_eh = dayQ_rs.getInt("END_H");
										int check_sm = dayQ_rs.getInt("START_M");
										int check_em = dayQ_rs.getInt("END_M");
										
										//check whether time conflicts, add the conflits ones to the s_temp table
										if((sh < check_eh || (sh == check_eh && sm < check_em)) && (eh > check_sh || (eh == check_sh && em > check_sm))){
											//conflict
											PreparedStatement query = conn.prepareStatement("INSERT INTO S_TEMP VALUES (?,?)");
											query.setInt(1, secID);
											query.setInt(2, dayQ_rs.getInt("SECTION_ID"));
											query.executeUpdate();
											conn.commit();										
										}													
									}
									dayQ_rs.close();
								}
								if(stempRS.getString("FRIDAY") != null){
									PreparedStatement dayTemp = conn.prepareStatement("SELECT SECTION_ID, CLASS_TYPE, START_H, START_M, START_AMPM, END_H, END_M, END_AMPM FROM MEETING WHERE SECTION_ID <> ? AND FRIDAY = 'F'");
									dayTemp.setInt(1, secID);
									ResultSet dayQ_rs = dayTemp.executeQuery();
									
									//loop through all courses offered in the day specified
									while(dayQ_rs.next()){										
										//get the start hour and end hour; if PM then add 12
										int check_sh = dayQ_rs.getInt("START_H");
										int check_eh = dayQ_rs.getInt("END_H");
										int check_sm = dayQ_rs.getInt("START_M");
										int check_em = dayQ_rs.getInt("END_M");
										
										//check whether time conflicts, add the conflits ones to the s_temp table
										if((sh < check_eh || (sh == check_eh && sm < check_em)) && (eh > check_sh || (eh == check_sh && em > check_sm))){
											//conflict
											PreparedStatement query = conn.prepareStatement("INSERT INTO S_TEMP VALUES (?,?)");
											query.setInt(1, secID);
											query.setInt(2, dayQ_rs.getInt("SECTION_ID"));
											query.executeUpdate();
											conn.commit();										
										}										
									}
									dayQ_rs.close();
								}
							}							
						}
						Statement statement = conn.createStatement();
						ResultSet conflict_rs = statement.executeQuery("SELECT DISTINCT S_TEMP.SECTION_ID, S_TEMP.CONFLICT_ID FROM S_TEMP");
						%>
						
						<table border="0">
						<%
							while (conflict_rs.next()) {
								int conflictID = conflict_rs.getInt("CONFLICT_ID");
								int secID = conflict_rs.getInt("SECTION_ID");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT CLASS.COURSE_NUM, CLASS.TITLE FROM CLASS INNER JOIN SECTION ON CLASS.COURSE_NUM = SECTION.COURSE_NUM AND SECTION.SECTION_ID = ?");
								conflict.setInt(1, conflictID);
								ResultSet conflictRs = conflict.executeQuery();
								PreparedStatement section = conn.prepareStatement("SELECT DISTINCT CLASS.COURSE_NUM, CLASS.TITLE FROM CLASS INNER JOIN SECTION ON CLASS.COURSE_NUM = SECTION.COURSE_NUM AND SECTION.SECTION_ID = ?");
								section.setInt(1, secID);
								ResultSet sectionRs = section.executeQuery();
								
								String conflictCN = "";
								String conflictT = "";
								String sectionCN = "";
								String sectionT = "";
								if(conflictRs.next()){
									conflictCN = conflictRs.getString(1);
									conflictT = conflictRs.getString(2);
								}
								if(sectionRs.next()){
									sectionCN = sectionRs.getString(1);
									sectionT = sectionRs.getString(2);
								}							
						%>
								<tr style="border-bottom: thin solid;">
									<td align="middle">
											<input value="<%= conflictID%>" 
												name="tempSECTION_ID" size="1" style="text-align:center;" readonly>
									</td>
									<td align="middle">
											<input value="<%= conflictCN%>" 
												name="tempCOURSE_NUM" size="10" readonly>
									</td>
									<td align="middle">
											<input value="<%= conflictT%>" 
												name="tempTITLE" size="30" readonly>
									</td>
									
									<td align="middle">[Conflict with]</td>
									
									<td align="middle">
											<input value="<%= secID%>" 
												name="tempSECTION_ID" size="1" style="text-align:center;" readonly>
									</td>
									<td align="middle">
											<input value="<%= sectionCN%>" 
												name="tempCOURSE_NUM" size="10" readonly>
									</td>
									<td align="middle">
											<input value="<%= sectionT%>" 
												name="tempTITLE" size="30" readonly>
									</td>
								</tr>
						<%
								conflictRs.close();
								sectionRs.close();
							}	
						%>
						</table>
				
				<%				
						conflict_rs.close();
						statement.close();
						rs.close();
						//Commit transaction
						conn.commit();
						conn.setAutoCommit(true);
					}
				%>


            <%-- -------- SELECT Statement Code -------- --%>
            <%
                    // Create the statement
                    Statement statement = conn.createStatement();

                    // Use the created statement to SELECT
                    // the student attributes FROM the Student table.
                    ResultSet rs = statement.executeQuery
                        ("SELECT DISTINCT STUDENT.SSN, STUDENT.FIRSTNAME, STUDENT.MIDDLENAME, STUDENT.LASTNAME FROM STUDENT INNER JOIN TAKES ON STUDENT.SSN = TAKES.SSN");
						
					Statement statement2 = conn.createStatement();	
					ResultSet students = statement2.executeQuery("SELECT DISTINCT S.SSN AS SSN, S.FIRSTNAME AS FIRSTNAME, S.MIDDLENAME AS MIDDLENAME, S.LASTNAME AS LASTNAME FROM STUDENT S, TAKES T WHERE S.ENROLL = 'Yes' AND S.SSN = T.SSN");
            %>

            <!-- Add an HTML table header row to format the results -->
			<table border="0"><th><font face = "Arial Black" size = "6">Report II Currently Enrolled Students</font></th></table>
                <table border="1">
					<form action="report2.jsp" method="get">
						<input type="hidden" value="choose" name="action">
					<tr>
						<th>Student ID</th>	
						<th><name="SSN" size="20">
                            <select name = "SSN">
                                <% 
                                    while ( students.next() ){
                                %>
                                     <option value="<%= students.getString("SSN") %>"><%= students.getString("SSN") %> | <%= students.getString("FIRSTNAME") %>, <%= students.getString("MIDDLENAME") %>, <%= students.getString("LASTNAME") %></option>
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
				<table border="1">	
                    <tr>
                        <th>Student SSN</th>
						<th>First Name</th>
						<th>Middle Name</th>
                        <th>Last Name</th>
                    </tr>				

            <%-- -------- Iteration Code -------- --%>
            <%
                    // Iterate over the ResultSet        
                    while ( rs.next() ) {      
            %>
                    <tr>

						<%-- Get the SSN, which is a number --%>
						<td align="middle">
							<input value="<%= rs.getInt("SSN") %>" 
								name="SSN" size="10" readonly>
						</td>


						<%-- Get the FIRSTNAME --%>
						<td align="middle">
							<input value="<%= rs.getString("FIRSTNAME") %>"
								name="FIRSTNAME" size="15" style="text-align:center;" readonly>
						</td>

						<%-- Get the MIDDLENAME --%>
						<td align="middle">
							<input value="<%= rs.getString("MIDDLENAME") %>" 
								name="MIDDLENAME" size="15" style="text-align:center;" readonly>
						</td>

						<%-- Get the LASTNAME --%>
						<td align="middle">
							<input value="<%= rs.getString("LASTNAME") %>" 
								name="LASTNAME" size="15" style="text-align:center;" readonly>
						</td>
                    </tr>
            <%
                    }
            %>

            <%-- -------- Close Connection Code -------- --%>
            <%
                    // Close the ResultSet
                    rs.close();
    
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
