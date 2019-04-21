<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
    
<!DOCTYPE html>
<html class="bg">
<style>
.bg{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.box2{
  padding: 4px 4px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: Cornsilk ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 20%;
  align: center;
}
table{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
form{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
input{
	background-color: #FE6301;
	color: white;
}
span{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
a{
	border: 2px solid black;
	background-color: tan;
	color: blue;
}
td{
margin:5px;
padding: 9px;
}
th{
font-size:22px;
padding: 5px;
}
.show {display: block;}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Earnings per Item Type</title>
</head>
<body>
	
	<%
		User admin = new User(session);
		float carsEarnings = admin.getEarningsForCars();
		float truckEarnings = admin.getEarningsForTrucks();
		float suvEarnings = admin.getEarningsForSuvs();
	%>

	<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="2">Earnings per Item Type</th>
		</TR>

		<TR>
			<td>Item Type</td>
			<td>Price</td>
		</TR>

		<TR>
			<TD>Cars</TD>
			<TD>$<%=carsEarnings%></TD>
		</TR>
		
		<TR>
			<TD>Trucks</TD>
			<TD>$<%=truckEarnings%></TD>
		</TR>
		
		<TR>
			<TD>SUVs</TD>
			<TD>$<%=suvEarnings%></TD>
		</TR>

	</TABLE>


	<br>
	<br>
	
	<a href="generateSalesReports.jsp" class=box1>Return to Sales Reports page</a><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
</body>
</html>