<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h1> Dental care!</h1>
            <h1>Report</h1>
        <h3>Patient name: <%=request.getParameter("patname")%></h3>
        <h3>Description: 
            <%
                try{                         
                        Class.forName("com.mysql.jdbc.Driver");
                            
                        String patname = request.getParameter("patname");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        String query = "SELECT description FROM patient where name='"+patname+"'";
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery(query);
                        while (rs.next()) {                             
                            String des = rs.getString("description");
                            out.println(des);
                        }
                } 
                        
                catch (Exception ex) {
                    out.println(ex);
                }
            %>
        </h3>
        <h3>Treatment Cost: 
        <%
            try{                         
                    String patname = request.getParameter("patname");
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    String query1 = "SELECT cost FROM patient where name='"+patname+"'";
                    Statement st1 = conn1.createStatement();
                    ResultSet rs1 = st1.executeQuery(query1);
                    while (rs1.next()) {                             
                        String des = rs1.getString("cost");
                        out.println(des);
                        }
                }                         
                catch (Exception ex) {
                    out.println(ex);
                }
        %>
        </h3>
        </center>
        <br><br><br><br><br><br><br>
        
        <b>Date:</b> <span id="date"></span> 
        <h3 style="text-align:right;">Dr. <%=session.getAttribute("uname")%></h3>
        <h3 style="text-align:right;">Doctor Signature</h3>
            <script>
                var dt = new Date();
                document.getElementById("date").innerHTML = dt.toLocaleDateString();
            </script>
    </body>
</html>
