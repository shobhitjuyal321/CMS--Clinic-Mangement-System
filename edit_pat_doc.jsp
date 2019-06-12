<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
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

<head runnat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
    <title>Edit department</title>
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
                                <li><a href="edit_dept.jsp">Edit Department</a></li>
                                <li><a href="manage_dept.jsp">Manage Department</a></li>
                                <li><a href="view_dept.jsp">View Department</a></li>
                            </ul>
                        </li>
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-group"></i><span class="hide-menu">Doctor</span></a>
                            <ul aria-expanded="false" class="collapse">                                
                                <li><a href="add_doc.jsp">Add</a></li>
                                <li><a href="manage_doc.jsp">Manage</a></li>
                                <li><a href="#">Reports</a></li>                                
                            </ul>
                        </li>   
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-user"></i><span class="hide-menu">Receptionist</span></a>
                            <ul aria-expanded="false" class="collapse">                                                              
                                <li><a href="add_recep.jsp">Add</a></li>
                                <li><a href="manage_recep.jsp">Manage</a></li>
                                <li><a href="#">Reports</a></li>                                
                            </ul>
                        </li>   
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-book"></i><span class="hide-menu">Accountant</span></a>
                            <ul aria-expanded="false" class="collapse">                              
                                <li><a href="add_acc.jsp">Add</a></li>
                                <li><a href="manage_acc.jsp">Manage</a></li>
                                <li><a href="#">Reports</a></li>                                
                            </ul>
                        </li>
                        
                        <br>
                        
                        <li> <a class="has-arrow  " href="#" aria-expanded="false"><i class="fa fa-mercury"></i><span class="hide-menu">Staff</span></a>
                            <ul aria-expanded="false" class="collapse">                                
                                <li><a href="add_staff.jsp">Add</a></li>
                                <li><a href="manage_staff.jsp">Manage</a></li>                     
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
                <%
                    try{
                        String pat_name=request.getParameter("pat_name");                        
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        String desc=null;
                        
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM booked_patient";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) { 
                                desc = rs.getString("description");
                            }
                            
                            conn.close();
                    
                %>
            <form method="POST">
                <center>
                    <h2><b>UPDATE DEPARTMENT</b></h2>
                    <table border="1">     
                        
                    <tr><td><label id="new_name" name="new_name"><b>Patient Name: </b></label></td>
                    <td><label id="new_name" name="new_name" style="float: left"><b><%=request.getParameter("pat_name") %> </b></label></td></tr>
                  
                    <tr><td><label name="doc" id="doc" ><b>Description: </b></label></td> 
                    <td><select class="doc" id="doc" name="doc" required style="width: 100px;"></select></td></tr><br> 
                    
                    <tr><td><label id="addr" ><b>Description: </b></label>
                    <input type="text" name="addr" required size="35" value="<%=desc%>"><br><br></td></tr>
                                                      
                    <tr><td><button class="btn btn-info" type="submit" value="submit">Submit</button>  
                    <button class="btn btn-info" type="reset" value="reset">Reset</button></td></tr>                  
                    </table>
                </center>
            </form>
            

<%
            try {
                        String deptname = request.getParameter("dept_name");
                        String name = request.getParameter("txtContent");       
                        String doc = request.getParameter("doc");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        
                            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            query = "SELECT * FROM department";
                            st = conn.createStatement();
                            rs = st.executeQuery(query);
                            while (rs.next()) { 
                            }
                            
                            query = "UPDATE department SET dept_name=(?), doctor=(?) WHERE dept_name='"+deptname+"'";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, name);
                            ps.setString(2, doc);
                            ps.executeUpdate();
                            conn.close();
                            
                            
                } 
                        
                catch (Exception ex) {
                    out.println(ex);
                }

                }
                    catch(Exception ex){
                        
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
                
                