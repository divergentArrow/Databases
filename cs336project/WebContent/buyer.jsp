<%--
	@author Kamarudeen Ayankunbi
 --%>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Buy</title>
</head>

<body>
	<%
	String Username=(String)session.getAttribute("user");
	
	
	%>
	<b>Buyer:<%= Username %></b>
    <br/>
	

	<div>
	<form action="buyerredirect.jsp" method="post">
	

	Auction_ID:<input type="text" name="Auction_ID" placeholder="1949" /><br>
	CrrBid amount:<input type="text" name="current_bid" placeholder="0" /><br>
	Secret upperlim amount:<input type="text" name="upperlim_bid" placeholder="0" /><br>
	
	<input type="submit" value="Bid" />
	</form>	
		
	
    </div>
	  	<%
		String n = request.getParameter("VIN");
		System.out.println(n);
		System.out.print("about to start runner inner code");
		int count=0;
	
	
		%>
		
		
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
				<td>Bid Amount</td>
			</tr>
		<%
			System.out.println("cool getting started");
			Buyer buyer = new Buyer(session);
			System.out.println(session.getAttribute("user"));

			while(buyer.rs.next()){
			System.out.println("what is going in");
		%>
	
		<%
			}
		%>
		</table>
		
			
	
		
		
		
		
		
		
		
		
		
      <div>
		<a href='success.jsp' class=box1>Welcome</a><br>
		<a href='logout.jsp' class=box1>Log out</a>
	  </div>
	  
	  
	  
	  
	  
	  
	  
	  
	  
	</div>
</body>

</html>

