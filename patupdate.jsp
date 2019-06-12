<%@page import="java.sql.*" %>

<%
if(request.getParameter("pat_id")!=null) 
{
    String id=request.getParameter("pat_id"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); //create connection
            
        PreparedStatement pstmt1=null ; //create statement
        PreparedStatement pstmt2=null ; //create statement
        PreparedStatement pstmt3=null
        PreparedStatement pstmt4=null
        PreparedStatement pstmt5=null
                
        pstmt1=con.prepareStatement("select name from patient where name=?"); //sql select query
        pstmt1.setString(1,id);
        ResultSet rs1=pstmt1.executeQuery(); //execute query and set in resultset object rs.
        
        pstmt2=con.prepareStatement("select age from patient where name=?"); //sql select query
        pstmt2.setString(1,id);
        ResultSet rs2=pstmt2.executeQuery(); //execute query and set in resultset object rs.
        
        pstmt3=con.prepareStatement("select mobile from patient where name=?"); //sql select query
        pstmt3.setString(1,id);
        ResultSet rs3=pstmt3.executeQuery(); //execute query and set in resultset object rs.
        
        pstmt4=con.prepareStatement("select address from patient where name=?"); //sql select query
        pstmt4.setString(1,id);
        ResultSet rs4=pstmt4.executeQuery(); //execute query and set in resultset object rs.
        
        pstmt5=con.prepareStatement("select clinic from patient where name=?"); //sql select query
        pstmt5.setString(1,id);
        ResultSet rs5=pstmt5.executeQuery(); //execute query and set in resultset object rs.

        }
        con.close(); //close connection
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>