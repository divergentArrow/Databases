<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Beer World</title>




</head>
<body>
<%
		Buyer buyer=new Buyer();
		
		String vinS=request.getParameter("VIN");		
		int vin = Integer.valueOf(vinS);
		int Auct_ID =Integer.parseInt(request.getParameter("Auction_ID"));
		int current_bid =Integer.parseInt(request.getParameter("current_bid"));
		int max_bid =Integer.parseInt(request.getParameter("max_bid"));
		String buyerID = request.getParameter("buyerID");
		System.out.print("go go");
		
		
		buyer.testMethod(vin,Auct_ID,current_bid,max_bid,buyerID);
		
		
%>

</body>
</html>
