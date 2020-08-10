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
<%try{
String d=request.getParameter("pid");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");
PreparedStatement ps=con.prepareStatement("delete from product where pid=?");
ps.setString(1,d);


int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("wlcm6.html");

}
else{
	response.sendRedirect("error5.html");
}
}catch(Exception e){
	response.sendRedirect("error5.html");

}

%>
</body>
</html>