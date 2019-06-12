<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.Session"%>                                    
<%@page import="java.util.Properties"%>                                                                             
<%@page import="javax.mail.Transport"%>      
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <title>Add Receptionist</title>
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/lib/calendar2/semantic.ui.min.css" rel="stylesheet">
    <link href="css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="fix-header fix-sidebar">
    
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
			<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    
     <div id="main-wrapper">
        <!-- header header  -->
        <div class="header">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- Logo -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon -->
                        <b><img src="images/logo.png" alt="homepage" class="dark-logo" /></b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span><img src="images/logo-text.png" alt="homepage" class="dark-logo" /></span>
                    </a>
                </div>
                <!-- End Logo -->
                <div class="navbar-collapse">
                    <!-- toggle and nav items -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        
                        <!-- Messages -->
                        
                        
                        
                        <!-- End Messages -->
                    </ul>
                    <!-- User profile and search -->
                    <ul class="navbar-nav my-lg-0">

                        <!-- Search --> 
                        
                     
                        <!-- Profile -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted  " href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/login.jpg" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right animated zoomIn">
                                <ul class="dropdown-user">
                                    <li><a href="logout.jsp"><i class="fa fa-power-off"></i> Logout</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- End header header -->
        <!-- Left Sidebar  -->
        <div class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="nav-devider"></li>
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">Dashboard </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="admin.jsp">Home </a></li>
                                <li><a href="monitor.jsp">Monitor Clinic </a></li>
                            </ul>
                        </li>
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-wpforms"></i><span class="hide-menu">Departments</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="add_dept.jsp">Add Department</a></li>
                                <li><a href="manage_dept.jsp">Manage Department</a></li>
                            </ul>
                        </li>
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-group"></i><span class="hide-menu">Doctor</span></a>
                            <ul aria-expanded="false" class="collapse">                                
                                <li><a href="add_doc.jsp">Add</a></li>
                                <li><a href="manage_doc.jsp">Manage</a></li>                        
                            </ul>
                        </li>   
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Receptionist</span></a>
                            <ul aria-expanded="false" class="collapse">                                                              
                                <li><a href="add_recep.jsp">Add</a></li>
                                <li><a href="manage_recep.jsp">Manage</a></li>                     
                            </ul>
                        </li>   
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-mercury"></i><span class="hide-menu">Staff</span></a>
                            <ul aria-expanded="false" class="collapse">                                
                                <li><a href="add_staff.jsp">Add</a></li>
                                <li><a href="manage_staff.jsp">Manage</a></li>                     
                            </ul>
                        </li>  
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-book"></i><span class="hide-menu">Backup</span></a>
                            <ul aria-expanded="false" class="collapse">                                
                                <li><a href="backup.jsp">Backup</a></li>                
                            </ul>
                        </li>   
                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </div>
        <!-- End Left Sidebar  -->
        <!-- Page wrapper  -->
        <div class="page-wrapper">
            <!-- Bread crumb -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-primary">Dashboard</h3> </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="admin.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                <!-- Start Page Content -->
            <form>
                <center>
                    <h2><b>RECEPTIONIST DETAILS</b></h2>
                    <table>     
                        
                    <tr><td><label id="recep_name" ><b>Receptionist Name: </b></label>
                    <input type="text" name="recep_name" required size="35"></td></tr>
                  
                    <tr><td><label id="email" ><b>Email: </b></label>
                    <input type="email" name="email" required class="validate" size="35"><br></td></tr>
                    
                    <tr><td><label id="age" ><b>Age: </b></label>
                    <input type="text" name="age" required maxlength="2" pattern="[0-9]{2}" size="35"><br></td></tr>
                    
                    <tr><td><label id="mobile" ><b>Mobile: </b></label>
                            <input type="text" name="mobile" required minlength="10" maxlength="10" pattern="[0-9]{10}" size="35" ><br></td></tr>
                    
                    <tr><td><label id="addr" ><b>Address: </b></label>
                    <input type="text" name="addr" required size="35"><br><br></td></tr>
                    
                    
                    <tr><td><button class="btn btn-info" type="submit" value="submit">Submit</button>  
                    <button class="btn btn-info" type="reset" value="reset">Reset</button></td></tr>           
                    <br><br>
                    <%
                    if(String.valueOf(session.getAttribute("addrecep")).equals("null"))
                    {}
                    
                    else
                    {
                    out.println(session.getAttribute("addrecep"));
                    session.removeAttribute("addrecep");
                    }
                    
                    if(String.valueOf(session.getAttribute("already")).equals("null"))
                    {}                    
                    else
                    {
                    out.println(session.getAttribute("already"));
                    session.removeAttribute("already");
                    }
                    %>
                    </table>
                </center>
            

