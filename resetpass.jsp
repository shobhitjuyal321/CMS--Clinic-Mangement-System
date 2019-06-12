<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    
<head>
    <meta charset="UTF8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
    <style>
        body {
            background-color: #303641;          
        }
    </style>
</head>

<body>    
    <div id="container-login">
        <div id="title"> Forgot Password
        </div>           
        
        <form method="post">
            
            <div class="clearfix"></div>
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">info</i>
                </div> 
                <input id="otp" placeholder="OTP" name="otp" required type="text" maxlength="6">
            </div>

            <div class="clearfix"></div>    
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>    
                <input id="newpass" placeholder="New password" required name="pwd" type="password" autocomplete="off">
            </div>

            <div class="clearfix"></div> 
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div> 
                <input id="newpass" placeholder="Conform Password" required name="confirmpwd" type="password" autocomplete="off">
            </div>

            <div class="clearfix"></div> 
            
            <br>
            
            <input type="submit" value="Log In" />
          
        
        <%
                        String email = session.getAttribute("email").toString();
                        String otp = request.getParameter("otp");
                        String pwd = request.getParameter("pwd");
                        String type = session.getAttribute("type").toString();
                        String repass = request.getParameter("confirmpwd");
                        String otpValidate = session.getAttribute("otp").toString();
                        
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            
                                if(type.equals("doctor")){
                                if (otpValidate.equals(otp)) {
                                    String query = "UPDATE doctor SET password='" + repass + "' WHERE email='" + email + "'";
                                    Statement st = conn.createStatement();
                                    st.executeUpdate(query);
                                    response.sendRedirect("login.jsp");
                                } else {
                                    request.setAttribute("fail", "Invalid OTP!");
                                    RequestDispatcher rd = request.getRequestDispatcher("resetpass.jsp");
                                    rd.forward(request, response);
                                }
                                }
                                if(type.equals("receptionist")){
                                if (otpValidate.equals(otp)) {
                                    String query = "UPDATE receptionist SET password='" + repass + "' WHERE email='" + email + "'";
                                    Statement st = conn.createStatement();
                                    st.executeUpdate(query);
                                    response.sendRedirect("login.jsp");
                                } else {
                                    request.setAttribute("fail", "Invalid OTP!");
                                    RequestDispatcher rd = request.getRequestDispatcher("resetpass.jsp");
                                    rd.forward(request, response);
                                    }
                                }
                        } catch (Exception ex) {
                        }
                    %>
                    <br>
        </form>
        
                <%if (null != request.getAttribute("fail")) {%>
                <span class="left input-field col s12" style="color:red;font-size:16px;text-align:center;font-weight:bold"><%="*" + request.getAttribute("fail") + "*"%></span>
                <%}%>
                
        <br>
       

    </div>
                
</body>
</html>
