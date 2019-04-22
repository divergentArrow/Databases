<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>

<html>
<style>
.reveal-if-active {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  transform: scale(0.8);
  transition: 0.5s;
  input[type="radio"]:checked ~ &{
    opacity: 1;
    max-height: 100px;
    overflow: visible;
    padding: 10px 20px;
    transform: scale(1);
  }
}
  input[type=text] {
    width: 100%;
  }
  
  input[type="radio"]:checked ~ .reveal-if-active {
    opacity: 1;
    max-height: 100px;
    padding: 10px 20px;
    transform: scale(1);
    overflow: visible;
  }
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
div span{
	border: 2px solid black;
	background-color: Brown;
	color: white;
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

}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Sell</title>
</head>

<body>
	<div id=page>
		<span>Modify item characteristics or add an auction</span>
		<br></br>
		<form action="sellerModify.jsp" method="post">
		VIN: <input type="text" id="vin" name="vin" placeholder="123456789"><br>
		Set start date and time: <input type="text" id="sdt" name="sdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set closing date and time: <input type="text" id="cdt" name="cdt" placeholder="YYYY-MM-DD HH:MM:SS"/><br>
		Set minimum price: <input type="text" id="minPrice" name="minPrice" placeholder="123.45"/><br>
		<button type="submit" name="button" value="modifyItem">Modify Item</button><br>
		</form>
		<br></br>
		<form action="sellerAddAuction.jsp" method="post">
		VIN: <input type="text" id="vin" name="vin" placeholder="123456789" required><br>
		Set start date and time: <input type="text" id="sdt" name="sdt" placeholder="YYYY-MM-DD HH:MM:SS" required/><br>
		Set closing date and time: <input type="text" id="cdt" name="cdt" placeholder="YYYY-MM-DD HH:MM:SS" required/><br>
		Set minimum price: <input type="text" id="minPrice" name="minPrice" placeholder="123.45"/><br>
		Vehicle Color: <input type="text" id="color" name="color" placeholder="Color of Vehicle" required><br>
		Make: <input type="text" id="make" name="make" placeholder="Vehicle Maker" required><br>
		Model: <input type="text" id="model" name="model" placeholder="Vehicle Model" required><br>
		What is the type of Vehicle?
	<div>
      <input type="radio" name="vehicles" id="vehicle-type-c" value="cars" required>
      <label for="vehicle-type-c">Car</label>
      <div class="reveal-if-active">
        <label for="which-vehicle">How many cylinders does it have?</label>
        <input type="text" id="which-vehicle" name="which-vehicle" class="require-if-active" data-require-pair="#vehicle-type-c">
      </div>
    </div>
    <div>
      <input type="radio" name="vehicles" id="vehicle-type-s" value="suv" required>
      <label for="vehicle-type-s">SUV</label>
    
      <div class="reveal-if-active">
        <label for="vehicle-s">How many seats are there?</label>
        <input type="text" id="vehicle-s" name="vehicle-s" class="require-if-active" data-require-pair="#vehicle-type-s">
      </div>
    </div>
      <div>
      <input type="radio" name="vehicles" id="vehicle-type-t" value="truck" required>
      <label for="vehicle-type-t">Truck</label>
    
      <div class="reveal-if-active">
        <label for="vehicle-t">How many axles does it have?</label>
        <input type="text" id="vehicle-t" name="vehicle-t" class="require-if-active" data-require-pair="vehicle-type-t">
      </div>
    </div>
		<button type="submit" name="button" value="addAuction">Add Auction</button><br>
		</form>
	</div>
	<div id=auctionTable>
		<br></br>
		<span>My Auctions</span>
		<br></br>
		
		<table border="2">
			<tr>
				<td>Auction ID</td>
				<td>VIN</td>
				<td>Winner</td>
				<td>Seller ID</td>
				<td>Buyer ID</td>
				<td>Start time</td>
				<td>End time</td>
				<td>Minimum Price</td>
				<td>Current Bid</td>
				<!-- 
				<td>Color</td>
				<td>Make</td>
				<td>Model</td>
				-->
			</tr>
		<%
			System.out.println("cool getting started");
			Seller seller = new Seller(session);
			while(seller.rs.next()){
		%>
			<tr>
				<td><%out.println(seller.rs.getInt("Auction_ID")); %></td>
				<td><%out.println(seller.rs.getInt("vin")); %></td>
				<td><%out.println(seller.rs.getString("winner")); %></td>
				<td><%out.println(seller.rs.getString("sellerID")); %></td>
				<td><%out.println(seller.rs.getString("buyerID")); %></td>
				<td><%out.println(seller.rs.getDate("start_time")); out.println(seller.rs.getTime("start_time"));%></td>
				<td><%out.println(seller.rs.getDate("end_time")); out.println(seller.rs.getTime("end_time"));%></td>
				<td><%out.println(seller.rs.getFloat("minPrice")); %></td>
				<td><%out.println(seller.rs.getFloat("curr_bid")); %></td>
				
				<!--  
				<td><%//out.println(seller.rs.getString("Color")); %></td>
				<td><%//out.println(seller.rs.getString("Make")); %></td>
				<td><%//out.println(seller.rs.getString("Model")); %></td>
				-->
			</tr>
		<%
			}
		%>
		</table>
		<br>
		
		<a href='success.jsp' class=box1>Home</a><br>
		<a href='logout.jsp' class=box1>Log out</a>
	</div>
	<script>
	var FormStuff = {
			  
			  init: function() {
			    this.applyConditionalRequired();
			    this.bindUIActions();
			  },
			  
			  bindUIActions: function() {
			    $("input[type='radio']").on("change", this.applyConditionalRequired);
			  },
			  
			  applyConditionalRequired: function() {
			    
			    $(".require-if-active").each(function() {
			      var el = $(this);
			      if ($(el.data("require-pair")).is(":checked")) {
			        el.prop("required", true);
			      } else {
			        el.prop("required", false);
			      }
			    });
			  }
	};
	FormStuff.init();
	</script>
</body>

</html>
