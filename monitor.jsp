<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
    <title>Monitor Clinic</title>
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
                     
                
                    <div class="col-lg-16">
                        <div class="card">                            
                            <div class="card-title">                                
                                <h4>Doctors In Clinic</h4>                         
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Sr.No</th>
                                                <th>Name</th>
                                                <th>Mobile Number</th>
                                                <th>In Clinic</th>
                                                <th>Entry Time</th>
                                                <th>Exit Time</th>
                                            </tr>
                                        </thead>
                <%
                                            
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        
                        Statement stmt1 = conn1.createStatement();
                        
                        int count1=0;
                        ResultSet rs1=stmt1.executeQuery("select name,mobile,in_clinic,in_time,out_time from doctor");
                        while(rs1.next())
                        {

                %>
                                        <tbody>
                                            <tr>
                                                <td><%=++count1%></td>
                                                <td><%=rs1.getString("name")%></td>
                                                <td><%=rs1.getString("mobile")%></td>
                                                <td><%String v=rs1.getString("in_clinic");
                                                    if(v.equals("0")){
                                                        out.println("no");}
                                                    if(v.equals("1")){
                                                         out.println("Yes");}    
                                                    %></td>
                                                <td><%=rs1.getString("in_time")%></td>
                                                <td><%=rs1.getString("out_time")%></td>
                                            </tr>
                        <%}%>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="col-lg-16">
                        <div class="card">                            
                            <div class="card-title">                                
                                <h4>Receptionist In Clinic</h4>                         
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Sr.No</th>
                                                <th>Name</th>
                                                <th>Mobile Number</th>
                                                <th>In Clinic</th>
                                                <th>Entry Time</th>
                                                <th>Exit Time</th>
                                            </tr>
                                        </thead>
                <%
                                            
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn2 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        
                        Statement stmt2 = conn2.createStatement();
                        
                        int count2=0;
                        ResultSet rs2=stmt2.executeQuery("select name,mobile,in_clinic,in_time,out_time from receptionist");
                        while(rs2.next())
                        {

                %>
                                        <tbody>
                                            <tr>
                                                <td><%=++count2%></td>
                                                <td><%=rs2.getString("name")%></td>
                                                <td><%=rs2.getString("mobile")%></td>
                                                <td><%String v=rs2.getString("in_clinic");
                                                    if(v.equals("0")){
                                                        out.println("no");}
                                                    if(v.equals("1")){
                                                         out.println("Yes");}    
                                                    %></td>
                                                <td><%=rs2.getString("in_time")%></td>
                                                <td><%=rs2.getString("out_time")%></td>
                                            </tr>
                        <%}%>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>              
                
                </div>                                       
                                                

                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->
            <!-- footer -->
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