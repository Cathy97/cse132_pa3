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

            <%-- -------- INSERT Code -------- --%>
            <%
                    String action = request.getParameter("action");
                    // Check if an insertion is requested
                    if (action != null && action.equals("choose")) {
						
                        conn.setAutoCommit(false);  

						PreparedStatement empty = conn.prepareStatement("DELETE FROM NOTPOSSIBLE_TEMP");
						empty.executeUpdate();
						conn.commit();						
					
						//get all students who takes this section
						PreparedStatement pstmt = conn.prepareStatement("SELECT DISTINCT SSN FROM TAKES WHERE SECTION_ID = ?");
						pstmt.setInt(1, Integer.parseInt(request.getParameter("SECTION_ID")));
  
						ResultSet rs = pstmt.executeQuery();			
						%>
						<table border="0"><th><font face = "Monospace" size = "6">Available Time for Review Session <%= request.getParameter("SECTION_ID")%></font></th></table>
						<%
						//loop for each student who takes this section
						while(rs.next()){
							
							//get all the sections that this student is taking in the corrent quarter
							PreparedStatement stemp = conn.prepareStatement("SELECT MEETING.SECTION_ID, MEETING.CLASS_TYPE, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, START_H, START_AMPM, END_H, END_M, END_AMPM FROM MEETING INNER JOIN TAKES ON TAKES.SSN = ? AND MEETING.SECTION_ID = TAKES.SECTION_ID");
						    stemp.setInt(1, rs.getInt("SSN"));
							ResultSet stempRS = stemp.executeQuery();
							
							//loop each class
							while (stempRS.next()) {								
								if(stempRS.getString("MONDAY") != null){
									int sh = stempRS.getInt("START_H");
									int eh = stempRS.getInt("END_H");
									int em = stempRS.getInt("END_M");									
									
									PreparedStatement query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
									query.setString(1, "Mon");
									query.setInt(2, sh);
									query.executeUpdate();
									
									if(eh != sh && em > 0){
										query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
										query.setString(1, "Mon");
										query.setInt(2, sh);
										query.executeUpdate();
									}
									conn.commit();
								}
								if(stempRS.getString("TUESDAY") != null){
									int sh = stempRS.getInt("START_H");
									int eh = stempRS.getInt("END_H");
									int em = stempRS.getInt("END_M");									
									
									PreparedStatement query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
									query.setString(1, "Tue");
									query.setInt(2, sh);
									query.executeUpdate();
									
									if(eh != sh && em > 0){
										query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
										query.setString(1, "Tue");
										query.setInt(2, sh);
										query.executeUpdate();
									}
									conn.commit();
								}
								if(stempRS.getString("WEDNESDAY") != null){
									int sh = stempRS.getInt("START_H");
									int eh = stempRS.getInt("END_H");
									int em = stempRS.getInt("END_M");
									
									PreparedStatement query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
									query.setString(1, "Wed");
									query.setInt(2, sh);
									query.executeUpdate();
									
									if(eh != sh && em > 0){
										query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
										query.setString(1, "Wed");
										query.setInt(2, sh);
										query.executeUpdate();
									}
									conn.commit();
								}
								if(stempRS.getString("THURSDAY") != null){
									int sh = stempRS.getInt("START_H");
									int eh = stempRS.getInt("END_H");
									int em = stempRS.getInt("END_M");
									
									PreparedStatement query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
									query.setString(1, "Thu");
									query.setInt(2, sh);
									query.executeUpdate();
									
									if(eh != sh && em > 0){
										query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
										query.setString(1, "Thu");
										query.setInt(2, sh);
										query.executeUpdate();
									}
									conn.commit();
								}
								if(stempRS.getString("FRIDAY") != null){
									int sh = stempRS.getInt("START_H");
									int eh = stempRS.getInt("END_H");
									int em = stempRS.getInt("END_M");									
									
									PreparedStatement query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
									query.setString(1, "Fri");
									query.setInt(2, sh);
									query.executeUpdate();
									
									if(eh != sh && em > 0){
										query = conn.prepareStatement("INSERT INTO NOTPOSSIBLE_TEMP VALUES (?, ?)");
										query.setString(1, "Fri");
										query.setInt(2, sh);
										query.executeUpdate();
									}
									conn.commit();
								}
							}
							stempRS.close();
						}
						rs.close();
							
						
						//get the date from the CALENDAR for the starting day & end day
						String stMonth = request.getParameter("startMonth_list");
						int stDay = Integer.parseInt(request.getParameter("startDay_list"));
						String edMonth = request.getParameter("endMonth_list");
						int edDay = Integer.parseInt(request.getParameter("endDay_list"));

						//loop through time period
						if(stMonth.equals(edMonth)){							
							while(stDay <= edDay){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, stMonth);
								dateQuery.setInt(2, stDay);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT * FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("startMonth_list")%> <%= stDay%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								stDay++;
							}
						}
						else if(stMonth.equals("April") && edMonth.equals("May")){	
							while(stDay <= 31){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, stMonth);
								dateQuery.setInt(2, stDay);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("startMonth_list")%> <%= stDay%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								stDay++;
							}
							
							int secondMonth = 1;
							while(secondMonth <= edDay){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, edMonth);
								dateQuery.setInt(2, secondMonth);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("endMonth_list")%> <%= secondMonth%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								secondMonth++;
							}
						}
						else if(stMonth.equals("May") && edMonth.equals("June")){	
							while(stDay <= 29){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, stMonth);
								dateQuery.setInt(2, stDay);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("startMonth_list")%> <%= stDay%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								stDay++;
							}
							
							int secondMonth = 1;
							while(secondMonth <= edDay){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, edMonth);
								dateQuery.setInt(2, secondMonth);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("endMonth_list")%> <%= secondMonth%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								secondMonth++;
							}
						}
						else if(stMonth.equals("April") && edMonth.equals("June")){	
							while(stDay <= 31){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, stMonth);
								dateQuery.setInt(2, stDay);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("startMonth_list")%> <%= stDay%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								stDay++;
							}
							
							//Feb which contains 29 days
							int febDay = 1;
							String feb = "February";
							while(febDay <= 29){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, feb);
								dateQuery.setInt(2, febDay);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= feb%> <%= febDay%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								febDay++;
							}
							
							int secondMonth = 1;
							while(secondMonth <= edDay){								
								PreparedStatement dateQuery = conn.prepareStatement("SELECT DATE FROM CALENDAR WHERE MONTH = ? AND DAY = ?");
								dateQuery.setString(1, edMonth);
								dateQuery.setInt(2, secondMonth);
								ResultSet dateQuery_rs  = dateQuery.executeQuery();
								
								String s_date = "";
								if(dateQuery_rs.next())
									s_date = dateQuery_rs.getString("DATE");
								
								PreparedStatement conflict = conn.prepareStatement("SELECT DISTINCT REVIEWTIME.DATE, REVIEWTIME.RESERVE_TIME FROM REVIEWTIME WHERE NOT EXISTS (SELECT 1 FROM NOTPOSSIBLE_TEMP WHERE REVIEWTIME.DATE = NOTPOSSIBLE_TEMP.DATE AND REVIEWTIME.RESERVE_TIME = NOTPOSSIBLE_TEMP.TIME) AND REVIEWTIME.DATE = ?");
								conflict.setString(1, s_date);
								ResultSet conflict_rs = conflict.executeQuery();
								%>
								
								<table border="0">
								<%
								while (conflict_rs.next()) {  
									//time formate
									String rtime = "";
									int rsh = conflict_rs.getInt("RESERVE_TIME");
									int reh = rsh + 1;
									String rs_ampm = "AM";
									String re_ampm = "AM";
									if(rsh >= 12){
										if(rsh > 12)
											rsh = rsh - 12;
										rs_ampm = "PM";
									}
									if(reh >= 12){
										if(reh > 12)
											reh = reh - 12;
										re_ampm = "PM";
									}
										
									rtime = rsh + ":00 " + rs_ampm + " - " + reh + ":00 " + re_ampm;
								%>
									<tr>
										<td>
										<%= request.getParameter("endMonth_list")%> <%= secondMonth%> <%= conflict_rs.getString("DATE")%> <%= rtime%>
										</td>
									</tr>
								<%
								}
									conflict_rs.close();
								%>
								</table>
								<%
								dateQuery_rs.close();
								secondMonth++;
							}
						}
					//Commit transaction					
					conn.commit();
					conn.setAutoCommit(true);				
				}
			%>
				


            <%-- -------- SELECT Statement Code -------- --%>
            <%
                    // Create the statement
                    Statement statement = conn.createStatement();

                    ResultSet rs = statement.executeQuery("SELECT DISTINCT CLASS.COURSE_NUM, SECTION.SECTION_ID FROM CLASS INNER JOIN SECTION ON CLASS.COURSE_NUM = SECTION.COURSE_NUM AND SECTION.YEAR = 2018 AND SECTION.QUARTER = 'sp2018'");
            %>

            <!-- Add an HTML table header row to format the results -->
			<table border="0"><th><font face = "Arial Black" size = "6">Report II Schedule for Review Session</font></th></table>
                <table border="1">
					<form action="report2prof.jsp" method="get">
						<input type="hidden" value="choose" name="action">
					<tr>
						<th>Section ID</th>	
						<th><name="SECTION_ID" size="20">
                            <select name = "SECTION_ID">
                                <% 
                                    while (rs.next()){
                                %>
                                     <option value=<%= rs.getInt("SECTION_ID")%>><%= rs.getInt("SECTION_ID") %> |<%= rs.getString("COURSE_NUM") %> </option>
                                <%
                                    }
                                %>
                                 
                            </select>
						</th>
						
						<th>Time Period</th>	
						<th>
							<select name="startMonth_list">
								<option>April</option>
								<option>May</option>
								<option>June</option>
							</select>
							<select name = "startDay_list">
							<%
								for(int i = 1; i < 32; i++){
							%>								
								<option><%=i%></option>
							<%
								}
							%>
							</select>							
						</th>
						<th style="border:thin;"> -- </th>
						<th>
							<select name="endMonth_list">
								<option>April</option>
								<option>May</option>
								<option>June</option>
							</select>
							<select name = "endDay_list">
							<%
								for(int i = 1; i < 32; i++){
							%>								
								<option><%=i%></option>
							<%
								}
							%>
							</select>							
						</th>

					    <%-- Button --%>
                            <td>
                                <input type="submit" name="choose" value="Submit">
                            </td>
					</form>
					</tr>
				</table>

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
				
            </td>
        </tr>
    </table>
</body>

</html>
