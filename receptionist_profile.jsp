<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

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
    <title>Receptionist Dashboard</title>
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
                    <h2><b>Change Profile</b></h2>
                    <table>     
                        
                    <tr><td><label id="pat_name"><b>Name: </b></label>
                    <input type="hidden" id="r_name" name="r_name" value="<%=request.getParameter("rname")%>">
                    <input type="text" name="rname" value="<%=request.getParameter("rname")%>" required size="35"></td></tr>
                  
                    <tr><td><label id="age" ><b>Age: </b></label>
                    <input type="text" name="rage" value="<%=request.getParameter("rage")%>" required maxlength="2" pattern="[0-9]{2}" size="35"><br></td></tr>
                    
                    <tr><td><label id="mobile" ><b>Mobile: </b></label>
                    <input type="text" name="rmobile" value="<%=request.getParameter("rmobile")%>" required required minlength="10" maxlength="10" pattern="[0-9]{10}" size="35" ><br></td></tr>
                    
                    <tr><td><label id="address" ><b>Address: </b></label>
                    <input type="text" name="raddress" value="<%=request.getParameter("raddress")%>" required size="35"><br></td></tr>
                    
                    <tr><td><label id="email" ><b>Email: </b></label>
                    <input type="text" name="remail" value="<%=request.getParameter("remail")%>" required size="35"><br></td></tr>
                    
                    <tr><td><label id="username" ><b>Username: </b></label>
                    <input type="text" name="rusername" value="<%=request.getParameter("rusername")%>" required size="35"><br></td></tr>
                    
                    <tr><td><label id="password" ><b>Password: </b></label>
                    <input type="password" name="rpassword" value="<%=request.getParameter("rpassword")%>" required size="35"><br><br></td></tr>
                                                            
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
                        String name = request.getParameter("r_name");
                        String rname = request.getParameter("rname");
                        String rage = request.getParameter("rage");
                        String rmobile = request.getParameter("rmobile");
                        String raddress = request.getParameter("raddress");
                        String remail = request.getParameter("remail");
                        String rusername = request.getParameter("rusername");
                        String rpassword = request.getParameter("rpassword");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                            String query = "SELECT * FROM receptionist";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(query);
                            while (rs.next()) {     
                            }
                            
                            query = "UPDATE receptionist SET username=(?), name=(?), email=(?), password=(?), age=(?), mobile=(?), address=(?) WHERE name='"+name+"'";
                            PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
                            ps.setString(1, rusername);
                            ps.setString(2, rname);
                            ps.setString(3, remail);
                            ps.setString(4, rpassword);
                            ps.setString(5, rage);
                            ps.setString(6, rmobile);
                            ps.setString(7, raddress);
                            session.setAttribute("update","Profile Updated Successfully");
                            ps.executeUpdate();
                            conn.close();
                            
                        } 
                        
                        catch (Exception ex) {
                        }
        %>
        					

                                                
              </div>  

                                       
                                                

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