<%
            try {
                            String name = request.getParameter("recep_name");                       
                            String email = request.getParameter("email");
                            String age = request.getParameter("age");
                            String mobile = request.getParameter("mobile"); 
                            String addr = request.getParameter("addr");
                        
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                        
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM receptionist";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            
                            while (rs.next()) {
                                String rname = rs.getString("name");
                                if (name.equals(rname)) {                                    
                                    //request.setAttribute("user_already_exist_error", "Username Already Exist!");
                                    //RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                                    //rd.forward(request, response);
                                    session.setAttribute("already","Receptionist "+name+" already Exists");
                                    response.sendRedirect("add_recep.jsp");
                                }
                            }                          
                            query = "INSERT INTO receptionist VALUES(?,?,?,?,?,?,?,?,?,?)";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, "recep_"+name);   
                            ps.setString(2, name);     
                            ps.setString(3, email);   
                            ps.setString(4, name+"123");   
                            ps.setString(5, age);      
                            ps.setString(6, mobile);
                            ps.setString(7, addr);
                            ps.setString(8, "0");
                            ps.setString(9, "");
                            ps.setString(10, "");
                            ps.executeUpdate();                            
                            session.setAttribute("addrecep","Receptionist "+name+" added successfully");
                            response.sendRedirect("add_recep.jsp");
                            
                }
                catch (Exception ex) {
                }
%>            
<%                    
                    String email=request.getParameter("email");    
                    String name = request.getParameter("recep_name");   
                    session.setAttribute("email",email);
                    Class.forName("com.mysql.jdbc.Driver").newInstance();              
                    try
                        {
                        Connection conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");            
                        String query="SELECT * FROM receptionist";
                        Statement st=conn.createStatement();                                              
                        ResultSet rs=st.executeQuery(query);                                    
                        while(rs.next())
                            {            
                                String mail = rs.getString("email");
                                if (email.equals(mail) && String.valueOf(session.getAttribute("already")).equals("null")) {                                                      
                                    Random rnd = new Random();
                                    final String user = "shobhitjuyal321@gmail.com";
                                    final String pass = "Keyboard1@3";
                                    final String to = email;
                                    final String sub = "Welcome"+"\t"+name;
                                    final String msg = "Your login details:"+"\n"+"Username:"+"\t"+"recep_"+name+"\n"+"Password:"+"\t"+name+"123"+"\n\n\n"+"Click here to Login:"+"\t"+"http://localhost:8080/CM/login.jsp"+".";
                                    
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
                                        response.sendRedirect("add_recep.jsp");                           
                                    }
                            }                  
                        request.setAttribute("email_doesnt_exist_error","Email Address Doesn't Exist!");
                        RequestDispatcher rd=request.getRequestDispatcher("add_recep.jsp");                                
                        rd.forward(request, response);
                    }
                        
                catch (Exception ex) {
                }
%>
        	
        
            </form>

                                                
              </div>                                  

                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
            <!-- footer -->
            <footer class="footer"> © 2018 All rights reserved. Designed by Shobhit Juyal</footer>
            <!-- End footer -->
        </div>
        <!-- End Page wrapper  -->
    </div>
    <!-- End Wrapper -->
    <!-- All Jquery -->
    <script src="js/lib/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="js/lib/bootstrap/js/popper.min.js"></script>
    <script src="js/lib/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->


    <!-- Amchart -->
     <script src="js/lib/morris-chart/raphael-min.js"></script>
    <script src="js/lib/morris-chart/morris.js"></script>
    <script src="js/lib/morris-chart/dashboard1-init.js"></script>


	<script src="js/lib/calendar-2/moment.latest.min.js"></script>
    <!-- scripit init-->
    <script src="js/lib/calendar-2/semantic.ui.min.js"></script>
    <!-- scripit init-->
    <script src="js/lib/calendar-2/prism.min.js"></script>
    <!-- scripit init-->
    <script src="js/lib/calendar-2/pignose.calendar.min.js"></script>
    <!-- scripit init-->
    <script src="js/lib/calendar-2/pignose.init.js"></script>

    <script src="js/lib/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/lib/owl-carousel/owl.carousel-init.js"></script>
    <script src="js/scripts.js"></script>
    <!-- scripit init-->

    <script src="js/custom.min.js"></script>

</body>

</html>
                
                