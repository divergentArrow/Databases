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
<title>Delete Auction</title>
</head>
<body>
<span>Delete Auction Results:</span> <br>
<%
	CustomerRepresentative cr = new CustomerRepresentative(session);
	String auctionID = request.getParameter("dauctionID");
	
	int auctionIDInt;

	if(auctionID.isEmpty()){
		%>
		<span>You need to provide an Auction ID!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	
	
	try{
		auctionIDInt = Integer.parseInt(auctionID);
		boolean success = cr.removeAuction(auctionID);
		if(success){
			%>
			<span>Successfully deleted Auction #<%=auctionID %>!</span><br>
			<%
		} else{
			%>
			<span>This auction does not exist!</span><br>
			<%
		}
	} catch(Exception e){
		%>
		<span>This auction does not exist!</span><br>
		<%
	}
%>

<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>

</body>
</html>