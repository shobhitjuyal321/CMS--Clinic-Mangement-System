<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <meta name="description" content="Login - Register Template">
    <meta name="author" content="Lorenzo Angelino aka MrLolok">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body {
            background-color: #303641;
        }
    </style>
</head>

<body>
    <div id="container-register">
        <div id="title">
            <i class="material-icons lock">vpn_key</i> Enter New Password
        </div>

        <form method="post">
                        
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input id="password" placeholder="Password" type="password" name="pwd" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>            
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input id="password" placeholder="Password" type="password" name="confirmpwd" required class="validate" autocomplete="off">
            </div>

            <div class="remember-me">
                <input type="checkbox" required class="validate">
                <span style="color: #DDD">I accept Terms of Service</span>
            </div>

            <input type="submit" value="Register" onclick="return vali()"/>
            
            
            <%
                                               
                        String pass1 = request.getParameter("pwd");
                        String pass2 = request.getParameter("confirmpwd");    
                        Class.forName("com.mysql.jdbc.Driver");
                        try {
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM register";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                
                            }
                            query = "UPDATE `register` SET `password`= (?) WHERE 1";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, pass);
                            ps.executeUpdate();

                            //String filepath = "C:/Users/Psycho/Documents/SemiColon/web/SemiColon/SemiColonAdminDashboard/GeneratedQueries/" + uname + ".txt";
                            //File file = new File(filepath);
                            //file.createNewFile();                            
                            //query = "INSERT INTO generated_queries VALUES(?,?)";
                            //ps = conn.prepareStatement(query);
                            //InputStream inputStream = new FileInputStream(new File(filepath));
                            //ps.setString(1, uname);
                            //ps.setBlob(2, inputStream);
                            //ps.executeUpdate();

                            //filepath = "C:/Users/Psycho/Documents/SemiColon/web/SemiColon/SemiColonAdminDashboard/Privileges/" + uname + ".txt";
                            //file = new File(filepath);
                            //file.createNewFile();
                            //query = "INSERT INTO privileges VALUES(?,?)";
                            //ps = conn.prepareStatement(query);
                            //inputStream = new FileInputStream(new File(filepath));
                            //ps.setString(1, uname);
                            //ps.setBlob(2, inputStream);
                            //ps.executeUpdate();
                            response.sendRedirect("login.jsp");
                        } catch (Exception ex) {
                        }
                    %>
                    
        </form>

        

        <div class="register">
            Do you already have an account?
            <a href="login.jsp"><button id="register-link">Log In here</button></a>
        </div>
    </div>
</body>

</html>

