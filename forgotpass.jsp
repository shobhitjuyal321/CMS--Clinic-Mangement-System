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
                <select name="type">
                <option selected>Login Type</option>
                <option value="doctor">Doctor</option>
                <option value="receptionist">Receptionist</option>
                </select>
            </div>
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">mail</i>
                </div>
                <input id="email" placeholder="Email" name="email" type="email" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>         
            
            <br>
            
            <input type="submit" value="Send OTP" />
            
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div class="back-homepage">
            <a href="login.jsp">&larr; Back to Login</a>
        </div>
            
 
        
        <%                    
                    String type=request.getParameter("type");  
                    session.setAttribute("type",type);
                    String email=request.getParameter("email");          
                    session.setAttribute("email",email);
                    Class.forName("com.mysql.jdbc.Driver");              
                    try
                        {
                        Connection conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");            
                        if(type.equals("doctor")){
                            
                        String query="SELECT * FROM doctor";                        
                        Statement st=conn.createStatement();                                              
                        ResultSet rs=st.executeQuery(query);                                    
                        while(rs.next())
                            {                            
                                String mail = rs.getString("email");
                                if (email.equals(mail)) {                                                      
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
                                        response.sendRedirect("resetpass.jsp");                                
                                }
                            }
                        }
                        if(type.equals("receptionist")){
                            
                        String query="SELECT * FROM receptionist";                        
                        Statement st=conn.createStatement();                                              
                        ResultSet rs=st.executeQuery(query);                                    
                        while(rs.next())
                            {                            
                                String mail = rs.getString("email");
                                if (email.equals(mail)) {                                                      
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
                                        response.sendRedirect("resetpass.jsp");                                
                                }
                            }
                        }
                        if(type.equals("accountant")){
                            
                        String query="SELECT * FROM accountant";                        
                        Statement st=conn.createStatement();                                              
                        ResultSet rs=st.executeQuery(query);                                    
                        while(rs.next())
                            {                            
                                String mail = rs.getString("email");
                                if (email.equals(mail)) {                                                      
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
                                        response.sendRedirect("resetpass.jsp");                                
                                }
                            }
                        }
                        request.setAttribute("email_doesnt_exist_error","Email Address Doesn't Exist!");
                        RequestDispatcher rd=request.getRequestDispatcher("resetpass.jsp");                                
                        rd.forward(request, response);
                    } 
                    catch (Exception ex) {
                    }
                    %> 
             
            </form>
        
        <br>
       
                
    </div>
                
</body>
</html>
