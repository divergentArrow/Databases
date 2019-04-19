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
::-webkit-input-placeholder { /* Chrome */
  color: #B0AEAE;
}
:-ms-input-placeholder { /* IE 10+ */
  color: #B0AEAE;
}
::-moz-placeholder { /* Firefox 19+ */
  color: #B0AEAE;
  opacity: 1;
}
:-moz-placeholder { /* Firefox 4 - 18 */
  color: #B0AEAE;
  opacity: 1;
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
		String maxBuyers = request.getParameter("maxBuyers");
		try{
			int maxResults = Integer.parseInt(maxBuyers);
			admin.rs = admin.getBestBuyers(maxResults);
	%>
	
	<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="2">Best Buyers</th>
		</TR>

		<TR>
			<td>Buyer ID</td>
			<td>Total Spent</td>
		</TR>
		<%
			while (admin.rs.next()) {
				String buyerID = admin.rs.getString(1);
				float totalBid = admin.rs.getFloat(2);
				String formattedTotal = String.format("%.02f", totalBid);
		%>

		<TR>
			<TD><%=buyerID%></TD>
			<TD>$<%=formattedTotal%></TD>
		</TR>

		<% 	}
		} catch(Exception e){
		%>
			<TR>
				<TD>NO ITEMS HAVE BEEN BOUGHT YET</TD>
				<TD>0</TD>
			</TR>
		<%}%>
	</TABLE>


	<br>
	<br>
	
	<a href="generateSalesReports.jsp" class=box1>Return to Sales Reports page</a><br>
	<a href="admin.jsp" class=box1>Return to Admin page</a>
</body>
</html>