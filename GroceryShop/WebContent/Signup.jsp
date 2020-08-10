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

String name=request.getParameter("uname");
String gender=request.getParameter("gender");
String location=request.getParameter("uloc");
String phno=request.getParameter("phno");
String em=request.getParameter("uemail");
String pd=request.getParameter("upwd");
PreparedStatement ps=con.prepareStatement("insert into customer values(?,?,?,?,?,?,null)");
ps.setString(1,name);
ps.setString(2,gender);
ps.setString(3,location);
ps.setString(4,phno);
ps.setString(5,em);
ps.setString(6,pd);
int a=ps.executeUpdate();
if(a==1)
{
	response.sendRedirect("welcome.html");
}


}catch(Exception e)
{

	response.sendRedirect("error3.html");

}
%>


</body>
</html>