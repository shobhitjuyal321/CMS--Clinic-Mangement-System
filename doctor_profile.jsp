<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

<%/*
response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
response.setDateHeader("Expires", 0); //prevents caching at the proxy server 
try {
     if (session.getAttribute("uname").equals(null)) {
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
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <title>Doctor Dashboard</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->

    <link href="css/lib/calendar2/semantic.ui.min.css" rel="stylesheet">
    <link href="css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="css/helper.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->
    <!--[if lt IE 9]>
    <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https:**oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"></i><span class="hide-menu">Dashboard </span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="doctor.jsp">Home </a></li><li>
                                    <% 
                                    try{
                                    Class.forName("com.mysql.jdbc.Driver");
                        
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                    String name = session.getAttribute("uname").toString();
                                    String query = "select * from doctor where username='"+name+"'";
                                    PreparedStatement ps = conn.prepareStatement(query);                        
                                    ResultSet rs = ps.executeQuery();   
                                    //Statement st = conn.createStatement();
                                    //ResultSet rs = st.executeQuery(query);
                                    if (rs.next()) {    
%>
                                <li><a href="doctor_profile.jsp?dname=<%=rs.getString("name")%>&dage=<%=rs.getString("age")%>&dmobile=<%=rs.getString("mobile")%>&daddress=<%=rs.getString("address")%>&demail=<%=rs.getString("email")%>&dusername=<%=rs.getString("username")%>&dpassword=<%=rs.getString("password")%>">Profile </a></li>
    
        <% }}
catch (Exception ex) {
                        out.println(ex);
                    }
%>
                            </ul>
                        </li>
                                                
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"></i><span class="hide-menu">Patient</span></a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="doctor_manage.jsp">Manage</a></li>       
                                <li><a href="doctor_report.jsp">Reports</a></li>                                
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
                    <h3 class="text-primary">Dashboard</h3></div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="doctor.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb -->
            <!-- Container fluid  -->
            <div class="container-fluid">
                
                <form>
                <center>
                    <h2><b>Change Profile</b></h2>
                    <table>     
                        
                    <tr><td><label id="pat_name"><b>Name: </b></label>
                    <input type="hidden" id="d_name" name="d_name" value="<%=request.getParameter("dname")%>">
                    <input type="text" name="dname" value="<%=request.getParameter("dname")%>" required size="35"></td></tr>
                  
                    <tr><td><label id="age" ><b>Age: </b></label>
                    <input type="text" name="dage" value="<%=request.getParameter("dage")%>" required maxlength="2" pattern="[0-9]{2}" size="35"><br></td></tr>
                    
                    <tr><td><label id="mobile" ><b>Mobile: </b></label>
                    <input type="text" name="dmobile" value="<%=request.getParameter("dmobile")%>" required required minlength="10" maxlength="10" pattern="[0-9]{10}" size="35" ><br></td></tr>
                    
                    <tr><td><label id="address" ><b>Address: </b></label>
                    <input type="text" name="daddress" value="<%=request.getParameter("daddress")%>" required size="35"><br></td></tr>
                    
                    <tr><td><label id="email" ><b>Email: </b></label>
                    <input type="text" name="demail" value="<%=request.getParameter("demail")%>" required size="35"><br></td></tr>
                                        
                    <tr><td><label id="username" ><b>Username: </b></label>
                    <input type="text" name="dusername" value="<%=request.getParameter("dusername")%>" required size="35"><br></td></tr>
                    
                    <tr><td><label id="password" ><b>Password: </b></label>
                    <input type="password" name="dpassword" value="<%=request.getParameter("dpassword")%>" required size="35"><br><br></td></tr>
                                                            
                    <tr><td><button class="btn btn-info" type="submit" value="submit">Submit</button>  
                    <button class="btn btn-info" type="reset" value="reset">Reset</button></td></tr>     
                    
                    </table>
                <%
                    if(String.valueOf(session.getAttribute("update")).equals("null"))
                    {}
                    
                    else
                    {
                    out.println(session.getAttribute("update"));
                    session.removeAttribute("update");
                    }
                %>    
                </center>
            </form>

            <%
            try {
                        String name = request.getParameter("d_name");
                        String dname = request.getParameter("dname");
                        String dage = request.getParameter("dage");
                        String dmobile = request.getParameter("dmobile");
                        String daddress = request.getParameter("daddress");
                        String demail = request.getParameter("demail");
                        String dusername = request.getParameter("dusername");
                        String dpassword = request.getParameter("dpassword");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM doctor";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {     
                            }
                            
                            query = "UPDATE doctor SET username=(?), name=(?), email=(?), password=(?), age=(?), mobile=(?), address=(?) WHERE name='"+name+"'";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, dusername);
                            ps.setString(2, dname);
                            ps.setString(3, demail);
                            ps.setString(4, dpassword);
                            ps.setString(5, dage);
                            ps.setString(6, dmobile);
                            ps.setString(7, daddress);
                            session.setAttribute("update","Profile Updated Successfully");
                            ps.executeUpdate();
                            conn.close();
                            
                        } 
                        
                        catch (Exception ex) {
                        }
        %>                           
                                                

                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
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