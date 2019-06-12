<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
/*response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
response.setDateHeader("Expires", 0); //prevents caching at the proxy server 
try {
     if (session.getAttribute("adminname").equals(null)) {
       response.sendRedirect("login.jsp");
        }
    } 
catch (Exception ex) {
        response.sendRedirect("login.jsp");
    }*/
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <title>Add Patient</title>
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/lib/calendar2/semantic.ui.min.css" rel="stylesheet">
    <link href="css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="fix-header fix-sidebar">
    <!-- Preloader - style you can find in spinners.css -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
			<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- Main wrapper  -->
     <div id="main-wrapper">
        <!-- header header  -->
        <div class="header">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- Logo -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp">
                        <!-- Logo icon -->
                        <b><img src="images/logo.png" alt="homepage" /></b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
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
                            <a class="nav-link dropdown-toggle text-muted  " href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/login.jpg" alt="user" class="profile-pic" /></a>
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
                                <li><a href="receptionist.jsp">Home </a></li>
                                <% 
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                        
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                    String name = session.getAttribute("uname").toString();
                                    String query = "select * from receptionist where username='"+name+"'";
                                    PreparedStatement ps = conn.prepareStatement(query);                        
                                    ResultSet rs = ps.executeQuery();   
                                    //Statement st = conn.createStatement();
                                    //ResultSet rs = st.executeQuery(query);
                                    if (rs.next()) {    
%>
                                <li><a href="receptionist_profile.jsp?rname=<%=rs.getString("name")%>&rage=<%=rs.getString("age")%>&rmobile=<%=rs.getString("mobile")%>&raddress=<%=rs.getString("address")%>&remail=<%=rs.getString("email")%>&rusername=<%=rs.getString("username")%>&rpassword=<%=rs.getString("password")%>">Profile </a></li>
    
        <% }}
catch (Exception ex) {
                        out.println(ex);
                    }
%>                                
                            </ul>
                        </li>
                                               
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Patient</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="add_pat.jsp">Add Patient</a></li>  
                                <li><a href="book_pat.jsp">Book Patient</a></li>  
                                <li><a href="receptionist_manage.jsp">Manage Patient</a></li>                                
                                <li><a href="receptionist_report.jsp">Reports</a></li>                                
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
                        <li class="breadcrumb-item"><a href="receptionist.jsp">Home</a></li>
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
                    <h2><b>PATIENT DETAILS</b></h2>
                    <table>     
                        
                    <tr><td><label id="pat_name" ><b>Patient Name: </b></label>
                    <input type="text" name="pat_name" required size="35"></td></tr>
                  
                    <tr><td><label id="age" ><b>Age: </b></label>
                    <input type="text" name="age" required maxlength="2" pattern="[0-9]{2}" size="35"><br></td></tr>
                    
                    <tr><td><label id="mobile" ><b>Mobile: </b></label>
                    <input type="text" name="mobile" required minlength="10" maxlength="10" pattern="[0-9]{10}" size="35" ><br></td></tr>                    
                   
                    <tr><td><label id="mobile" ><b>Email: </b></label>
                    <input type="email" name="email" class="validate" required  size="35" ><br></td></tr>
                    
                    <tr><td><label id="addr" ><b>Address: </b></label>
                    <input type="text" name="addr" required size="35"><br><br></td></tr>
                                        
                    <tr><td><button class="btn btn-info" type="submit" value="submit">Submit</button>  
                    <button class="btn btn-info" type="reset" value="reset">Reset</button></td></tr>                  
                    </table>
                    
                    <%
                    if(String.valueOf(session.getAttribute("addpat")).equals("null"))
                    {}
                    
                    else
                    {
                    out.println(session.getAttribute("addpat"));
                    session.removeAttribute("addpat");
                    }
                    
                    if(String.valueOf(session.getAttribute("already")).equals("null"))
                    {}                    
                    else
                    {
                    out.println(session.getAttribute("already"));
                    session.removeAttribute("already");
                    }
                    %>
                </center>
            </form>
            

        <%
            try {
                        String name = request.getParameter("pat_name");
                        String age = request.getParameter("age");
                        String mobile = request.getParameter("mobile");                        
                        String email = request.getParameter("email");
                        String addr = request.getParameter("addr");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT name FROM patient";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {     
                                String pname = rs.getString("name");
                                if (name.equals(pname)) {                                    
                                    //request.setAttribute("user_already_exist_error", "Username Already Exist!");
                                    //RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                                    //rd.forward(request, response);
                                    session.setAttribute("already","Patient "+name+" already Exists");
                                    response.sendRedirect("add_pat.jsp");
                                }
                            }
                            
                            query = "INSERT INTO patient(name,age,mobile,email,address,clinic,description,paid,cost) VALUES(?,?,?,?,?,?,?,?,?)";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, name);      
                            ps.setString(2, age);   
                            ps.setString(3, mobile);
                            ps.setString(4, email);
                            ps.setString(5, addr);
                            ps.setString(6, "");
                            ps.setString(7, "");
                            ps.setString(8, "");
                            ps.setString(9, "");
                            ps.executeUpdate();
                            session.setAttribute("addpat","Patient "+name+" added successfully");
                            response.sendRedirect("add_pat.jsp");
                        } 
                        
                        catch (Exception ex) {
                        }
        %>
        					

                                                
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
                
                