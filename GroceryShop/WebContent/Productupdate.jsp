<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try{

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");
	
	String pname=request.getParameter("pname");
	String brand=request.getParameter("b");
	String mfd=request.getParameter("m");
	String exp=request.getParameter("e");
	String price=request.getParameter("pr");
	String pid=request.getParameter("pid");
	PreparedStatement ps=con.prepareStatement("update product set pname=?,brand=?,mfd=?,exp=?,price=? where pid=?");
	ps.setString(1,pname);
	ps.setString(2,brand);
	ps.setString(3,mfd);
	ps.setString(4,exp);
	ps.setString(5,price);
	ps.setString(6,pid);
    int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("wlcm4.html");
}

	
}
catch(Exception e)
{
	response.sendRedirect("errer7.html");
	
}
%>
</body>
</html>