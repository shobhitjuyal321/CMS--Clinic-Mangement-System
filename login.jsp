<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
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
    <style>
        body {
            background-color: #303641;          
        }
    </style>
</head>

<body>    
    <div id="container-login">
        <div id="title">
            <i class="material-icons lock">lock</i> Login
        </div>           
        
        <form method="post">
            
            <div class="input">
                <select name="type">
                <option selected>Login Type</option>
                <option value="doctor">Doctor</option>
                <option value="receptionist">Receptionist</option>
                </select>
            </div>
            
            <div class="clearfix"></div>
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input id="uname" placeholder="Username" name="uname" type="text" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input id="password" placeholder="Password" type="password" name="password" required class="validate" autocomplete="off">
            </div>
            
            <div class="clearfix"></div>
            
            <br>
            
            <input type="submit" value="Log In" />
            
        
 
        
        <%                    
                    
                    
                    try
                    {
                        String logintype=request.getParameter("type");
                        session.setAttribute("logintype",logintype);
                        String uname = request.getParameter("uname");
                        String pass = request.getParameter("password"); 
                        Calendar cal = Calendar.getInstance();
                        Date date=cal.getTime();
                        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
                        String formattedDate=dateFormat.format(date);
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");  
                        
                            if(logintype.equals("doctor")){
                            String query = "SELECT * FROM doctor where username='"+uname+"' and password='"+pass+"'"; 
                            PreparedStatement ps = conn.prepareStatement(query);                        
                            ResultSet rs = ps.executeQuery();    
                            
                            if (rs.next()) {            
                                        session.setAttribute("uname",uname);
                                        query = "UPDATE doctor SET in_clinic=1, in_time=(?), out_time=(?) where username='"+uname+"'";
                                        PreparedStatement ps1 = (PreparedStatement) conn.prepareStatement(query);
                                        ps1.setString(1, formattedDate); 
                                        ps1.setString(2, ""); 
                                        ps1.executeUpdate();
                                        response.sendRedirect("doctor.jsp");                                        
                                    }
                                else{
                                        response.sendRedirect("login.jsp");
                                    }
                                }                            
                                                           
                            if(logintype.equals("receptionist")){
                            String query = "SELECT * FROM receptionist where username='"+uname+"' and password='"+pass+"'";                              
                            PreparedStatement ps = conn.prepareStatement(query);                        
                            ResultSet rs = ps.executeQuery();    
                            
                            if(rs.next()) {                           
                                        session.setAttribute("uname",uname);                                        
                                        query = "UPDATE receptionist SET in_clinic=1, in_time=(?), out_time=(?) where username='"+uname+"'";
                                        PreparedStatement ps1 = (PreparedStatement) conn.prepareStatement(query);
                                        ps1.setString(1, formattedDate); 
                                        ps1.setString(2, ""); 
                                        ps1.executeUpdate();
                                        response.sendRedirect("receptionist.jsp");
                                    }
                                else{
                                        response.sendRedirect("login.jsp");
                                    }
                                }                            
                                                        
                            if(uname.equals("admin") && pass.equals("admin")){   
                                session.setAttribute("admin","admin");
                                response.sendRedirect("admin.jsp");
                            }   
                            
                            request.setAttribute("invalid_user_error", "Invalid Username or Password!");
                            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                            rd.forward(request, response);
                    }
                                      
                    catch(Exception ex)
                    {     
                    }
        %>
        </form><br>
        <div class="row">
                    <% try {
                        if (null != request.getAttribute("invalid_user_error")) {%>
                    <label class="left  col s12" style="color:red;font-size:13px;text-align:center;font-weight:bold"><%="*" + request.getAttribute("invalid_user_error") + "*"%></label>
                    <%}%>
                    <%
                        } catch (Exception ex) {
                        }
                    %>
                </div>
        
        <br>
        <div class="forgot-password">
            <a href="forgotpass.jsp">Forgot your password?</a>
        </div>
        <br><br><br><br><br><br><br><br><br>
        <div class="back-homepage">
            <a href="home.jsp">&larr; Back to Home</a>
        </div>
       
                
    </div>
                
</body>
</html>
