<%@page import="java.sql.*" %>

<%
if(request.getParameter("doc_id")!=null) 
{
    String id=request.getParameter("doc_id"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver"); //load driver
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root",""); //create connection
            
        PreparedStatement pstmt=null ; //create statement
        PreparedStatement pstmt1=null ; //create statement
                
        pstmt=con.prepareStatement("select doctor from department" ); //sql select query
        pstmt1=con.prepareStatement("select name from doctor");
        pstmt.setString(1,id);
        ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.
        ResultSet rs1=pstmt1.executeQuery();
                        
        %>           
        <%    
        while(rs.next())
        {
        %>        
            <option value="<%=rs.getString("doctor")%>">
                
                <%=rs.getString("doctor")%>
            </option>
        <%
        }
        while(rs1.next())
        {
        %>        
            <option value="<%=rs1.getString("name")%>">
                <%=rs1.getString("name")%>
            </option>
<%
        }
        con.close(); //close connection
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>