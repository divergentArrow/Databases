package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

public class CustomerRepresentative {
	public ResultSet rs;
	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public String sesh;
	public int maxCrid = -1;
	
	public CustomerRepresentative(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		this.session = session;
		sesh = session.getAttribute("user").toString();
		rs = st.executeQuery("SELECT * FROM Customer_Representative");
		
		//Find next available ID for the CR
		String query = "SELECT MAX(crid) FROM Customer_Representative";
		ResultSet selectMaxCrid = st.executeQuery(query);
		boolean hasExistingCR = selectMaxCrid.first();
		if(hasExistingCR) {
			maxCrid = selectMaxCrid.getInt(1) + 1;
		} else {
			maxCrid = 0;
		}
	}
	
	public boolean addCustomerRep(String user, String pass) {
		boolean isAdded = false;
		try {
			//First try to add user and pass to User table
			String query = "INSERT INTO User VALUES ('" + user + "', '" + pass + "', 0.00)";
			int addUserQuery = st.executeUpdate(query);
			if(addUserQuery == 0) {
				System.out.println("Insert into User returned nothing");
				return isAdded;
			} else {
				//Then try to add user and pass to Customer_Representative table
				System.out.println("Successfully added user to User table");
				query = "INSERT INTO Customer_Representative VALUES (" + maxCrid + ", '" + user + "', '" + pass + "')";
				int addCRQuery = st.executeUpdate(query);
				if(addCRQuery == 0) {
					System.out.println("Insert into Customer_Representative returned nothing");
					return isAdded;
				} else {
					System.out.println("Successfully added user to Customer_Representative table");
					isAdded = true;
					return isAdded;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isAdded;
	}
	
	public boolean editUser(String user, String pass, float maxBid) throws Exception{
		String query = "UPDATE User SET Pass = '" + pass + "', Max_bid =" + maxBid + " WHERE Username_Email ='" + user + "'";
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editBHAuctionID(String bidID, String auctionID) throws Exception{
		String query = "UPDATE Bid_History SET Auction_ID=" + auctionID + " WHERE bidID=" + bidID;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editBHSellerID(String bidID, String sellerID) throws Exception{
		String query = "UPDATE Bid_History SET sellerID='" + sellerID + "' WHERE bidID=" + bidID;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editBHBuyerID(String bidID, String buyerID) throws Exception{
		String query = "UPDATE Bid_History SET buyerID='" + buyerID + "' WHERE bidID=" + bidID;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editBHCurrentBid(String bidID, float currentBid) throws Exception{
		String query = "UPDATE Bid_History SET current_bid=" + currentBid + " WHERE bidID=" + bidID;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionWinner(String auctionId, String winner) throws Exception{
		String query = "UPDATE Auction SET winner='" + winner + "' WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionStartTime(String auctionId, String startTime) throws Exception{
		String query = "UPDATE Auction SET start_time='" + startTime + "' WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionSeller(String auctionId, String sellerId) throws Exception{
		String query = "UPDATE Auction SET sellerID='" + sellerId + "' WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionBuyer(String auctionId, String buyerId) throws Exception{
		String query = "UPDATE Auction SET buyerID='" + buyerId + "' WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionVIN(String auctionId, String vin) throws Exception{
		String query = "UPDATE Auction SET vin=" + vin + " WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionEndTime(String auctionId, String endTime) throws Exception{
		String query = "UPDATE Auction SET end_time='" + endTime + "' WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionMinPrice(String auctionId, String minPrice) throws Exception{
		String query = "UPDATE Auction SET minPrice=" + minPrice + " WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionFinalBid(String auctionId, String finalBid) throws Exception{
		String query = "UPDATE Auction SET finalBid=" + finalBid + " WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionCurrBid(String auctionId, String currBid) throws Exception{
		String query = "UPDATE Auction SET curr_bid=" + currBid + " WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean editAuctionMinIncr(String auctionId, String minIncr) throws Exception{
		String query = "UPDATE Auction SET min_incr=" + minIncr + " WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			return true;
		}
	}
	
	public boolean removeAuction(String auctionId) throws Exception{
		String query = "DELETE FROM Auction WHERE Auction_ID=" + auctionId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			User user = new User(session);
			user.updateAuctions();
			return true;
		}
	}
	
	public boolean removeBid(String bidId) throws Exception{
		String query = "DELETE FROM Bid_History WHERE bidID=" + bidId;
		int updated = st.executeUpdate(query);
		if(updated == 0) {
			System.out.println("Error with UPDATE query");
			return false;
		} else {
			User user = new User(session);
			user.updateAuctions();
			return true;
		}
	}
}
