<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html class="bg">
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
.show {display: block;}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Add Auction</title>
</head>
<body>
	<%
			Seller seller = new Seller(session);
			String vin = request.getParameter("vin");
			vin=vin.trim();
			String sdt = request.getParameter("sdt");
			sdt=sdt.trim();
			String cdt = request.getParameter("cdt");
			cdt=cdt.trim();
			String minPrice = request.getParameter("minPrice");
			minPrice=minPrice.trim();
			String color = request.getParameter("color");
			color=color.trim();
			String make = request.getParameter("make");
			make=make.trim();
			String model = request.getParameter("model");
			model=model.trim();
			String vehicle = request.getParameter("vehicles");
			boolean success = false;
			try{

			if(vehicle.equals("truck")){
				
				String vehicle_truck = request.getParameter("vehicle-t");
				vehicle_truck=vehicle_truck.trim();
				if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()&& !color.isEmpty() && !make.isEmpty() && !model.isEmpty() &&!vehicle_truck.isEmpty()){
					if(minPrice.isEmpty()){
						throw new NullPointerException("minPrice");
					} 
					else{
						success = seller.addAuctionT(vin, sdt, cdt, minPrice,color,make,model,vehicle_truck);
					}
				}
			}
			else if(vehicle.equals("cars")){
				String which_vehicle = request.getParameter("which-vehicle");
				which_vehicle=which_vehicle.trim();
				if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()&& !color.isEmpty() && !make.isEmpty() && !model.isEmpty() &&!which_vehicle.isEmpty()){
					if(minPrice.isEmpty()){
						throw new NullPointerException("minPrice");
					} 
					else{
						success = seller.addAuctionC(vin, sdt, cdt, minPrice,color,make,model,which_vehicle);
						out.println(vin+" "+sdt+" "+cdt+" "+minPrice+" "+color+" "+make+" "+model+" "+vehicle+" "+which_vehicle);	
					}
				}
			}
			else if(vehicle.equals("suv")){
				String vehicle_suv= request.getParameter("vehicle-s");
				vehicle_suv=vehicle_suv.trim();
				if(!vin.isEmpty() && !sdt.isEmpty() && !cdt.isEmpty()&& !color.isEmpty() && !make.isEmpty() && !model.isEmpty() &&!vehicle_suv.isEmpty()){
					if(minPrice.isEmpty()){
						throw new NullPointerException("minPrice");
					} 
					else{
						success = seller.addAuctionS(vin, sdt, cdt, minPrice,color,make,model,vehicle_suv);
					}
				}
			}
			
			
			
			} catch(NullPointerException e){
				out.println("Null values for input not allowed!<br>");
			}
			
			if(success){
				out.println("New auction request sent.<br>");
				out.println("This does NOT mean the request was valid!<br>");
				out.println("Return to Seller page to see result.<br>");
			}
			else{
				out.println("Error with input! Try again.<br>");
				
			}
		%>
	<a href='seller.jsp' class=box1>Return to Seller page</a>
</body>
</html>