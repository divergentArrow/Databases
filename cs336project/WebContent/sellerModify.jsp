<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Modify Seller</title>
</head>

<body>
	<div>
	<%
			String contextPath = request.getContextPath();
		
			Seller seller = new Seller(session);
			String vin = request.getParameter("vin");
			String sdt = request.getParameter("sdt");
			String cdt = request.getParameter("cdt");
			String minPrice = request.getParameter("minPrice");
			boolean success = false;
			if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()){
				if(minPrice.isEmpty()){
					success = seller.updateItem(vin, sdt, cdt);
				} else{
					success = seller.updateItem(vin, sdt, cdt, minPrice);
				}
			}
			
			if(success){
				out.println("Success! Item modification request sent.<br>");
				out.println("This does NOT mean the request was valid!<br>");
				out.println("Return to Seller page to see result.<br>");
			}
			else{
				out.println("Error with input! Try again.<br>");
			}
		%>
	<a href='seller.jsp' class=box1>Return to Seller page</a>
	</div>
</body>