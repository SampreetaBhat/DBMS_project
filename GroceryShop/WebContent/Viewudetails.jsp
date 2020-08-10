<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="java.sql.*" %>
    <% 
String driver="com.mysql.jdbc.Driver";
String connectionUrl="jdbc:mysql://localhost:3306/";
String database="sdmit";
String userid="root";
String password="sams";

try{
Class.forName(driver);
}catch
(ClassNotFoundException e)
{
e.printStackTrace();
}
Connection connection=null;
Statement stmt=null;
ResultSet resultSet=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>.c ul{
list-style:none;
font-size:15px;
color:white;
background:black;
width:80px;
height:20px;
border-radius:50%;
top:0;
border-bottom:4px solid #fff;
}
.c ul:hover{
background-color:maroon;
}
h1{
margin:0;
padding:0 0 20px;
text-align:center;
font-size:22px;
}
</style>
<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button ";
window.onhashchange=function(){window.location.hash="no-back-button";}
</script>
</head>
<body background="images/g3.jpg">
<div class="c">
<ul>
<li onclick="location.href='adminoperation.html';">BACK</li>
</ul>
</div>
<h1>customer details</h1>
<table border="1" align="center">
<tr>
<td>name</td>
<td>gender</td>
<td>location</td>
<td>phone number</td>
<td>email id</td>
<td>password</td>
<td>customer id</td>
</tr>

<%
try{
	connection=DriverManager.getConnection(connectionUrl+database,userid,password);
	stmt=connection.createStatement();
	String sql="select *from customer";
	resultSet=stmt.executeQuery(sql);
	if(resultSet.next()){
	do{
	%>
	
		<tr>
		<td>
		<%=resultSet.getString("name") %></td>
			<td>
			<%= resultSet.getString("gender") %></td>
			<td>
			<%= resultSet.getString("location") %></td>
			<td>
			<%= resultSet.getString("phno") %></td>
			<td>
			<%=resultSet.getString("email") %></td>
			<td>
			<%=resultSet.getString("pwd") %></td>
			<td>
			<%=resultSet.getString("cid") %></td>
			</tr>
		
	<% 
	}while(resultSet.next());
		 
	}
	else{
		response.sendRedirect("error11.html");
	}
	


		

		
	
connection.close();
} catch (Exception e){
	response.sendRedirect("error11.html");
}
%>
</table>



</body>
</html>