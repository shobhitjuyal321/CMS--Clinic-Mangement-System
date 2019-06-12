<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%> 
<%@page import=" java.net.URLEncoder"%>
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
    
    <script type="text/javascript">
function Validation()
{
var a = document.form.phone.value;
if(a=="")
{
alert("please Enter the Contact Number");
document.form.phone.focus();
return false;
}
if(isNaN(a))
{
alert("Enter the valid Mobile Number(Like : 9566137117)");
document.form.phone.focus();
return false;
}
if((a.length < 1) || (a.length > 10))
{
alert(" Your Mobile Number must be 1 to 10 Integers");
document.form.phone.select();
return false;
}
}
</script>

</head>

<body>    
    <div id="container-login">
        <div id="title">Book Appointment </div>           
        
        <form method="post" onsubmit="return Validation()">
            
            <div id="title">
            <i class="material-icons lock">lock</i> Verify Phone Number
            </div>

            <div class="clearfix"></div>
            
            <div class="input">
                <input id="phone" placeholder="Enter Phone Number" type="text" maxlength="10" minlength="10" name="phone" required  pattern="[0-9]{10}" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <br>
            <input type="submit" name="submit" value="submit">
                    
       </form>
                
    </div>
                
</body>
</html>
