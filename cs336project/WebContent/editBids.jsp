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
	CustomerRepresentative cr = new CustomerRepresentative(session);
	String bidID = request.getParameter("bidID");
	String auctionID = request.getParameter("auctionID");
	String sellerID = request.getParameter("sellerID");
	String buyerID = request.getParameter("buyerID");
	
	int bidIDInt;
	int auctionIDInt;

	if(bidID.isEmpty()){
		%>
		<span>You need to provide a Bid ID!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}if(auctionID.isEmpty() && sellerID.isEmpty() && buyerID.isEmpty()){
		%>
		<span>You need to edit at least one field of the bid!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	
	if(!auctionID.isEmpty()){
		try{
			boolean success1 = cr.editBHAuctionID(bidID, auctionID);
			if(success1){
				%>
				<span>Successfully updated Auction ID!</span><br>
				<%
			} else{
				%>
				<span>Oh no! Auction ID is invalid!</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>SQL Error occurred with editing Auction ID!</span><br>
			<%
		}
	}
	
	if(!sellerID.isEmpty()){
		try{
			boolean success1 = cr.editBHSellerID(bidID, sellerID);
			if(success1){
				%>
				<span>Successfully updated Seller ID!</span><br>
				<%
			} else{
				%>
				<span>Oh no! Seller ID is invalid!</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>SQL Error occurred with editing Seller ID!</span><br>
			<%
		}
	}
	
	if(!buyerID.isEmpty()){
		try{
			boolean success1 = cr.editBHBuyerID(bidID, buyerID);
			if(success1){
				%>
				<span>Successfully updated Buyer ID!</span><br>
				<%
			} else{
				%>
				<span>Oh no! Buyer ID is invalid!</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>SQL Error occurred with editing Buyer ID!</span><br>
			<%
		}
	}
%>

<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>

</body>
</html>