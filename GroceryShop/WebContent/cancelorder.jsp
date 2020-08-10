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
<style>
h1{
margin:0;
padding:0 0 20px;
color:black;
text-align:center;
font-size:40px;
}
h2{
margin:0;
padding:0 0 20px;
color:black;
text-align:right;
font-size:30px;
}
#c ul{
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
#c ul:hover{
background-color:maroon;
}

#container{
width:370px;
height:490px;
background:transparent;
color:black;
top:70%;
left:50%;
border-radius:10%;
border-top:1px solid black;
border-left:10px solid maroon;
border-bottom:3px solid maroon;
position:absolute;
transform:translate(-50%,-50%);
box-sizing:border-box;
padding:70px 30px;
}
#container input[type="text"],input[type="date"],input[type="number"]
{
border:none;
border-bottom: 1px solid #fff;
background:pink;
outline:none;
height:30px;
font-size:16px;
}
#container p{
margin:0;
padding:0;
font-weight:bold;
}
#container input{
top:0;
width:100%;
margin-bottom:20px;
}
#container input[type="submit"],input[type="reset"]
{
border:none;
outline:none;
height:40px;
background:black;
color:#fff;
font-size:18px;
border-radius:50px;
}
</style>
<script>
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button ";
window.onhashchange=function(){window.location.hash="no-back-button";}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/g3.jpg">
<h2>product stalk</h2>
<table border="1" align="right">
<tr>
<td>product name</td>
<td>product id</td>
</tr>

<%
try{
	connection=DriverManager.getConnection(connectionUrl+database,userid,password);
	stmt=connection.createStatement();
	String sql="select pname,pid from product";
	resultSet=stmt.executeQuery(sql);
	if(resultSet.next()){
	do{
	%>
	
		<tr>
		<td>
		<%=resultSet.getString("pname") %></td>
			<td>
			<%= resultSet.getString("pid") %></td>
			</tr>
		
	<% 
	}while(resultSet.next());
		 
	}
	else{
		response.sendRedirect("error10.html");
	}	
connection.close();
} catch (Exception e){
	response.sendRedirect("error10.html");
}
%>
</table>
<div id="c">
<ul>
<li onclick="location.href='useroperation.html';">BACK</li>
</ul>
</div>
<h1>cancel here</h1>
<div id="container">
<form action="Deleteproduct.jsp" method="post">
<p>product id</p>
<input type="number" name="pid" min="1" required/>
<p>customer id</p>
<input type="number" name="pid" min="1" required/>
<input type="submit" value="cancel"/>
<input type="reset" value="reset"/>
</form>
</div>
</body>
</html>