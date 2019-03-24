<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
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
.box1:hover {
  background-color: #0099cc;
}
body{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	overflow: hidden;
	width:auto;
	height:auto;
	margin: 0;
	padding: 0;
}

</style>
<%
    if ((session.getAttribute("user") == null)) {
	%>
		You are not logged in<br/>
		<a href="index.jsp">Please Login or Register</a>
	<%
	} 
	else {
	%>
	<h2 align=center style="color:blue">
	Welcome <%=session.getAttribute("user")%>!</h2>  <!--//this will display the username that is stored in the session.-->
	<br>
	<br>
	<a href='logout.jsp' class=box1>Log out</a>
	<%
	}
	%>