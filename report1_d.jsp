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
                Statement statement3 = null;
                ResultSet rs = null;
                ResultSet rs2 = null;
                ResultSet rs3 = null;
                ResultSet rs4 = null;
                ResultSet student = null;
                ResultSet degree = null;
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
                    String dbURL = "jdbc:postgresql:cse132b?user=postgres&password=admin";
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
                        PreparedStatement pstmt3 = conn.prepareStatement(
                            "SELECT C.NAME AS CATEGORY_NAME, MAX(C.MIN_UNITS) AS REQ_UNITS, SUM(NEST.UNITS) AS UNITS_DONE, CASE WHEN MAX(C.MIN_UNITS) - SUM(NEST.UNITS) <= 0 THEN 0 ELSE MAX(C.MIN_UNITS) - SUM(NEST.UNITS) END AS UNITS_NEEDED FROM DEPARTMENT D, CATEGORIES C JOIN (SELECT T.SSN AS STUDENT_SSN, T.COURSE_NUM AS COURSE_NUM, T.GRADE AS GRADE, T.UNITS AS UNITS FROM TAKEN T WHERE T.GRADE IN ('A+','A','A-','B+','B','B-','C+','C','C-','D') AND T.SSN = ? UNION SELECT  ?, T.COURSE_NUM AS COURSE_NUM,'F', 0 FROM TAKEN T) NEST ON (C.COURSE_NUM = NEST.COURSE_NUM) WHERE D.DEPT_NAME = C.DEPT_NAME AND D.DEPT_NAME = ? GROUP BY C.NAME");
                        pstmt3.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        pstmt3.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        pstmt3.setString(3, request.getParameter("DEGREE"));
                        rs3 = pstmt3.executeQuery();
                        rsmd3 = rs3.getMetaData();
                        columnCount2 = rsmd3.getColumnCount();

                        // Use the created statement to SELECT
                        // the student attributes FROM the Student table.
                        PreparedStatement pstmt = conn.prepareStatement(
                            "SELECT Q.UNITS_NEEDED AS UNITS_NEEDED FROM(SELECT C.NAME AS CATEGORY_NAME, MAX(C.MIN_UNITS) AS REQ_UNITS, SUM(NEST.UNITS) AS UNITS_DONE, CASE WHEN MAX(C.MIN_UNITS) - SUM(NEST.UNITS) <= 0 THEN 0 ELSE MAX(C.MIN_UNITS) - SUM(NEST.UNITS) END AS UNITS_NEEDED FROM DEPARTMENT D, CATEGORIES C JOIN (SELECT T.SSN AS STUDENT_SSN, T.COURSE_NUM AS COURSE_NUM, T.GRADE AS GRADE, T.UNITS AS UNITS FROM TAKEN T WHERE T.GRADE IN ('A+','A','A-','B+','B','B-','C+','C','C-','D') AND T.SSN = ? UNION SELECT ?, T.COURSE_NUM AS COURSE_NUM,'F', 0 FROM TAKEN T) NEST ON (C.COURSE_NUM = NEST.COURSE_NUM) WHERE D.DEPT_NAME = C.DEPT_NAME AND D.DEPT_NAME = ? GROUP BY C.NAME) Q WHERE CATEGORY_NAME = 'TOTAL_UNIT'");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        pstmt.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        pstmt.setString(3, request.getParameter("DEGREE"));
                        rs = pstmt.executeQuery();
                        rsmd1 = rs.getMetaData();
                        columnCount1 = rsmd1.getColumnCount();                 
                        
                        

                        // Commit transaction
                        conn.commit();
                        conn.setAutoCommit(true);
                    }
            %>
            <%-- -------- SELECT Statement Code -------- --%>
            <%
                statement2 = conn.createStatement();
                student = statement2.executeQuery("SELECT DISTINCT S.SSN AS SSN, S.FIRSTNAME AS FIRSTNAME, S.MIDDLENAME AS MIDDLENAME, S.LASTNAME AS LASTNAME FROM STUDENT S WHERE S.ENROLL = 'Yes' AND S.SSN IN (SELECT UNDERGRAD_SSN FROM UNDERGRAD)");

                statement3 = conn.createStatement();
                degree = statement3.executeQuery("SELECT T.DEPT_NAME AS NAME FROM DEPARTMENT T WHERE T.DEPT_NAME LIKE '%B._.%' ");

            %>

            <!-- Add an HTML table header row to format the results -->
            <table border="0"><th><font face = "Arial Black" size = "6">Report</font></th></table>
                <table border="1">
                    <tr>
                        <th>Student SSN</th>
                        <th>Degree</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <form action="report1_d.jsp" method="get">
                            <input type="hidden" value="search" name="action">
                            <th><name="SSN" size="20">
                            <select name = "SSN">
                                <% 
                                    while ( student.next() ){
                                %>
                                     <option value="<%= student.getString("SSN") %>"><%= student.getString("SSN") %> | <%= student.getString("FIRSTNAME") %>, <%=student.getString("MIDDLENAME") %>, <%=student.getString("LASTNAME") %></option>
                                <%
                                    }
                                %>
                                 
                            </select></th>
                            <th><name="DEGREE" size="20">
                            <select name = "DEGREE">
                                <% 
                                    while ( degree.next() ){
                                %>
                                     <option value="<%= degree.getString("NAME") %>"><%= degree.getString("NAME") %></option>
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
                    if ( columnCount2 !=0 ) {      
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Units Needed in Category Info</font></th></table>
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
            <%
                while(rs3.next()){
            %>
                    <tr>    
            <%
                    for (l = 1; l <= columnCount2; l++){
                    name4 = rsmd3.getColumnName(l);
            %>
                    <td align="middle"> <input value="<%= rs3.getString(name4) %>" 
                    name="<%= rs3.getString(name4) %>" size="15" readonly></td>
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
                    // Iterate over the ResultSet        
                    if ( columnCount1!=0 ) {      
            %>
                <table border="0"><th><font face = "Arial Black" size = "6">Units Needed to Graduate</font></th></table>
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

                    if (degree!=null)
                        degree.close();
    
                    // Close the Statement
                    if(statement!=null)
                        statement.close();

                    if(statement2!=null)
                        statement2.close();
                    
                    if(statement3!=null)
                        statement3.close();

                    // Close the Connection
                    if(conn!=null)
                        conn.close();
                }
            %>

</body>

</html>
