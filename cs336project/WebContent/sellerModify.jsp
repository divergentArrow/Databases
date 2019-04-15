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
			if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()){
				if(minPrice.isEmpty()){
					seller.updateItem(vin, sdt, cdt);
				} else{
					seller.updateItem(vin, sdt, cdt, minPrice);
				}
			}
		%>
	Item modification request sent.
	<a href='seller.jsp' class=box1>Return to Seller page</a>
	</div>
</body>