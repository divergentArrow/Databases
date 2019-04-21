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
	width: 50%;
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
<title>Best-selling Vehicles</title>
</head>
<body>
	
	<%
		User admin = new User(session);
		String maxItems = request.getParameter("maxResults");
		try{
			int maxResults = Integer.parseInt(maxItems);
			admin.rs = admin.getBestSellingItems(maxResults);
	%>
	
	<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="5">Best-selling Vehicles</th>
		</TR>

		<TR>
			<td>VIN</td>
			<td>Make</td>
			<td>Model</td>
			<td>Color</td>
			<td>Final Bid</td>
		</TR>
		<%
			while (admin.rs.next()) {
				int vin = admin.rs.getInt(1);
				String make = admin.rs.getString(2);
				String model = admin.rs.getString(3);
				String color = admin.rs.getString(4);
				float finalBid = admin.rs.getFloat(5);
				String formattedSales = String.format("%.02f", finalBid);
		%>

		<TR>
			<TD><%=vin%></TD>
			<TD><%=make%></TD>
			<TD><%=model%></TD>
			<TD><%=color%></TD>
			<TD><%=formattedSales%></TD>
		</TR>

		<% 	}
		} catch(Exception e){
		%>
			<TR>
				<TD><span>Either the value entered was not greater than 0 or no sold items exist yet.</span></TD>
				<TD></TD>
			</TR>
		<%}%>
	</TABLE>


	<br>
	<br>
	
	<a href="generateSalesReports.jsp" class=box1>Return to Sales Reports page</a><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
</body>
</html>