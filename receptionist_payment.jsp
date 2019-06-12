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
<html>
 
<head>    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<form method="post">
<div class="container">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Dental Care!</strong>
                        <br>
                        Jai Hind College
                        <br>
                        Churchgate, 400020
                        <br>
                        <abbr title="Phone">Ph no:</abbr> 8652389488
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em> <b>Date:</b> <span id="date"></span> 
                        <script>
                            var dt = new Date();
                            document.getElementById("date").innerHTML = dt.toLocaleDateString();
                        </script></em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                </span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Treatment Cost</th>
                            <th class="text-center">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try{    
                                Class.forName("com.mysql.jdbc.Driver").newInstance();    
                                String patname = request.getParameter("patname");  
                                Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                                String query1 = "SELECT cost FROM patient where name='"+patname+"'";
                                Statement st1 = conn1.createStatement();
                                ResultSet rs1 = st1.executeQuery(query1);
                                while (rs1.next()) { 
                                String d=rs1.getString("cost");
%>
                        <tr>
                            <td class="col-md-9"><em>Doctor Charge</em></h4></td>
                            <td class="col-md-1 text-center"><input type="text" id="txt1" value="<%out.println(d);%>" readonly/></td>
                        </tr>
                        <%}}
                        catch(Exception ex){
                                out.println(ex);
                            }
                        %>
                        <tr>
                            <td class="col-md-9"><em>Donation</em></h4></td>
                            <td class="col-md-1 text-center"><input type="number" name="donation" id="donation" onkeyup="sum();"/></td>
                        </tr>
                    <script type="text/javascript">
                        function sum() {
                            var txtFirstNumberValue = document.getElementById('txt1').value;
                            var txtdonationValue = document.getElementById('donation').value;
                            var result = parseInt(txtFirstNumberValue) + parseInt(txtdonationValue);
                            if (!isNaN(result)) {
                                document.getElementById('txt2').value = result;
                                }
                            }
                        </script>
                        <tr>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            
                            <td class="text-center text-danger"><h4><strong><input type="text" id="txt2" name="txt2" readonly/></strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-success btn-lg btn-block" value="Pay" />
                
                <%
                        try{       
                            Class.forName("com.mysql.jdbc.Driver");                             
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                              
                            String patname = request.getParameter("patname");  
                            String total = request.getParameter("txt2");  
//                            String total = session.getAttribute("total").toString(); 
                            
                            String query = "UPDATE patient SET cost=(?), paid=(?) WHERE name='"+patname+"'";
                            PreparedStatement ps = conn.prepareStatement(query);
                            ps.setString(1, total);
                            ps.setString(2, "1");
                            ps.executeUpdate();
                            session.setAttribute("report","Payment done successfully");%>
                            <script>
                            parent.window.close();
                            </script>
                            <%
                            
                    }
                            catch(Exception ex){
                            }
                %>
                
            </div>
        </div>
    </div>
</div>
    </form>
                
</body>
</html>
