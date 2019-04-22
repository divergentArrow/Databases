<%--
	@author Jimmy Wen
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
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
<title>Edit Accounts</title>
</head>
<body>
<span>Edit Account Results:</span> <br>
<%
	CustomerRepresentative tempCR = new CustomerRepresentative(session);
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	String maxBid = request.getParameter("maxBid");
	
	if(user.isEmpty() || pass.isEmpty() || maxBid.isEmpty()){
		%>
		<span>You need to provide input to all input boxes!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	if(user.equalsIgnoreCase("admin")){
		%>
		<span>You don't have permission to edit this account!</span><br>
		<%
		return;
	} else if(user.charAt(0) == 'c' && user.charAt(1) == 'r'){
		try{
			int i = Integer.parseInt(user.substring(2));
			%>
			<span>You don't have permission to edit this account!</span><br>
			<%
			return;
		} catch(NumberFormatException e){
			System.out.println("No number after \"cr\"");
		}
	} else{
		try{
			float maxBidF = Float.parseFloat(maxBid);
			boolean success = tempCR.editUser(user, pass, maxBidF);
			if(success){
				%>
				<span>Success! The user edit request has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! An error with your request has occurred. Please check that the user exists.</span><br>
				<%
			}
		} catch(NumberFormatException e){
			e.printStackTrace();
			%>
			<span>Error: Maximum Bid must be a floating point number!</span><br>
			<%
			return;
		} catch(Exception e){
			e.printStackTrace();
			%>
			<span>An error occurred with the query. Please check all of your inputs and try again.</span><br>
			<%
		}
	}
%>

<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>

</body>
</html>