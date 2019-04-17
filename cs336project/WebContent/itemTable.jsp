<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336project.*"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
td{
margin:5px;
padding: 9px;
}
th{
font-size:20px;
}
</style>
<head>
<meta charset="ISO-8859-1" content="width=device-width, initial-scale=1.0">
<title>Getting Items!</title>
</head>
<body>
<div align=center><h1 align=center class=box2>Cars!</h1></div>
<%
try {

ApplicationDB db = new ApplicationDB();	
Connection conn = db.getConnection();

//declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet rsSuv=null;
ResultSet rsTruck=null;

/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
Statement statement = conn.createStatement();
// sql query to retrieve values from the secified table.
String QueryCar = "SELECT * from Cars;";
String QueryTruck = "SELECT * from Truck";
String QuerySuv = "SELECT * from Suv";
rs = statement.executeQuery(QueryCar);
rsSuv = statement.executeQuery(QuerySuv);
rsTruck = statement.executeQuery(QueryTruck);

%>
<select>
  <option value="default">Click to Sort</option>
  <option value="make">Make</option>
  <option value="model">Model</option>
  <option value="price">Price</option>
  <option value="color">Color</option>
  <option value="dateSold">Date Sold</option>
  <option value="datePost">Date Posted</option>
  <option value="vin">VIN</option>
  <option value="cylinders">Cylinders</option>
  <option value="seats">Seats</option>
  <option value="axles">Axles</option>
</select>
<div align="center">
<TABLE border="1" style="background-color: Brown; align:center; color: Cornsilk">
<TR>
<th colspan="8">
Cars
</th>
</TR>

<TR>
<td>Make</td>
<td>Model</td>
<td>Price</td>
<td>Color</td>
<td>Date Sold</td>
<td>Date Posted</td>
<td>VIN</td>
<td>Cylinders</td>
</TR>
<%
while (rs.next()) {
%>

<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getInt(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getDate(5)%></TD>
<TD><%=rs.getDate(6)%></TD>
<TD><%=rs.getInt(7)%></TD>
<TD><%=rs.getInt(8)%></TD>
</TR>

<% } %>
<TR>
<TD>Suv</TD>
</TR>
<TR>
<td>Make</td>
<td>Model</td>
<td>Price</td>
<td>Color</td>
<td>Date Sold</td>
<td>Date Posted</td>
<td>VIN</td>
<td>Seats</td>
</TR>
<% 
while (rsSuv.next()) {
%>

<TR>
<TD><%=rsSuv.getString(1)%></TD>
<TD><%=rsSuv.getString(2)%></TD>
<TD><%=rsSuv.getInt(3)%></TD>
<TD><%=rsSuv.getString(4)%></TD>
<TD><%=rsSuv.getDate(5)%></TD>
<TD><%=rsSuv.getDate(6)%></TD>
<TD><%=rsSuv.getInt(7)%></TD>
<TD><%=rsSuv.getInt(8)%></TD>
</TR>

<% } %>
<TR>
<TD>Truck</TD>
</TR>
<TR>
<td>Make</td>
<td>Model</td>
<td>Price</td>
<td>Color</td>
<td>Date Sold</td>
<td>Date Posted</td>
<td>VIN</td>
<td>Axles</td>
</TR>

<% 
while (rsTruck.next()) {
%>

<TR>
<TD><%=rsTruck.getString(1)%></TD>
<TD><%=rsTruck.getString(2)%></TD>
<TD><%=rsTruck.getInt(3)%></TD>
<TD><%=rsTruck.getString(4)%></TD>
<TD><%=rsTruck.getDate(5)%></TD>
<TD><%=rsTruck.getDate(6)%></TD>
<TD><%=rsTruck.getInt(7)%></TD>
<TD><%=rsTruck.getInt(8)%></TD>
</TR>

<% } %>

<%
// close all the connections.
rs.close();
rsSuv.close();
rsTruck.close();
statement.close();
conn.close();
} catch (Exception ex) {
%>

<%
out.println("Can't connect to database.");
}
%>
</TABLE>
</div>
<TABLE>
<TR>
<TD><FORM ACTION="success.jsp" method="get" >
<button type="submit"><-- GO BACK</button></TD>
</TR>
</TABLE>
</body>
</html>