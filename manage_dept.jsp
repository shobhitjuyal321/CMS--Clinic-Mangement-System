<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
<title>Manage Department</title>
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
                <%ResultSet rs =null;%>

            <script type="text/javascript">
            function del()
            {
                if(confirm("Do You Want to Delete this Department?"))
                    {
                    }
                else
                    {
                    return false;
                    }
            }
            function rem()
            {
                if(confirm("Do You Remove Doctor from this Department?"))
                    {
                    }
                else
                    {
                    return false;
                    }
            }
            </script>
            
        <% 
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");    

                Statement stmt = con.createStatement();
    
                String dname=request.getParameter("dname");
                String delete_status;
                int x=0;
                if(dname!=null)
                {
                delete_status=request.getParameter("delete_status");

                    if("yes".equals(delete_status))
                    {            
                        x=stmt.executeUpdate("Delete from department where dept_name='"+dname+"'");
                    }
                }
                String dpname=request.getParameter("dpname");
                String remove_status;
                int y=0;
                if(dpname!=null)
                {
                remove_status=request.getParameter("remove_status");

                    if("yes".equals(remove_status))
                    {            
                        y=stmt.executeUpdate("update department set doctor='' where dept_name='"+dpname+"'");
                    }
                }
        %>

    <table border="1" class='table table-striped'>
    <% if(x==1){
        %> <tr>
<th height="35" colspan="9"><div align="center">
Department <%=dname%> deleted successfully !!
</div></th>
<%}%>
<% if(y==1){
        %> <tr>
<th height="35" colspan="9"><div align="center">
Doctor from <%=dpname%> removed successfully !!
</div></th>
<%}%>
</tr>
<tr>
    <td><div align="center"><strong>Sr No</strong></div></td>

    <td><div align="center"><strong>Department Name</strong></div></td>
    
    <td colspan="2"><div align="center"><strong>Doctor InCharge</strong></div></td>
    
    <td colspan="2"><div  align="center" ><strong>Action</strong></div></td>

</tr>
<% 
 int icount=0;

rs=stmt.executeQuery("select * from department");
while(rs.next())
{
%>

<tr>
<td><div align="center"><%=++icount%></div></td>
<td><%=rs.getString("dept_name")%></td>
<td><%=rs.getString("doctor")%></td>
<td><div align="center"><a href="manage_dept.jsp?remove_status=yes&dpname=<%=rs.getString("dept_name")%>" onclick="return rem()">Remove</a></div></td>
<td><div align="center"><a href="edit_dept.jsp?deptname=<%=rs.getString("dept_name")%>&docname=<%=rs.getString("doctor")%>">Edit</a></div></td>
<td><div align="center"><a href="manage_dept.jsp?delete_status=yes&dname=<%=rs.getString("dept_name")%>" onclick="return del()">Delete</a></div></td>
</tr>


<% } %> 
<%
                    if(String.valueOf(session.getAttribute("adddept")).equals("null"))
                    {}
                    
                    else
                    {
                    out.println(session.getAttribute("adddept"));
                    session.removeAttribute("adddept");
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