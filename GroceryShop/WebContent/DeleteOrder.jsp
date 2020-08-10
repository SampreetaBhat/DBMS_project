<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%try{
String b=request.getParameter("pid");
String c=request.getParameter("cid");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");
PreparedStatement ps=con.prepareStatement("delete from order_details where pid=? and cid=?");
ps.setString(1,b);
ps.setString(2,c);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("welcm5.html");

}
}catch(Exception e){
	response.sendRedirect("error8.html");

}
%>

</body>
</html>