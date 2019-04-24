<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*, java.sql.*" %>
<!DOCTYPE html>
<html class="bg">
<style>
.bg{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.box2{
  padding: 4px 4px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: Cornsilk ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 20%;
  align: center;
}
table{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
form{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
input{
	background-color: #FE6301;
	color: white;
}
span{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
a{
	border: 2px solid black;
	background-color: tan;
	color: blue;
}
td{
margin:5px;
padding: 9px;
}
th{
font-size:22px;
padding: 5px;
}
.show {display: block;}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="BrowsebuyID.jsp" method="post">
What is the Buyer's ID? 
<input type="text" id="buyID" name="buyID" placeholder="Tim123"><br>
<button type="submit" name="button" value="buyerID">View Buyer's History</button><br>

<br>
<a href='success.jsp' class=box1>Home</a><br>
<br>
<a href='itemTable.jsp' class=box1>Cancel</a><br>
<br>
<a href='logout.jsp' class=box1>Log out</a>
</form>
</body>
</html>