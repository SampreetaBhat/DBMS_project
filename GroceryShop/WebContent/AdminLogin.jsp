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
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");

String uname=request.getParameter("aname");
String pwd=request.getParameter("pwd");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select *from adminlogin where username='"+uname+"' and password='"+pwd+"'");
	if(rs.next()){
		response.sendRedirect("adminoperation.html");		
		}
	else{
			 response.sendRedirect("error.html");
	}
	con.close();
}catch(Exception e){
	System.out.println("error"+e);
	response.sendRedirect("error.html");
}



%>
</body>
</html>