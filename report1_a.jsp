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
                ResultSet students = null;
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
                        PreparedStatement pstmt = conn.prepareStatement(
                            "SELECT SSN, FIRSTNAME, MIDDLENAME, LASTNAME FROM STUDENT S WHERE S.SSN = ?");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        rs = pstmt.executeQuery();
                        rsmd1 = rs.getMetaData();
                        columnCount1 = rsmd1.getColumnCount();


                        PreparedStatement pstmt2 = conn.prepareStatement(
                            "SELECT DISTINCT CLS.TITLE AS TITLE, CRS.COURSE_NUM AS COURSE, SECT.QUARTER AS QUARTER, SECT.YEAR AS YEAR, T.UNITS AS UNITS, SECT.SECTION_ID AS SECTION_ID, CRS.GRADE_OPT AS GRADE_OPT, SECT.FACULTY_NAME AS PROFESSOR FROM STUDENT STD, SECTION SECT, COURSE CRS, TAKES T , CLASS CLS WHERE STD.SSN = ? AND T.SSN = STD.SSN AND T.SECTION_ID = SECT.SECTION_ID AND SECT.COURSE_NUM = CRS.COURSE_NUM AND CLS.COURSE_NUM = CRS.COURSE_NUM");
                        pstmt2.setInt(1, Integer.parseInt(request.getParameter("SSN")));
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
                students = statement2.executeQuery("SELECT DISTINCT S.SSN AS SSN, S.FIRSTNAME AS FIRSTNAME, S.MIDDLENAME AS MIDDLENAME, S.LASTNAME AS LASTNAME FROM STUDENT S, TAKES T WHERE S.ENROLL = 'Yes' AND S.SSN = T.SSN");

            %>

            <!-- Add an HTML table header row to format the results -->
            <table border="0"><th><font face = "Arial Black" size = "6">Report</font></th></table>
                <table border="1">
                    <tr>
                        <th>Student SSN</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <form action="report1_a.jsp" method="get">
                            <input type="hidden" value="search" name="action">
                            <th><name="SSN" size="20">
                            <select name = "SSN">
                                <% 
                                    while ( students.next() ){
                                %>
                                     <option value=<%= students.getString("SSN") %>><%= students.getString("SSN") %> | <%= students.getString("FIRSTNAME") %>, <%= students.getString("MIDDLENAME") %>, <%= students.getString("LASTNAME") %></option>
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
                <table border="0"><th><font face = "Arial Black" size = "6">Student Info</font></th></table>
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

                            <%-- Get the SSN, which is a number --%>
                            <td align="middle">
                                <input value="<%= rs.getInt("SSN") %>" 
                                    name="SSN" size="10" readonly>
                            </td>

                            <%-- Get the FIRSTNAME --%>
                            <td align="middle">
                                <input value="<%= rs.getString("FIRSTNAME") %>"
                                    name="FIRSTNAME" size="15" readonly>
                            </td>
    
                            <%-- Get the MIDDLENAME --%>
                            <td align="middle">
                                <input value="<%= rs.getString("MIDDLENAME") %>" 
                                    name="MIDDLENAME" size="15" readonly>
                            </td>
    
                            <%-- Get the LASTNAME --%>
                            <td align="middle">
                                <input value="<%= rs.getString("LASTNAME") %>" 
                                    name="LASTNAME" size="15" readonly>
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
                <table border="0"><th><font face = "Arial Black" size = "6">Currently Enrolled Class Info</font></th></table>
                <table border="1">
                    <tr>
            <%
                    for (int k = 1; k <= columnCount; k++ ) {
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

                            <%-- Get the TITLE, which is a number --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("TITLE") %>" 
                                    name="TITLE" size="10" readonly>
                            </td>

                            <%-- Get the COURSE, which is a number --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("COURSE") %>" 
                                    name="COURSE" size="10" readonly>
                            </td>

                            <%-- Get the QUARTER --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("QUARTER") %>"
                                    name="QUARTER" size="15" readonly>
                            </td>
    
                            <%-- Get the YEAR --%>
                            <td align="middle">
                                <input value="<%= rs2.getInt("YEAR") %>" 
                                    name="YEAR" size="15" readonly>
                            </td>
    
                            <%-- Get the UNITS --%>
                            <td align="middle" >
                                <input value="<%= rs2.getString("UNITS") %>" 
                                    name="UNITS" size="15" readonly>
                            </td>

                            <%-- Get the SECTION_ID --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("SECTION_ID") %>" 
                                    name="SECTION_ID" size="15" readonly>
                            </td>

                            <%-- Get the GRADE_OPT --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("GRADE_OPT") %>" 
                                    name="GRADE_OPT" size="15" readonly>
                            </td>

                            <%-- Get the PROFESSOR --%>
                            <td align="middle">
                                <input value="<%= rs2.getString("PROFESSOR") %>" 
                                    name="PROFESSOR" size="15" readonly>
                            </td>

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

                    if (students!=null)
                        students.close();
    
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
