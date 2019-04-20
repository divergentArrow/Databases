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
		System.out.println("starting redirect");
		Buyer buyer=new Buyer(session);
		System.out.println("this is user"+(String)session.getAttribute("user"));
		
		String vinS=request.getParameter("VIN");		
		//int vin = Integer.valueOf(vinS);
		int Auct_ID =Integer.parseInt(request.getParameter("Auction_ID"));
		int current_bid =Integer.parseInt(request.getParameter("current_bid"));
		//int max_bid =Integer.parseInt(request.getParameter("max_bid"));
		String buyerID = request.getParameter("buyerID");
		//System.out.println(vin);
		System.out.println(Auct_ID);
		System.out.println(current_bid);
			
		
		
		boolean success = false;
		try{
			if(true){
				//vin!=0 && Auct_ID!=0 && current_bid!=0 &&  !buyerID.isEmpty()
				//if(max_bid==0){
					System.out.print("running code on input");
					success = buyer.setAuction(Auct_ID, current_bid, buyerID);
				//} else{
					//code for no max bid
				//}
			}
		} catch(NullPointerException e){
			out.println("Null values for input not allowed!<br>");
		}
		
		if(success){
			out.println("Success! New auction request sent.<br>");
			out.println("This does NOT mean the request was valid!<br>");
			out.println("Return to Seller page to see result.<br>");
		}
		else{
			out.println("Error with input! Try again.<br>");
		}
	%>
<a href='buyer.jsp' class=box1>Return to buyer page</a>
		
		
	
		
%>

</body>
</html>
