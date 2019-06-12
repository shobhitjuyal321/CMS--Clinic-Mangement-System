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
    <title>Registration</title>
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
            <i class="material-icons lock">lock</i> Register
        </div>

        <form method="post">
            
            <div class="input">
                <select name="type">
                <option value="doctor">Doctor</option>
                <option value="receptionist">Receptionist</option>
                <option value="accountant" selected>Accountant</option>
                </select>
            </div>
            
            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">email</i>
                </div>
                <input id="email" placeholder="Email" type="email" name="email" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">face</i>
                </div>
                <input id="username" placeholder="Username" type="text" name="username" required class="validate" autocomplete="off">
            </div>

            <div class="clearfix"></div>

            <div class="input">
                <div class="input-addon">
                    <i class="material-icons">vpn_key</i>
                </div>
                <input id="password" placeholder="Password" type="password" name="pwd" required class="validate" autocomplete="off">
            </div>

            <div class="remember-me">
                <input type="checkbox" required class="validate">
                <span style="color: #DDD">I accept Terms of Service</span>
            </div>

            <input type="submit" value="Register" onclick="return vali()"/>
            
            
            <%
                        
                        String logintype = request.getParameter("type");
                        String uname = request.getParameter("username");                        
                        String email = request.getParameter("email");
                        String pass = request.getParameter("pwd");    
                        Class.forName("com.mysql.jdbc.Driver");
                        try {
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM register";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {
                                String username = rs.getString("username");
                                if (uname.equals(username)) {
                                    //request.setAttribute("user_already_exist_error", "Username Already Exist!");
                                    //RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                                    //rd.forward(request, response);
                                    response.sendRedirect("register.jsp");                                    
                                }
                            }
                            query = "INSERT INTO register VALUES(?,?,?,?)";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, logintype);
                            ps.setString(2, uname);
                            ps.setString(3, pass);
                            ps.setString(4, email);
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

