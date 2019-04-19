<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Reports</title>
</head>
<body>
	
	Total earnings:<br>
	<%
		User admin = new User(session);
		float totalSales = admin.getSumOfSales();
		String formattedSales = String.format("%.02f", totalSales);
	%>
	$<%=formattedSales %>
	<br>
	<br>
	<a href="earningsPerItem.jsp" class=box1>View earnings per item</a><br>
	<br>
	<a href="earningsPerItemType.jsp" class=box1>View earnings per item type</a>
	<br>
	<a href="earningsPerSeller.jsp" class=box1>View earnings per seller</a>
	<br><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
	
</body>
</html>