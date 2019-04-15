<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html class="bg">
<head>
<title>Welcome!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.box1{
  padding: 16px 16px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: #33b5e5;
  color: #ffffff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}
.box2{
  padding: 4px 4px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: Cornsilk ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 20%;
}
.box1:hover {
  background-color: #0099cc;
}
.bg{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.box3{
  padding: 4px 4px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: Cornsilk ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 20%;
}
.box3:hover {
  background-color: #0099cc;
}
a {
font-size: 20px;
}
.tabItem{
 background-color: Brown;
  color: Cornsilk ;
  align: center;}
td{
align: center;}

</style>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
	%>
		You are not logged in<br/>
		<a href="index.jsp">Please Login or Register</a>
	<%
	} 
	else {
	%>
	<center>
	<div align="center" class=box2>
	<h1 align=center >
	Welcome <%=session.getAttribute("user")%>!</h1>
	</div>  <!--//this will display the username that is stored in the session.-->
	</center>
	<br>
	<br>
		<center><div align="center" class=box3><A HREF="itemTable.jsp" ><h2 style="color:white">Show data from table</h2></A></div></center>
<br>
<br>
	<a href='logout.jsp' class=box1>Log out</a>
	</body>
	</html>
	<%
	}
	%>