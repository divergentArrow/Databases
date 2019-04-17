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
	<%
	User buyer = new User();
	buyer.setUsername((String)session.getAttribute("user"));
	System.out.println(buyer.getUsername());
	%>

	<div>
	<form action="buyerredirect.jsp" method="post">
	
	Vehicle IDN:<input type="text" name="VIN" placeholder="Please insert item name" />
	Auction_ID:<input type="text" name="Auction_ID" placeholder="123.45" />
	CrrBid amount:<input type="text" name="current_bid" placeholder="123.45" />
	maxBid amount:<input type="text" name="max_bid" placeholder="123.45" />
	Buy_ID:<input type="text" name="buyerID" placeholder="123.45" />	
	<input type="submit" value="ok" />
	</form>	
    <div>
	  	<%
		String n = request.getParameter("VIN");
		System.out.println(n);
		System.out.print("about to start runner inner code");
		int count=0;
	
	
		%>
      <div>
		<a href='success.jsp' class=box1>Welcome</a><br>
		<a href='logout.jsp' class=box1>Log out</a>
	  </div>
	  
	</div>
</body>

</html>
