<%-- 
    Document   : home
    Created on : Feb 9, 2019, 7:21:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="icon" type="image/png" sizes="16x16" href="dmslogo.png">
                <title>Dental Care</title>                
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="home.jsp">Home</a></li>
                                        <li><a href="login.jsp">Login</a></li>
					<li><a href="book_appoint.jsp">Book Appointment</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Dental Care!</h1>
						<p>Dental Clinic Management System, a perfect explication for a dental clinic Management of patients that provides ease for the clinic with options like Easy Online Appointment Booking, Patient Registration, Prescription Management.</p>
					</header>
					<a href="#main" class="button big scrolly">Learn More</a>
				</div>
			</section>

		<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<!-- 2 Columns -->
								<div class="flex flex-2">
									<div class="col col1">
										<div class="image round fit">
											<a href="generic.html" class="link"><img src="images/smile.jpg" alt="" /></a>
										</div>
									</div>
									<div class="col col2">
										<h3>ABSTRACT</h3>
										<p>Dental Clinic Management System, a perfect explication for a dental clinic Management of patients that provides ease for the clinic with options like Easy Online Appointment Booking, Patient Registration, Prescription Management, Add Case History, Medication etc.Dental software provides easy access of the data in advanced and ordered fashion. The software maintains individual patient account ledgers for each treatment. Also includes appointment schedule. It is easy to search and retrieve the information stored, related to patients. Previous medical records are used to manage documents of patients visited earlier. It includes complete reporting system and helps to build the Dental Case Reports. Advanced document management system to manage the documents of patients.</p>
									</div>
								</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style2">
						<div class="inner">
							<div class="flex flex-2">
								<div class="col col2">
									<h3>Objective</h3>
									<p>This project aims at creating an application which will automate the process in Dental Software. Using this it is possible to keep a track of a database for clinic like information about the patient like appointment schedule, personal records, previous medical records, treatment records, prescriptions, case reports and images. The dental software is used for collecting, managing, saving, and retrieving medical information for the patients, and for creating reports for the patients. Patient records are used by the dentists in order to organize the records of the patients in their practice. The dental imaging, deﬁnes software used for creating, processing, viewing and storing dental X-Rays, intra and extra-oral images.</p>
								</div>
								<div class="col col1 first">
									<div class="image round fit">
										<a href="#" class="link"><img src="dmslogo.png" alt="" /></a>
									</div>
								</div>
							</div>
						</div>
					</section><br><br><br><br>

				<!-- Section -->
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
                                                <th>Doctor Name</th>
                                                <th>Mobile Number</th>
                                            </tr>
                                        </thead>
                <%
                                            
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        
                        Statement stmt1 = conn1.createStatement();
                        
                        int count1=0;
                        ResultSet rs1=stmt1.executeQuery("select * from doctor where in_clinic=1");
                        while(rs1.next())
                        {

                %>
                                        <tbody>
                                            <tr>
                                                <td><%=++count1%></td>
                                                <td><%=rs1.getString("name")%></td>
                                                <td><%=rs1.getString("mobile")%></td>
                                            </tr>
                        <%}%>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                                        
                                        <br><br><br><br>
                                        <div class="col-lg-16">
                        <div class="card">                            
                            <div class="card-title">                                
                                <h4>Departments In Clinic</h4>                         
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Sr.No</th>
                                                <th>Department Name</th>
                                                <th>Doctor Incharge</th>
                                            </tr>
                                        </thead>
                <%
                                            
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                        
                        Statement stmt = conn1.createStatement();
                        
                        int count=0;
                        ResultSet rs=stmt.executeQuery("select * from department");
                        while(rs.next())
                        {

                %>
                                        <tbody>
                                            <tr>
                                                <td><%=++count%></td>
                                                <td><%=rs.getString("dept_name")%></td>
                                                <td><%=rs.getString("doctor")%></td>
                                            </tr>
                        <%}%>                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
