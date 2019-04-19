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
			admin.rs = admin.getEarningsPerSeller();
	%>
	
	<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="2">Earnings per User</th>
		</TR>

		<TR>
			<td>User</td>
			<td>Earnings</td>
		</TR>
		<%
			while (admin.rs.next()) {
				float sales = admin.rs.getFloat(2);
				String formattedSales = String.format("%.02f", sales);
		%>

		<TR>
			<TD><%=admin.rs.getString(1)%></TD>
			<TD><%=formattedSales%></TD>
		</TR>

		<% 	}
				admin.rs = admin.getEarningsPerNonSeller();
				while (admin.rs.next()) {
		%>
		
		<TR>
			<TD><%=admin.rs.getString(1)%></TD>
			<TD>$0.00</TD>
		</TR>
		<% 		}
			}
		catch(Exception e){
		%>
			<TR>
				<TD>NO SOLD ITEMS EXIST YET</TD>
				<TD>0</TD>
			</TR>
		<%}%>
	</TABLE>


	<br>
	<br>
	
	<a href="earningsPerSeller.jsp" class=box1>Return to Earnings per Seller page</a><br>
	<a href="generateSalesReports.jsp" class=box1>Return to Sales Reports page</a><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
</body>
</html>