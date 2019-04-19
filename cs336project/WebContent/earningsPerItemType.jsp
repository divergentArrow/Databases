<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
    
<!DOCTYPE html>
<html>
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