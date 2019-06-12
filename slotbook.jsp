<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
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
    <link rel="stylesheet" href="captcha.css"> 
    <script type="text/javascript" src="captcha.js"></script>
    <style>
        body {
            background-color: #303641;          
        }
    </style>
</head>

<body onLoad="ChangeCaptcha()">    
    <div id="container-login">
        <div id="title">Book Appointment </div>           
        
        <form method="post">
            
            <div class="clearfix"></div>
            
            <div class="input">
                <input id="patname" placeholder="Patient name" name="patname" type="text" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <input id="age" placeholder="Age" type="text" name="age" maxlength="2" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <div class="input">
                <input id="mobile" placeholder="Mobile" type="text" name="mobile" required class="validate" minlength="10" maxlength="10" pattern="[0-9]{10}" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <div class="input">
                <input id="email" placeholder="Email Address" type="email" name="email" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <div class="input">
                <input id="address" placeholder="Address" type="text" name="address" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <br>
            <input type="text" id="randomfield" disabled name="randomfield"> 
	
            <input id="CaptchaEnter" name="CaptchaEnter" size="20" maxlength="6" placeholder="Enter Captcha"/>
            <br><br>
            
            <input onclick="check()" type="submit" value="Proceed" />
             
        
        <%                    
                        
                try {
                        String name = request.getParameter("patname");
                        session.setAttribute("name",name);
                        String age = request.getParameter("age");
                        session.setAttribute("age",age);                        
                        String mobile = request.getParameter("mobile");  
                        session.setAttribute("mobile",mobile);  
                        String email = request.getParameter("email");   
                        session.setAttribute("email",email);                   
                        String address = request.getParameter("address");
                        session.setAttribute("address",address);
                        String CaptchaEnter = request.getParameter("CaptchaEnter");
                        
                        if (email != null && age !=null && name !=null && mobile !=null && address !=null && CaptchaEnter != null) {                            
                                    Random rnd = new Random();
                                    int n = 100000 + rnd.nextInt(999999);            
                                    session.setAttribute("otp",n);
                                    final String user = "shobhitjuyal321@gmail.com";
                                    final String pass = "Keyboard1@3";
                                    final String to = email;
                                    final String sub = "[OTP] One Time Password!";
                                    final String msg = "This is Your OTP (One Time Password) = "+String.valueOf(n)+".";
                                    
                                        Properties props = new Properties();
                                        props.put("mail.smtp.host", "smtp.gmail.com");
                                        props.put("mail.smtp.port", "587");
                                        props.put("mail.smtp.auth", "true");
                                        props.put("mail.smtp.starttls.enable", "true");

                                        Session s = Session.getInstance(props, new javax.mail.Authenticator() {
                                            @Override
                                            protected PasswordAuthentication getPasswordAuthentication() {
                                                return new PasswordAuthentication(user, pass);
                                            }
                                        });

                                        MimeMessage message = new MimeMessage(s);
                                        message.setFrom(new InternetAddress(user));
                                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                                        message.setSubject(sub);
                                        message.setText(msg);

                                        /* Transport class is used to deliver the message to the recipients */
                                        Transport.send(message);                                    
                                        response.sendRedirect("book_appointment.jsp");
                                } 
                        }
                        catch (Exception ex) {
                            out.println(ex);
                        }

        %>
        
       </form>
                
    </div>
                
</body>
</html>
