<%--
	@author Jimmy Wen
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*, java.sql.*" %>
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
<title>View Bid History</title>
</head>
<body>

<TABLE border="1"
		style="background-color: Brown; align: center; color: Cornsilk">
		<TR>
			<th colspan="3">Bid History</th>
		</TR>

		<TR>
			<td>Bid ID</td>
			<td>Auction ID</td>
			<td>Seller ID</td>
			<td>Buyer ID</td>
			<td>Current Bid</td>
		</TR>
<%
	CustomerRepresentative tempCR = new CustomerRepresentative(session);
	try{
		ResultSet rs = tempCR.getBidHistory();
		while(rs.next()){
			%>
			<TR>
				<TD><%=rs.getInt(1)%></TD>
				<TD><%=rs.getInt(2)%></TD>
				<TD><%=rs.getString(3)%></TD>
				<TD><%=rs.getString(4)%></TD>
				<TD><%=rs.getFloat(5)%></TD>
			</TR>
			<%
		}
		%>
		</TABLE>
		<%
	} catch(Exception e){
		%>
		<span>No bids exist yet.</span>
	<%}%>
<a href='customerRep.jsp' class=box1>Return to Customer Representative page</a><br>
</body>
</html>