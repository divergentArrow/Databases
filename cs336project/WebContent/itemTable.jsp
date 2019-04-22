<%--
	@author Fareen Pourmoussavian
 --%>
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
font-size:22px;
padding: 5px;
}
.dropbtn {
  background-color: #3498DB;
  color: black;
  padding: 12px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}
.dropbtn:hover, .dropbtn:focus {
  background-color: #2980B9;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 10px 14px;
  text-decoration: none;
  display: block;
}
.dropdown a:hover {background-color: #ddd;}
.show {display: block;}
</style>
<head>
<meta charset="ISO-8859-1" content="width=device-width, initial-scale=1.0">
<title>Getting Items!</title>
</head>
<body>
<div align=center><h1 align=center class=box2>Vehicles!</h1></div>
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
Statement statement1 = conn.createStatement();
Statement statement2 = conn.createStatement();
// sql query to retrieve values from the secified table.
String QueryCar = "Select Distinct a.Auction_ID,a.start_time,a.end_time,a.sellerID,c.VIN,c.Make,c.Model,c.Color,c.Cylinders, a.buyerID,a.curr_bid from Auction a JOIN Cars c ON c.VIN=a.vin group by (Auction_ID);";
String QueryTruck = "Select Distinct a.Auction_ID,a.start_time,a.end_time,a.sellerID,t.VIN,t.Make,t.Model,t.Color,t.axles, a.buyerID,a.curr_bid from Auction a JOIN Truck t ON t.VIN=a.vin group by (Auction_ID);";
String QuerySuv = "Select Distinct a.Auction_ID,a.start_time,a.end_time,a.sellerID,s.VIN,s.Make,s.Model,s.Color,s.Seats, a.buyerID,a.curr_bid from Auction a JOIN Suv s ON s.VIN=a.vin group by (Auction_ID);";
rs = statement.executeQuery(QueryCar);
rsSuv = statement1.executeQuery(QuerySuv);
rsTruck = statement2.executeQuery(QueryTruck);
%>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Click To Sort By</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="SortAuctionID.jsp">Auction ID</a>
    <a href="SortEndTime.jsp">End Time</a>
    <a href="SortMake.jsp">Make</a>
    <a href="SortModel.jsp">Model</a>
    <a href="SortPrice.jsp">Current Bid</a>
    <a href="SortColor.jsp">Color</a>
    <a href="SortVIN.jsp">VIN</a>
    <a href="SortCylinders.jsp">Cylinders</a>
    <a href="SortAxles.jsp">Axles</a>
    <a href="SortSeats.jsp">Seats</a>  
    <a href="itemTable.jsp">Vehicle Type</a>   
  </div>
</div>
<div align="center">
<TABLE border="1" style="background-color: Brown; align:center; color: Cornsilk">
<TR>
<th colspan="11">
Cars
</th>
</TR>

<TR>
<td>Auction ID</td>
<td>Start Time</td>
<td>End Time</td>
<td>Seller ID</td>
<td>VIN</td>
<td>Make</td>
<td>Model</td>
<td>Color</td>
<td>Cylinders</td>
<td>Buyer ID</td>
<td>Current Bid</td>
</TR>
<%
while (rs.next()) {
%>

<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getDate(2)%> <%=rs.getTime(2)%></TD>
<TD><%=rs.getDate(3)%> <%=rs.getTime(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getInt(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getInt("Cylinders")%></TD>
<TD><%=rs.getString(10)%></TD>
<TD><%=rs.getBigDecimal("curr_bid")%></TD>
</TR>
<% } %>
</TABLE>
</div>
<br>
<div align="center">
<TABLE border="1" style="background-color: Brown; align:center; color: Cornsilk">
<TR>
<th colspan="11">
SUVs
</th>
</TR>

<TR>
<td>Auction ID</td>
<td>Start Time</td>
<td>End Time</td>
<td>Seller ID</td>
<td>VIN</td>
<td>Make</td>
<td>Model</td>
<td>Color</td>
<td>Seats</td>
<td>Buyer ID</td>
<td>Current Bid</td>
</TR>

<%
while (rsSuv.next()) {
%>

<TR>
<TD><%=rsSuv.getInt(1)%></TD>
<TD><%=rsSuv.getTime(2)%></TD>
<TD><%=rsSuv.getTime(3)%></TD>
<TD><%=rsSuv.getString(4)%></TD>
<TD><%=rsSuv.getInt(5)%></TD>
<TD><%=rsSuv.getString(6)%></TD>
<TD><%=rsSuv.getString(7)%></TD>
<TD><%=rsSuv.getString(8)%></TD>
<TD><%=rsSuv.getInt("Seats")%></TD>
<TD><%=rsSuv.getString(10)%></TD>
<TD><%=rsSuv.getBigDecimal("curr_bid")%></TD>
</TR>

<% } %>
</TABLE>
</div>
<br>
<div align="center">
<TABLE border="1" style="background-color: Brown; align:center; color: Cornsilk">
<TR>
<th colspan="11">
Trucks
</th>
</TR>

<TR>
<td>Auction ID</td>
<td>Start Time</td>
<td>End Time</td>
<td>Seller ID</td>
<td>VIN</td>
<td>Make</td>
<td>Model</td>
<td>Color</td>
<td>Axles</td>
<td>Buyer ID</td>
<td>Current Bid</td>
</TR>

<%
while (rsTruck.next()) {
%>

<TR>
<TD><%=rsTruck.getInt(1)%></TD>
<TD><%=rsTruck.getTime(2)%></TD>
<TD><%=rsTruck.getTime(3)%></TD>
<TD><%=rsTruck.getString(4)%></TD>
<TD><%=rsTruck.getInt(5)%></TD>
<TD><%=rsTruck.getString(6)%></TD>
<TD><%=rsTruck.getString(7)%></TD>
<TD><%=rsTruck.getString(8)%></TD>
<TD><%=rsTruck.getInt("Axles")%></TD>
<TD><%=rsTruck.getString(10)%></TD>
<TD><%=rsTruck.getBigDecimal("curr_bid")%></TD>
</TR>

<% } %>
</TABLE>
</div>
<%
// close all the connections.
rs.close();
rsSuv.close();
rsTruck.close();
statement.close();
statement1.close();
statement2.close();
conn.close();
}catch (Exception ex) {
%>

<%
}
%>
<br>
<div align=center>
<FORM ACTION="success.jsp" method="get" >
<button type="submit"><-- Main Menu</button>
</FORM>
</div>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}
// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</body>
</html>