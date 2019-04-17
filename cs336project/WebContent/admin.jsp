<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>
Create customer representative account <br>
<%
	CustomerRepresentative tempCR = new CustomerRepresentative(session);
	String tempText = "cr" + tempCR.maxCrid;
%>
<form action="addCustomerRepresentative.jsp" method="post">
Username: <input type="text" id="username" name="username" placeholder=<%=tempText%>><br>
Password: <input type="text" id="password" name="password" placeholder=<%=tempText%>><br>
<button type="submit" name="button" value="addAuction">Create customer representative account</button><br>
</form>

</body>
</html>