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
<title>Customer Representative</title>
</head>
<body>
<span>Customer Actions</span> <br>
<%
	CustomerRepresentative cr = new CustomerRepresentative(session);
%>
<span>Placeholder text for access to forum page</span>

<br><br>

<span>Edit a User Account</span><br>
<form action="editAccounts.jsp" method="post">
Username of account to edit: <input type="text" id="username" name="username" placeholder="bko9@rutgers.edu"><br>
New Password: <input type="text" id="password" name="password" placeholder="password"><br>
New Maximum Bid: <input type="text" id="maxBid" name="maxBid" placeholder="100000.00"><br>
<button type="submit" name="button" value="editUser">Edit User</button><br>
</form>

<br><br>
<span>Edit a Bid</span><br>
<form action="editBids.jsp" method="post">
Bid ID: <input type="text" id="bidID" name="bidID" placeholder="1"><br>
New Auction ID: <input type="text" id="auctionID" name="auctionID" placeholder="1949"><br>
New Seller: <input type="text" id="sellerID" name="sellerID" placeholder="Seller Username"><br>
New Buyer: <input type="text" id="buyerID" name="buyerID" placeholder="Buyer Username"><br>
New Current Bid: <input type="text" id="currentBid" name="currentBid" placeholder="20000.00"><br>
<button type="submit" name="button" value="editUser">Edit Bid</button><br>
</form>



<a href='success.jsp' class=box1>Home</a><br>
<a href='logout.jsp' class=box1>Log out</a>
</body>
</html>