<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Auction</title>
</head>
<body>
	<%
			Seller seller = new Seller(session);
			String vin = request.getParameter("vin");
			String sdt = request.getParameter("sdt");
			String cdt = request.getParameter("cdt");
			String minPrice = request.getParameter("minPrice");
			String color = request.getParameter("color");
			String make = request.getParameter("make");
			String model = request.getParameter("model");
			String vehicle = request.getParameter("vehicles")
			if(vehicle.equals("truck")){
				
			}
			else if(vehicle.equals("cars")){
				
			}
			else if(vehicle.equals("suv")){
				
			}
			boolean success = false;
			try{
				if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()&& !color.isEmpty() && !make.isEmpty() && !model.isEmpty()){
					if(minPrice.isEmpty()){
						success = seller.addAuction(vin, sdt, cdt,color,make,model);
					} else{
						success = seller.addAuction(vin, sdt, cdt, minPrice);
					}
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
	<a href='seller.jsp' class=box1>Return to Seller page</a>
</body>
</html>