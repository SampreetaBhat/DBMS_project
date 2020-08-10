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
h2{
margin:3;
padding: 0 20px;
text-align:center;
font-size:22px;
}
</style>

</head>
<body background="images/g3.jpg">
<div class="c">
<ul>
<li onclick="location.href='adminoperation.html';">BACK</li>
</ul>
</div>
<h1>product details</h1>
<table border="1" align="center">
<tr>
<td>product name</td>
<td>brand</td>
<td>manufactured date</td>
<td>expire date</td>
<td>price</td>
<td>product id</td>
</tr>

<%
try{
	connection=DriverManager.getConnection(connectionUrl+database,userid,password);
	stmt=connection.createStatement();
	String sql="select *from product";
	resultSet=stmt.executeQuery(sql);
	if(resultSet.next()){
	do{
	%>
	
		<tr>
		<td>
		<%=resultSet.getString("pname") %></td>
			<td>
			<%= resultSet.getString("brand") %></td>
			<td>
			<%= resultSet.getString("mfd") %></td>
			<td>
			<%= resultSet.getString("exp") %></td>
			<td>
			<%=resultSet.getString("price") %></td>
			<td>
			<%=resultSet.getString("pid") %></td>
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
<br><br> 
<h2>product type details</h2>
<table border="1" align="center">
<tr>
<td>product name</td>
<td>brand</td>
<td>no_of_items</td>
</tr>

<%
try{
	connection=DriverManager.getConnection(connectionUrl+database,userid,password);
	stmt=connection.createStatement();
	String sql="select pname,brand,no_of_items from product_type group by pname,brand,no_of_items";
	resultSet=stmt.executeQuery(sql);
	
	while(resultSet.next()){
	%>
		<tr>
		<td>
		<%=resultSet.getString("pname") %></td>
		<td>
		<%= resultSet.getString("brand") %></td>
			<td>
			<%= resultSet.getString("no_of_items") %></td>
			
		</tr>
	<% 
	}
	
connection.close();
} catch (Exception e){
e.printStackTrace();
}
%>
</table>

</body>
</html>