package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

public class User {

	private String username;


	private boolean isCrep;
	private boolean isAdmin;
	
	public ResultSet rs;
	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public String sesh;
	
	public User(String username,
			 boolean isRep, boolean isAdm) {
		this.username = username;
	
		
		isCrep = isRep;
		isAdmin = isAdm;
		updateAuctions();
	}
	
	public User(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		this.session = session;
		sesh = session.getAttribute("user").toString();
		updateAuctions();
		rs = st.executeQuery("SELECT * FROM Auction a WHERE a.sellerID LIKE '" + sesh + "'");
		if(this.username!=null && this.username.equalsIgnoreCase("admin")) {
			this.setAdminS(true);
		}
	}
	
	//getter and setter methods for class Member
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public boolean getCrepS() {
		return isCrep;
	}

	public void setCrepS(boolean iscRep) {
		this.isCrep = iscRep;
	}

	public boolean getAdmS() {
		return isAdmin;
	}

	public void setAdminS(boolean is_admin) {
		this.isAdmin = is_admin;
	}
	
	public float getSumOfSales() throws Exception{
		rs = st.executeQuery("SELECT SUM(Price) FROM Vehicle WHERE Vehicle.Date_sold NOT LIKE '0001-01-01 00:00:00'");
		boolean hasRows = rs.first();
		float priceSum;
		if(hasRows) {
			priceSum = rs.getFloat(1);
		} else {
			priceSum = (float) 0;
		}
		return priceSum;
	}
	
	/*
	 * Assumes "earnings per item" defines a single item as any vehicle with a unique VIN,
	 * meaning every vehicle on sale or sold is a unique item. Only accounts for items
	 * that were actually sold
	 */
	public ResultSet getEarningsPerItem() throws Exception{
		return st.executeQuery("SELECT VIN, Price FROM Vehicle WHERE Vehicle.Date_sold NOT LIKE '0001-01-01 00:00:00'");
	}
	
	public float getEarningsForCars() throws Exception{
		rs = st.executeQuery("SELECT SUM(Price) FROM Cars WHERE Cars.Date_sold NOT LIKE '0001-01-01 00:00:00'");
		if(rs.first()) {
			return rs.getFloat(1);
		} else {
			return 0;
		}
	}
	
	public float getEarningsForTrucks() throws Exception{
		rs = st.executeQuery("SELECT SUM(Price) FROM Truck WHERE Truck.Date_sold NOT LIKE '0001-01-01 00:00:00'");
		if(rs.first()) {
			return rs.getFloat(1);
		} else {
			return 0;
		}
	}
	
	public float getEarningsForSuvs() throws Exception{
		rs = st.executeQuery("SELECT SUM(Price) FROM Suv WHERE Suv.Date_sold NOT LIKE '0001-01-01 00:00:00'");
		if(rs.first()) {
			return rs.getFloat(1);
		} else {
			return 0;
		}
	}
	
	public ResultSet getEarningsPerSeller() throws Exception{
		rs = st.executeQuery("SELECT sellerID, SUM(finalBid)\r\n" + 
				"FROM Auction\r\n" + 
				"WHERE winner NOT LIKE \"TBD\"\r\n" + 
				"GROUP BY sellerID");
		return rs;
	}
	
	public ResultSet getEarningsPerNonSeller() throws Exception{
		rs = st.executeQuery("SELECT Username_Email\r\n" + 
				"FROM User\r\n" + 
				"WHERE User.Username_Email NOT IN(\r\n" + 
				"	SELECT sellerID\r\n" + 
				"	FROM (Seller JOIN Auction ON Seller.SUsername_Email LIKE Auction.sellerID)\r\n" + 
				"	WHERE winner NOT LIKE \"TBD\"\r\n" + 
				"	GROUP BY sellerID)");
		return rs;
	}
	
	public ResultSet getBestSellingItems(int n) throws Exception{
		String query = "SELECT Auction.vin, Make, Model, Color, finalBid " + 
				"FROM Auction JOIN Vehicle ON Auction.vin=Vehicle.VIN " + 
				"ORDER BY finalBid DESC " + 
				"LIMIT " + n;
		rs = st.executeQuery(query);
		return rs;
	}
	
	public ResultSet getBestBuyers(int n) throws Exception{
		String query = "SELECT winner, SUM(finalBid) AS totalBid\r\n" + 
				"FROM Auction\r\n" + 
				"WHERE winner NOT LIKE \"none\"\r\n" + 
				"GROUP BY winner\r\n" + 
				"ORDER BY totalBid DESC\r\n" + 
				"LIMIT " + n;
		rs = st.executeQuery(query);
		return rs;
	}
	
	public boolean updateAuctions(){
		boolean isUpdated = false;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = new Date();
		long time = dateTime.getTime();
		Timestamp ts = new Timestamp(time);
		String now = dateFormat.format(dateTime);
		
		try {
			String query = "SELECT * FROM Auction WHERE '" + now + "' >= Auction.end_time";
			rs = st.executeQuery(query);
			while(rs.next()) {
				String winner = rs.getString(1);
				//Timestamp startTime = rs.getTimestamp(2);
				int auctionId = rs.getInt(3);
				//String seller = rs.getString(4);
				String buyer = rs.getString(5);
				//int vin = rs.getInt(6);
				Timestamp endTime = rs.getTimestamp(7);
				float minPrice = rs.getFloat(8);
				float finalBid = rs.getFloat(9);
				int updatedRow = 0;
				int updatedBuyer = 0;
				
				ResultSet rsTemp = st.executeQuery("SELECT Auction_ID, sellerID, buyerID, MAX(current_bid) FROM Bid_History WHERE Auction_Id=" + auctionId);
				rsTemp.first();
				String currentTopBuyer = rsTemp.getString(3);
				float maxBid = rsTemp.getFloat(4);
				
				if(endTime.compareTo(ts) <= 0) {
					if(winner.equalsIgnoreCase("TBD")) {
						winner = buyer;
						finalBid = maxBid;
						if(finalBid >= minPrice) {
							updatedRow = st.executeUpdate("UPDATE Auction SET winner=buyerID, end_time='" + endTime + "', finalBid=" + finalBid + " WHERE Auction_ID=" + auctionId);
							if(updatedRow == 0) {
								System.out.println("Failed to update Auction with Auction_ID " + auctionId);
							}
						} else {
							updatedRow = st.executeUpdate("UPDATE Auction SET winner='none', end_time='" + endTime + "', finalBid=" + 0 + " WHERE Auction_ID=" + auctionId);
						}
					}
				}
				
				if(!buyer.equalsIgnoreCase(currentTopBuyer)) {
					updatedBuyer = st.executeUpdate("UPDATE Auction SET buyerID='" + currentTopBuyer + "' WHERE Auction_ID=" + auctionId);
					if(updatedBuyer == 0) {
						System.out.println("Failed to update Auction with Auction_ID " + auctionId);
					}
				}
			}
		} catch(Exception e) {
			//e.printStackTrace();
			System.out.println("Either reached end of ResultSet or exception was caught while trying to update auctions");
			return false;
		}
		
		return isUpdated;
	}
	
	public boolean isCR(String password) {
		boolean cr = false;
		if(this.isCrep) {
			return true;
		} else {
			String user = this.username;
			if(user.charAt(0) == 'c' && user.charAt(1) == 'r'){
				try{
					Integer.parseInt(user.substring(2));
					if(password.equalsIgnoreCase(user)) {
						return true;
					} else {
						return false;
					}
				} catch(NumberFormatException e){
					return false;
				}
			}
		}
		return cr;
	}
	
}
	