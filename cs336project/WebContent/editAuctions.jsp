<%--
	@author Jimmy Wen
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*, java.sql.Timestamp" %>
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
<title>Edit Auctions</title>
</head>
<body>
<span>Edit Auctions Results:</span> <br>
<%
	CustomerRepresentative cr = new CustomerRepresentative(session);
	String aid = request.getParameter("aAuctionID");
	String winner = request.getParameter("aWinner");
	String seller = request.getParameter("aSellerID");
	String buyer = request.getParameter("aBuyerID");
	String vin = request.getParameter("aVin");
	String sTime = request.getParameter("aStartTime");
	String eTime = request.getParameter("aEndTime");
	String minPrice = request.getParameter("aMinPrice");
	String finalBid = request.getParameter("aFinalBid");
	String currentBid = request.getParameter("aCurrentBid");
	String minIncr = request.getParameter("buyerID");
	
	int aidN;
	int vinN;
	float minPriceN;
	float finalBidN;
	float currentBidN;
	float minIncrN;
	
	if(aid.isEmpty()){
		%>
		<span>You need to provide an Auction ID!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}

	if(winner.isEmpty() && seller.isEmpty() && buyer.isEmpty() && vin.isEmpty() && sTime.isEmpty() && eTime.isEmpty() && minPrice.isEmpty() && finalBid.isEmpty() && currentBid.isEmpty() && minIncr.isEmpty()){
		%>
		<span>You need to edit at least one field of the auction!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	
	//Catch any exceptions caused by bad input
	try{
		vinN = Integer.parseInt(vin);
	} catch(Exception e){
		%>
		<span>VIN must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	try{
		aidN = Integer.parseInt(aid);
	} catch(Exception e){
		%>
		<span>Auction ID must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	try{
		minPriceN = Float.parseFloat(minPrice);
	} catch(Exception e){
		%>
		<span>Minimum Price must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	try{
		finalBidN = Float.parseFloat(finalBid);
	} catch(Exception e){
		%>
		<span>Minimum Price must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	try{
		currentBidN = Float.parseFloat(currentBid);
	} catch(Exception e){
		%>
		<span>Minimum Price must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	try{
		minIncrN = Float.parseFloat(minIncr);
	} catch(Exception e){
		%>
		<span>Minimum Price must be an integer!</span><br>
		<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>
		<%
		return;
	}
	
	
	
	
	if(!winner.isEmpty()){
		try{
			boolean success = cr.editAuctionWinner(aid, winner);
			if(success){
				%>
				<span>Success! Request to update Winner has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for Winner</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for Winner</span><br>
			<%
		}
	}
	if(!seller.isEmpty()){
		try{
			boolean success = cr.editAuctionSeller(aid, seller);
			if(success){
				%>
				<span>Success! Request to update seller has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for seller</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for seller</span><br>
			<%
		}
	}
	if(!buyer.isEmpty()){
		try{
			boolean success = cr.editAuctionBuyer(aid, buyer);
			if(success){
				%>
				<span>Success! Request to update buyer has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for buyer</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for buyer</span><br>
			<%
		}
	}
	if(!vin.isEmpty()){
		try{
			boolean success = cr.editAuctionVIN(aid, vin);
			if(success){
				%>
				<span>Success! Request to update VIN has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for VIN</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for VIN</span><br>
			<%
		}
	}
	if(!sTime.isEmpty()){
		try{
			boolean success = cr.editAuctionStartTime(aid, sTime);
			if(success){
				%>
				<span>Success! Request to update start time has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for start time</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for start time</span><br>
			<%
		}
	}
	if(!eTime.isEmpty()){
		try{
			boolean success = cr.editAuctionEndTime(aid, eTime);
			if(success){
				%>
				<span>Success! Request to update end time has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for end time</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for end time</span><br>
			<%
		}
	}
	if(!minPrice.isEmpty()){
		try{
			boolean success = cr.editAuctionMinPrice(aid, minPrice);
			if(success){
				%>
				<span>Success! Request to update minimum price has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for minimum price</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for minimum price</span><br>
			<%
		}
	}
	if(!finalBid.isEmpty()){
		try{
			boolean success = cr.editAuctionFinalBid(aid, finalBid);
			if(success){
				%>
				<span>Success! Request to update final bid has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for final bid</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for final bid</span><br>
			<%
		}
	}
	if(!currentBid.isEmpty()){
		try{
			boolean success = cr.editAuctionCurrBid(aid, currentBid);
			if(success){
				%>
				<span>Success! Request to update current bid has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for current bid</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for current bid</span><br>
			<%
		}
	}
	if(!minIncr.isEmpty()){
		try{
			boolean success = cr.editAuctionMinIncr(aid, minIncr);
			if(success){
				%>
				<span>Success! Request to update minimum increment has been sent.</span><br>
				<%
			} else{
				%>
				<span>Oops! Something went wrong with the query for minimum increment</span><br>
				<%
			}
		} catch(Exception e){
			%>
			<span>Oops! Something went wrong with the query for minimum increment</span><br>
			<%
		}
	}
	
	
%>

<a href='customerRep.jsp' class=box1>Return to Customer Representative Page</a>

</body>
</html>