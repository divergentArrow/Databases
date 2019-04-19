<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Earnings per Item</title>
</head>
<body>
	
	<%
		User admin = new User(session);
		try{
			admin.rs = admin.getEarningsPerItem();
	%>

	<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="2">Earnings per Item</th>
		</TR>

		<TR>
			<td>VIN</td>
			<td>Earnings</td>
		</TR>
		<%
			while (admin.rs.next()) {
				float sales = admin.rs.getFloat(2);
				String formattedSales = String.format("%.02f", sales);
		%>

		<TR>
			<TD><%=admin.rs.getInt(1)%></TD>
			<TD>$<%=formattedSales %></TD>
		</TR>

		<% }
		} catch(Exception e){
		%>
		<TR>
			<TD>NO SOLD ITEMS EXIST YET</TD>
			<TD>0</TD>
		</TR>
		<%
		}
		%>
	</TABLE>


	<br>
	<br>
	
	<a href="generateSalesReports.jsp" class=box1>Return to Sales Reports page</a><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
</body>
</html>