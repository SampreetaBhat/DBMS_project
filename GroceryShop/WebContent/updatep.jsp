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
text-align:left;
font-size:22px;
}
h2{
margin:3;
padding: 0 20px;
text-align:center;
font-size:22px;
}
.cc{
top:50%;
left:30%;
position:absolute;
transform:(-50%,-50%);
}
.ccc{
top:10%;
left:50%;
position:absolute;
transform:(-30%,-30%);
}

#c ul{
list-style:none;
font-size:15px;
color:white;
background:transparent;
width:80px;
height:20px;
border-radius:50%;
top:0;
border-bottom:4px solid #fff;
}

#container{
width:350px;
height:620px;
background:transparent;
color:black;
top:55%;
left:30%;
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

</head>
<body background="images/g3.jpg">
<div class="c">
<ul>
<li onclick="location.href='adminoperation.html';">BACK</li>
</ul>
</div>
<div class="ccc">
<h1>product details</h1>
<table border="1" align="right">
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
</div>
<div id="container">
<form action="Productupdate.jsp" method="post">
<p>product name</p>
<input type="text" name="pname" required/>
<p>brand</p>
<input type="text" name="b" required/>
<p>manufacture date</p>
<input type="date" name="m" required/>
<p>expire date</p>
<input type="date" name="e" required/>
<p>price</p>
<input type="number" name="pr" min="1" required/>
<p>product id</p>
<input type="number" name="pid"  required/>
<input type="submit" value="update"/>
<input type="reset" value="reset"/>
</form>
</div>
</body>
</html>