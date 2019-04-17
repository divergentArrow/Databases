
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>  
<%@ page import="cs336project.*" %>

   
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Sell</title>
</head>

<body>
	<div>
	
	<form action="buyer.jsp" method="post">
	Item name:
	<input type="text" name="VIN" placeholder="Please insert item name" />
	<input type="submit" value="ok" />
	</form>	

	<form action="buyer.jsp" method="post">
	Your offer:
	<input type="text" name="Auction_ID" placeholder="123.45" />
	<input type="submit" value="ok" />
	</form>	
	
	<form action="buyer.jsp" method="post">
	Item amount:
	<input type="text" name="current_bid" placeholder="123.45" />
	<input type="submit" value="ok" />
	</form>	
	
	
	<form action="number" method="post">
	Item amount:
	<input type="text" name="max_bid" placeholder="123.45" />
	<input type="submit" value="ok" />
	</form>	
	
	<form action="buyer.jsp" method="post">
	Item amount:
	<input type="text" name="buyerID" placeholder="123.45" />
	<input type="submit" value="ok" />
	</form>	
	
	
		
	</div>
	

	
	<div>
		<div>
		My Items
		<br></br>
		[Insert buyer table for seller here]
		
		<%
		String n = request.getParameter("VIN");
		System.out.println(n);
		int g=Integer.parseInt(n);
		System.out.println(g);
		Buyer buyer=new Buyer();
		buyer.testMethod(0,0,0,0,n);
		
/*
		int vin =Integer.parseInt(request.getParameter("VIN"));
		int Auct_ID =Integer.parseInt(request.getParameter("Auction_ID"));
		int current_bid =Integer.parseInt(request.getParameter("current_bid"));
		int max_bid =Integer.parseInt(request.getParameter("max_bid"));
		String buyerID = request.getParameter("buyerID");
		
*/


			/*	
		Buyer buyer=new Buyer();
		buyer.testMethod(vin,Auct_ID,current_bid,max_bid,buyerID);*/
				
				
		//mybuyer.InsertBuyerBid(session, fName, fAmount);
	
		//cs336project.Buyer.InsertBuyerBid(session, fName,fAmount);		
		%>
		 <%-- Here we use the JSP expression tag to display value  
         stored in a variable 
    --%> 
    
    <h2>The text entered was : </h2> 
	</div>
	</div>
	
	<div>
	<button type='success.jsp'><-- GO BACK</button></TD>
	</div>
</body>

</html>