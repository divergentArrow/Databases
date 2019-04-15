<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Sell</title>
</head>

<body>
	<div>
		Modify item characteristics
		<br></br>
		VIN: <input type="text" id="vin" placeholder="123456789">
		Set start date and time: <input type="text" id="sdt" placeholder="YYYY-MM-DD HH:MM:SS">
		Set closing date and time: <input type="text" id="cdt" placeholder="YYYY-MM-DD HH:MM:SS">
		Set minimum price: <input type="text" id="minPrice" placeholder="123.45">
		<button type="button" id="modifyItem">Modify Item</button>
		<button type="button" id="startAuction">Start Auction</button>
	</div>
	<div>
		<br></br>
		My Auctions
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
	</div>
</body>

</html>