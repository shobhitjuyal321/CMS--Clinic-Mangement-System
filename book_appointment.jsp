<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
    
<head>
    <meta charset="UTF8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="captcha.css"> 
    <script type="text/javascript" src="captcha.js"></script>
    <style>
        body {
            background-color: #303641;          
        }
    </style>  
</head>

<body>    
    <div id="container-login">
        <div id="title">Book Appointment </div>           
        
        <form method="post">
            
            <div class="clearfix"></div>
            
            <div class="input">
                <input id="otp" placeholder="OTP" name="otp" type="text" minlength="6" maxlength="7">
            </div>
	
            <br><br>
            
            <input type="submit" value="Book" />
             
        
        <%                    
                        String otp = request.getParameter("otp");
                        String name = session.getAttribute("name").toString();
                        String age = session.getAttribute("age").toString();
                        String mobile = session.getAttribute("mobile").toString();
                        String email = session.getAttribute("email").toString();
                        String address = session.getAttribute("address").toString();
                        String otpValidate = session.getAttribute("otp").toString();
                        
                try {        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");                            
                            
                            if (otpValidate.equals(otp)) {
                                String query = "INSERT INTO patient VALUES(?,?,?,?,?,?,?,?,?)";
                                PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                                ps.setString(1, name);    
                                ps.setString(2, age);   
                                ps.setString(3, mobile);
                                ps.setString(4, email);
                                ps.setString(5, address);
                                ps.setString(6, "");
                                ps.setString(7, "");
                                ps.setString(8, "");
                                ps.setString(9, "");
                                ps.executeUpdate();
                                
                                session.setAttribute("success","Appointment Booked Successfully!!");
                                response.sendRedirect("book_appoint.jsp");
                            }
                            else{
                                session.setAttribute("fail","Wrong OTP");
                            }
                    }    
                    catch (Exception ex) {
                        out.println(ex);
                    }
        %>
        <br><br>
        <%
            if(String.valueOf(session.getAttribute("fail")).equals("null"))
                    {}
                    
                    else
                    {
                    out.println(session.getAttribute("fail"));
                    session.removeAttribute("fail");
                    }
        %>
       </form>
                
    </div>
                
</body>
</html>