<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	Total earnings:<br>
	<%
		User admin = new User(session);
		float totalSales = admin.getSumOfSales();
	%>
	$<%=totalSales %>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
	
</body>
</html>