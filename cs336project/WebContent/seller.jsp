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
		Set all characteristics of item (input item name): <input type="text" name="item"><button type="button" id="setrharacteristicsButton">Set</button><br>
		Set closing date: <input type="text" id="cdate"><button type="button" id="setDateButton">Set</button><br>
		Set closing time: <input type="text" id="ctime"><button type="button" id="setTimeButton">Set</button><br>
		Set minimum price: <input type="text" id="minPrice"><button type="button" id="setMinPriceButton">Set</button><br>
		<button type="button" id="startAuction">Start Auction</button>
	</div>
	<div>
		<br></br>
		My Auctions
		<br></br>
		
		<table border="2">
			<tr>
				<td>Winner</td>
				<td>Start time</td>
				<td>Auction ID</td>
				<td>Seller ID</td>
				<td>Buyer ID</td>
				<td>VIN</td>
				<td>End time</td>
			</tr>
		<%
			Seller seller = new Seller(session);
			while(seller.rs.next()){
		%>
			<tr>
				<td><%out.println(seller.rs.getString("winner")); %></td>
				<td><%out.println(seller.rs.getDate("start_time")); %></td>
				<td><%out.println(seller.rs.getInt("Auction_ID")); %></td>
				<td><%out.println(seller.rs.getString("sellerID")); %></td>
				<td><%out.println(seller.rs.getString("buyerID")); %></td>
				<td><%out.println(seller.rs.getInt("vin")); %></td>
				<td><%out.println(seller.rs.getDate("end_time")); %></td>
			</tr>
		<%
			}
		%>
		</table>
	</div>
</body>

</html>