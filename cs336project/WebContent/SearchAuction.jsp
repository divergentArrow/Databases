<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="BrowseAuctionID.jsp" method="post">
Which Auction ID's History did you want to look at? 
<input type="text" id="AucID" name="AucID" placeholder="1950"><br>
 <button type="submit" name="button" value="aucID">View Auction History</button><br>
<a href='success.jsp' class=box1>Home</a><br>
<br>
<a href='itemTable.jsp' class=box1>Cancel</a><br>
<br>
<a href='logout.jsp' class=box1>Log out</a>
</body>
</html>