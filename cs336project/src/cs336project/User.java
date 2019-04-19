package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	}

	public User(){
	}
	
	public User(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		this.session = session;
		sesh = session.getAttribute("user").toString();
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
				"FROM (Seller JOIN Auction ON Seller.SUsername_Email LIKE Auction.sellerID)\r\n" + 
				"WHERE winner NOT LIKE \"TBD\"\r\n" + 
				"GROUP BY winner");
		return rs;
	}
	
	public ResultSet getEarningsPerNonSeller() throws Exception{
		rs = st.executeQuery("SELECT Username_Email\r\n" + 
				"FROM User\r\n" + 
				"WHERE User.Username_Email NOT IN(\r\n" + 
				"	SELECT sellerID\r\n" + 
				"	FROM (Seller JOIN Auction ON Seller.SUsername_Email LIKE Auction.sellerID)\r\n" + 
				"	WHERE winner NOT LIKE \"TBD\"\r\n" + 
				"	GROUP BY winner)");
		return rs;
	}
	
}
	