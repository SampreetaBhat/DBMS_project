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
<style>
.class{
position:absolute;
top:50%;
left:45%;
font-size:20px;
transform:translate(-50%,-50%);
}
.class input[type="button"]
{
border:none;
outline:none;
height:40px;
background:black;
color:#fff;
font-size:18px;
border-radius:20px;
width:150%;
}
.container{
position:absolute;
top:30%;
left:50%;
color:red;
font-size:20px;
transform:translate(-50%,-50%);
}
.g table{
top:30%;
left:50%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/g3.jpg">
<div class="g">
<table border="1" align="center">
<tr>
<td>your id</td>
<td>email id</td>
<td>password</td>
</tr>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdmit","root","sams");

String username=request.getParameter("uemail");
String password=request.getParameter("upwd");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select email,pwd from customer where email='"+username+"' and pwd='"+password+"'");
try{
	if(rs.next()){
		stmt=con.createStatement();
		String sql="select cid,email,pwd from customer where email='"+username+"' and pwd='"+password+"'";
		ResultSet rs1=stmt.executeQuery(sql);
		if(rs1.next()){
			%>
			<tr>
			<td>
			<%=rs1.getString("cid") %></td>
			<td>
			<%=rs1.getString("email") %></td>
			<td>
			<%=rs1.getString("pwd") %></td>
			</tr>
				
		<%	
		}
	}
	else{
		response.sendRedirect("error2.html");
		
	}
		
	con.close();
}catch(Exception e){
	System.out.println("error"+e);
	
	
	
}
%>
</table>
</div>
<div class="container"><h1>please remember your id,email and password </h1></div>
<div class="class">
<input type="button" value="start now" onclick="location.href='useroperation.html';"/>
</div>
</body>
</html>