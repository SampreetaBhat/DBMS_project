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
String brand=request.getParameter("brand");
String pid=request.getParameter("pid");
String name=request.getParameter("name");
String cid=request.getParameter("cid");
PreparedStatement ps=con.prepareStatement("insert into order_details values(?,?,?,?,?,null)");
ps.setString(1,pname);
ps.setString(2,brand);
ps.setString(3,pid);
ps.setString(4,name);
ps.setString(5,cid);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("welcome2.html");
}
	   
}catch(Exception e){
	response.sendRedirect("error6.html");

}

%>

</body>
</html>