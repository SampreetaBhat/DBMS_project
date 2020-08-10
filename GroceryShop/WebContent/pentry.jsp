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
<% try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");

String pname=request.getParameter("pname");
String brand=request.getParameter("brand");
String mfd=request.getParameter("mdate");
String exp=request.getParameter("edate");
String price=request.getParameter("price");
PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,null)");
ps.setString(1,pname);
ps.setString(2,brand);
ps.setString(3,mfd);
ps.setString(4,exp);
ps.setString(5,price);

int i=ps.executeUpdate();
if(i==1)
{
	response.sendRedirect("wlcm3.html");
}
	   

}catch(Exception e){
	response.sendRedirect("error4.html");

}

%>
</body>
</html>