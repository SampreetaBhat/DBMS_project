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
<td>product name</td>
<td>brand</td>
<td>product id</td>
<td>customer name</td>
<td>customer id</td>
<td>order id</td>
</tr>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");
	CallableStatement cmt=connection.prepareCall("CALL ord_disp();");
	ResultSet resultSet=cmt.executeQuery();
	if(resultSet.next()){

		do{
	%>
		<tr>
		<td>
		<%=resultSet.getString("pname") %></td>
			<td>
			<%= resultSet.getString("brand") %></td>
			<td>
			<%= resultSet.getString("pid") %></td>
			<td>
			<%= resultSet.getString("name") %></td>
			<td>
			<%=resultSet.getString("cid") %></td>
			<td>
			<%=resultSet.getString("oid") %></td>
			</tr>
	<% 
		}while(resultSet.next());
	}
	else{
		response.sendRedirect("error11.html");
	}
		
	
connection.close();
} catch (Exception e){

	System.out.println("error"+e);
	response.sendRedirect("error11.html");

}
%>
</table>



</body>
</html>