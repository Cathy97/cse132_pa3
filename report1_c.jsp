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
                Connection conn = null;
                Statement statement = null;
                Statement statement2 = null;
                ResultSet rs = null;
                ResultSet rs2 = null;
                ResultSet rs3 = null;
                ResultSet rs4 = null;
                ResultSet student = null;
                ResultSetMetaData rsmd1 = null;
                ResultSetMetaData rsmd2 = null;
                ResultSetMetaData rsmd3 = null;
                ResultSetMetaData rsmd4 = null;
                int columnCount4 = 0;
                int columnCount2 = 0;
                int columnCount1 = 0;
                int columnCount = 0;
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
                    if (action != null && action.equals("search")) {

                        // Begin transaction
                        conn.setAutoCommit(false);

                        // Create the statement
                        //statement = conn.createStatement();
                        PreparedStatement pstmt3 = conn.prepareStatement(
                            "SELECT S.SSN AS SSN, S.FIRSTNAME AS FIRSTNAME, S.MIDDLENAME AS MIDDLENAME, S.LASTNAME AS LASTNAME FROM STUDENT S WHERE S.SSN = ?");
                        pstmt3.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        rs3 = pstmt3.executeQuery();
                        rsmd3 = rs3.getMetaData();
                        columnCount2 = rsmd3.getColumnCount();

                        // Use the created statement to SELECT
                        // the student attributes FROM the Student table.
                        PreparedStatement pstmt = conn.prepareStatement(
                            "SELECT S.QUARTER AS QUARTER, S.YEAR AS YEAR, CL.COURSE_NUM AS COURSE_NUM, CL.TITLE AS TITLE, T.GRADE AS GRADE, T.UNITS AS UNITS FROM SECTION S, TAKEN T, STUDENT ST, CLASS CL WHERE ST.SSN = ? AND ST.SSN = T.SSN AND T.SECTION_ID = S.SECTION_ID AND CL.COURSE_NUM = S.COURSE_NUM ORDER BY S.QUARTER, S.YEAR");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        rs = pstmt.executeQuery();
                        rsmd1 = rs.getMetaData();
                        columnCount1 = rsmd1.getColumnCount();

                        PreparedStatement pstmt2 = conn.prepareStatement(
                            "SELECT S.QUARTER AS QUARTER, S.YEAR AS YEAR, SUM(GC.NUMBER_GRADE)/COUNT(*) AS GPA FROM TAKEN T, STUDENT ST, GRADE_CONVERSION GC, SECTION S WHERE ST.SSN = ? AND ST.SSN = T.SSN AND T.GRADE = GC.LETTER_GRADE AND T.SECTION_ID = S.SECTION_ID GROUP BY S.QUARTER, S.YEAR");
                        pstmt2.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        rs2 = pstmt2.executeQuery();
                        rsmd2 = rs2.getMetaData();
                        columnCount = rsmd2.getColumnCount();

                        PreparedStatement pstmt4 = conn.prepareStatement(
                            "SELECT SUM(GC.NUMBER_GRADE)/COUNT(*) AS GPA FROM TAKEN T, STUDENT ST, GRADE_CONVERSION GC WHERE ST.SSN = ? AND ST.SSN = T.SSN AND T.GRADE = GC.LETTER_GRADE GROUP BY T.SSN");
                        pstmt4.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        rs4 = pstmt4.executeQuery();
                        rsmd4 = rs4.getMetaData();
                        columnCount4 = rsmd4.getColumnCount();                        
                        
                        

                        // Commit transaction
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>
            <%-- -------- SELECT Statement Code -------- --%>
            <%
                statement2 = conn.createStatement();
                student = statement2.executeQuery("SELECT S.SSN AS SSN, S.FIRSTNAME AS FIRSTNAME, S.MIDDLENAME AS MIDDLENAME, S.LASTNAME AS LASTNAME FROM STUDENT S");

            %>

            <!-- Add an HTML table header row to format the results -->
            <table border="0"><th><font face = "Arial Black" size = "6">Report</font></th></table>
                <table border="1">
                    <tr>
                        <th>Student ID</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <form action="report1_c.jsp" method="get">
                            <input type="hidden" value="search" name="action">
                            <th><name="SSN" size="20">
                            <select name = "SSN">
                                <% 
                                    while ( student.next() ){
                                %>
                                     <option value="<%= student.getString("SSN") %>"><%= student.getString("SSN") %> | <%= student.getString("FIRSTNAME") %>, <%=student.getString("LASTNAME") %></option>
                                <%
                                    }
                                %>
                                 
                            </select></th>
                            <th><input type="submit" value="search"></th>
                        </form>
                    </tr>     
                </table>          

            <%-- -------- Iteration Code -------- --%>
            <%
                    // Iterate over the ResultSet        
                    if ( columnCount2!=0 ) {      
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Student Info</font></th></table>
                <table border="1">
                    <tr>
            <%
                int l = 1;
                String name4 = null;
                for (l = 1; l <= columnCount2; l++ ) {
                        name4 = rsmd3.getColumnName(l);
            %>
                        <th>
                            <%= name4 %>
                        </th>
            <%
                }
            %>       
                    </tr>
                    <tr>    
            <%
                    while(rs3.next()){
                    for (l = 1; l <= columnCount2; l++){
                    name4 = rsmd3.getColumnName(l);
            %>
                    <td align="middle"> <input value="<%= rs3.getString(name4) %>" 
                    name="<%= rs3.getString(name4) %>" size="15" readonly></td>
            <%
                    }
                }
            %>
                    </tr>
                </table>
            <%
                    
                }    
                    // Iterate over the ResultSet        
                    if ( columnCount1!=0 ) {      
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">All Classes Taken By Student</font></th></table>
                <table border="1">
                    <tr>
            <%
                int i = 0;
                String name = null;
                for ( i = 1; i <= columnCount1; i++ ) {
                        name = rsmd1.getColumnName(i);
            %>
                        <th>
                            <%= name %>
                        </th>
            <%
                    }
            %>       
                    </tr>
            <%   
                while(rs.next() ){
            %> 
                    <tr>
            <%     
                
                    for (i = 1; i <= columnCount1; i++){
                    name = rsmd1.getColumnName(i);
            %>
                    <td align="middle"> <input value="<%= rs.getString(name) %>" 
                    name="<%= rs.getString(name) %>" size="15" readonly></td>
            <%
                    }
            %>
                    </tr>
            <%
                }
            %>
                </table>
            <%
                    }
                if(columnCount != 0){
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">GPA For Each Quarter</font></th></table>
                <table border="1">
                    <tr>
            <%
                
                    int k=1;
                    for (k = 1; k <= columnCount; k++ ) {
                        String name2 = rsmd2.getColumnName(k);
            %>
                        <th><%= name2 %></th>
            <%
                    }
            %>
                    </tr>
            <%
                    
                    while ( rs2.next() ) {      
            %>
                    <tr>
            <%
                            for(k=1; k<= columnCount; k++){
                                String name3 = rsmd2.getColumnName(k);
            %>
                                <td align="middle"> <input value="<%= rs2.getString(name3) %>" 
                                    name="<%= rs2.getString(name3) %>" size="15" readonly></td>
            <%
                            }
            %>
                    </tr>
                
            <%
                    }
            %>
            </table>
            <%
                }
                if(columnCount4 != 0){
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Overall GPA</font></th></table>
                <table border="1">
                    <tr>
            <%
                    int m=1;
                    String name5 = null;
                    for (m = 1; m <= columnCount4; m++ ) {
                        name5 = rsmd4.getColumnName(m);
            %>
                        <th><%= name5 %></th>
            <%
                    }
            %>
                    </tr>
            <%
                    
                    while ( rs4.next() ) {      
            %>
                    <tr>
            <%
                            for(m=1; m<= columnCount4; m++){
                                name5 = rsmd4.getColumnName(m);
            %>
                                <td align="middle"> <input value="<%= rs4.getString(name5) %>" 
                                    name="<%= rs4.getString(name5) %>" size="15" readonly></td>
            <%
                            }
            %>
                    </tr>
                
            <%
                    }
            %>
            </table>
            <%
                }
            %>


            <%-- -------- Close Connection Code -------- --%>
            <%

                } catch (SQLException sqle) {
                    out.println(sqle.getMessage());
                } catch (Exception e) {
                    out.println(e.getMessage());
                } finally{
                    // Close the ResultSet
                    if (rs!=null)
                        rs.close();

                    if (rs2!=null)
                        rs2.close();

                    if (rs3!=null)
                        rs3.close();

                    if (rs4!=null)
                        rs4.close();

                    if (student!=null)
                        student.close();
    
                    // Close the Statement
                    if(statement!=null)
                        statement.close();

                    if(statement2!=null)
                        statement2.close();
    
                    // Close the Connection
                    if(conn!=null)
                        conn.close();
                }
            %>

</body>

</html>
