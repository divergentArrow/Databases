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
  color: white;
  padding: 16px;
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
  padding: 12px 16px;
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
String sellID= request.getParameter("sellID");
sellID=sellID.trim();
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
Statement statement = conn.createStatement();
// sql query to retrieve values from the secified table.
String query = "SELECT a.sellerID,a.vin,v.color,v.make,v.model,a.start_time,a.end_time,a.buyerID,a.curr_bid  From Auction a join Vehicle v on a.vin=v.VIN where a.sellerID='";
query= query + sellID +"';";
rs = statement.executeQuery(query);

%>
<div align="center">
<TABLE border="1" style="background-color: Brown; align:center; color: Cornsilk">
<TR>
<th colspan="10">
Vehicles
</th>
</TR>

<TR>
<td>Seller ID</td>
<td>VIN</td>
<td>Color</td>
<td>Make</td>
<td>Model</td>
<td>Start Time</td>
<td>End Time</td>
<td>Buyer ID</td>
<td>Current Bid</td>
</TR>
<%
while (rs.next()) {
%>

<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getInt(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getDate(6)%> <%=rs.getTime(6)%></TD>
<TD><%=rs.getDate(7)%> <%=rs.getTime(7)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getBigDecimal(9)%></TD>
</TR>

<% } %>

<%
// close all the connections.
rs.close();
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
<br>
<br>
<div align=center>
<FORM ACTION="itemTable.jsp" method="get" >
<button type="submit"><-- Back to Auction</button>
</FORM>
<FORM ACTION="success.jsp" method="get" >
<button type="submit"><-- Main Menu</button>
</FORM>
</div>
</body>
</html>