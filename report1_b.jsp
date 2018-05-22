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
                ResultSet classes = null;
                ResultSetMetaData rsmd1 = null;
                ResultSetMetaData rsmd2 = null;
                int columnCount1 = 0;
                int columnCount = 0;
                try {
                    // Load Oracle Driver class file
                    Class.forName("org.postgresql.Driver");
                    String dbURL = "jdbc:postgresql:cse132b?user=postgres&password=970303";
                    conn = DriverManager.getConnection(dbURL);


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

                        // Use the created statement to SELECT
                        // the student attributes FROM the Student table.
                        String before_parse = request.getParameter("class");
                        String[] tokens = before_parse.split(",");
                        String course_num = tokens[0];
                        String quarter = tokens[1];
                        String year = tokens[2];
                        PreparedStatement pstmt = conn.prepareStatement(
                            "SELECT CL.TITLE AS TITLE, CL.COURSE_NUM AS COURSE_NUM, CL.QUARTER AS QUARTER, CL.YEAR AS YEAR FROM CLASS CL WHERE CL.TITLE = ?");
                        pstmt.setString(1, TITLE);
                        
                        rs = pstmt.executeQuery();
                        rsmd1 = rs.getMetaData();
                        columnCount1 = rsmd1.getColumnCount();

                        
                        PreparedStatement pstmt2 = conn.prepareStatement(
                            "SELECT DISTINCT SEC.QUARTER AS QUARTER, SEC.YEAR AS YEAR, ST.SSN AS SSN, ST.FIRSTNAME AS FIRST_NAME, ST.MIDDLENAME AS MIDDLE_NAME, ST.LASTNAME AS LAST_NAME, ST.RESIDENCY AS RESIDENCY, ST.STU_STATUS AS STU_STATUS, ST.ENROLL AS ENROLL, T.GRADE_OPTION AS GRADE, T.UNITS AS UNITS FROM SECTION SEC, TAKES T, STUDENT ST WHERE SEC.TITLE = ? AND SEC.SECTION_ID = T.SECTION_ID AND T.SSN = ST.SSN    UNION SELECT DISTINCT SEC.QUARTER AS QUARTER, SEC.YEAR AS YEAR, ST.SSN AS SSN, ST.ID AS ID, ST.FIRSTNAME AS FIRST_NAME, ST.MIDDLENAME AS MIDDLE_NAME, ST.LASTNAME AS LAST_NAME, ST.RESIDENCY AS RESIDENCY, ST.STU_STATUS AS STU_STATUS, ST.ENROLL AS ENROLL, T.GRADE AS GRADE, T.UNITS AS UNITS FROM SECTION SEC, TAKEN T, STUDENT ST WHERE SEC.TITLE = ? AND SEC.SECTION_ID = T.SECTION_ID AND T.SSN = ST.SSN");
                        pstmt2.setString(1, TITLE);
                        pstmt2.setString(2, TITLE);
                        rs2 = pstmt2.executeQuery();

                        rsmd2 = rs2.getMetaData();
                        columnCount = rsmd2.getColumnCount();

                        
                        
                        // Commit transaction
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>
            <%-- -------- SELECT Statement Code -------- --%>
            <%
                statement2 = conn.createStatement();
                classes = statement2.executeQuery("SELECT CL.QUARTER AS QUARTER, CL.YEAR AS YEAR, CL.COURSE_NUM AS COURSE_NUM, CL.TITLE AS TITLE FROM CLASS CL");

            %>

            <!-- Add an HTML table header row to format the results -->
            <table border="0"><th><font face = "Arial Black" size = "6">Report</font></th></table>
                <table border="1">
                    <tr>
                        <th>Displat Roster For</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <form action="report1_b.jsp" method="get">
                            <input type="hidden" value="search" name="action">
                            <th><name="class" size="20">
                            <select name = "class">
                                <% 
                                    while ( classes.next() ){
                                %>
                                     <option value="<%= classes.getString("TITLE") %> "><%= classes.getString("COURSE_NUM") %> | <%= classes.getString("TITLE") %> | <%= classes.getString("QUARTER") %> - <%= classes.getString("YEAR") %></option>
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
                    if ( columnCount1!=0 ) {      
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Class Info</font></th></table>
                <table border="1">
                    <tr>
            <%
                for (int i = 1; i <= columnCount1; i++ ) {
                        String name = rsmd1.getColumnName(i);
            %>
                        <th>
                            <%= name %>
                        </th>
            <%
                    }
            %>       
                    </tr>    
            <%
                while(rs.next()){
            %>
                    <tr>

                            <%-- Get the TITLE, which is a number --%>
                            <td align="middle">
                                <input value="<%= rs.getString("TITLE") %>" 
                                    name="TITLE" size="10" readonly>
                            </td>

                            <%-- Get the COURSE_NUM --%>
                            <td align="middle">
                                <input value="<%= rs.getString("COURSE_NUM") %>"
                                    name="COURSE_NUM" size="15" readonly>
                            </td>
    
                            <%-- Get the QUARTER --%>
                            <td align="middle">
                                <input value="<%= rs.getString("QUARTER") %>" 
                                    name="QUARTER" size="15" readonly>
                            </td>
    
                            <%-- Get the YEAR --%>
                            <td align="middle">
                                <input value="<%= rs.getInt("YEAR") %>" 
                                    name="YEAR" size="15" readonly>
                            </td>

                    </tr>
            <%
                }
            %>
                </table>
            <%
                    }
                if(columnCount != 0){
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Students Enrolled in Class Info</font></th></table>
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

                    if (classes!=null)
                        classes.close();
    
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
