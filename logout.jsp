<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="main.css">
        <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Logout Page</title>
    </head>

    <body>
        <%
                try {
		response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 
		response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
                        String type = session.getAttribute("logintype").toString();
                        String name = session.getAttribute("uname").toString();                        
                        Calendar cal = Calendar.getInstance();
                        Date date=cal.getTime();
                        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
                        String formattedDate=dateFormat.format(date);
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        
                            if(type.equals("doctor")){
                                    String query = "UPDATE doctor SET in_clinic=0, out_time=(?) WHERE username='" + name + "'";
                                    PreparedStatement ps1 = (PreparedStatement) conn.prepareStatement(query);
                                    ps1.setString(1, formattedDate); 
                                    ps1.executeUpdate();
                            
                            }
                            if(type.equals("receptionist")){
                                    String query = "UPDATE receptionist SET in_clinic=0, out_time=(?) WHERE username='" + name + "'";
                                    PreparedStatement ps1 = (PreparedStatement) conn.prepareStatement(query);
                                    ps1.setString(1, formattedDate); 
                                    ps1.executeUpdate();
                            
                            }
                    }        
                        catch (Exception ex) {
                            out.println(ex);
                        }
                session.invalidate();                
                response.sendRedirect("login.jsp");
        %>		
    </body>
</html>
