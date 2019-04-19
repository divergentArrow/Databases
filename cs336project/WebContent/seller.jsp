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
div span{
	border: 2px solid black;
	background-color: Brown;
	color: white;
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
<title>Sell</title>
</head>

<body>
	<div id=page>
		<span>Modify item characteristics or add an auction</span>
		<br></br>
		<form action="sellerModify.jsp" method="post">
		VIN: <input type="text" id="vin" name="vin" placeholder="123456789"><br>
		Set start date and time: <input type="text" id="sdt" name="sdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set closing date and time: <input type="text" id="cdt" name="cdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set minimum price: <input type="text" id="minPrice" name="minPrice" placeholder="123.45"/><br>
		<button type="submit" name="button" value="modifyItem">Modify Item</button><br>
		</form>
		<br></br>
		<form action="sellerAddAuction.jsp" method="post">
		VIN: <input type="text" id="vin" name="vin" placeholder="123456789"><br>
		Set start date and time: <input type="text" id="sdt" name="sdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set closing date and time: <input type="text" id="cdt" name="cdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set minimum price: <input type="text" id="minPrice" name="minPrice" placeholder="123.45"/><br>
		<button type="submit" name="button" value="addAuction">Add Auction</button><br>
		</form>
	</div>
	<div id=auctionTable>
		<br></br>
		<span>My Auctions</span>
		<br></br>
		
		<table border="2">
			<tr>
				<td>Auction ID</td>
				<td>VIN</td>
				<td>Winner</td>
				<td>Seller ID</td>
				<td>Buyer ID</td>
				<td>Start time</td>
				<td>End time</td>
				<td>Minimum Price</td>
			</tr>
		<%
			System.out.println("cool getting started");
			Seller seller = new Seller(session);
			while(seller.rs.next()){
		%>
			<tr>
				<td><%out.println(seller.rs.getInt("Auction_ID")); %></td>
				<td><%out.println(seller.rs.getInt("vin")); %></td>
				<td><%out.println(seller.rs.getString("winner")); %></td>
				<td><%out.println(seller.rs.getString("sellerID")); %></td>
				<td><%out.println(seller.rs.getString("buyerID")); %></td>
				<td><%out.println(seller.rs.getDate("start_time")); %></td>
				<td><%out.println(seller.rs.getDate("end_time")); %></td>
				<td><%out.println(seller.rs.getFloat("minPrice")); %></td>
			</tr>
		<%
			}
		%>
		</table>
		<a href='success.jsp' class=box1>Home</a><br>
		<a href='logout.jsp' class=box1>Log out</a>
	</div>
</body>

</html>
