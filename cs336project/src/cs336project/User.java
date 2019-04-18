package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

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
		rs = st.executeQuery("SELECT SUM(Price) FROM Vehicle");
		boolean hasRows = rs.first();
		float priceSum;
		if(hasRows) {
			priceSum = rs.getFloat(0);
		} else {
			priceSum = (float) 0;
		}
		return priceSum;
	}
	
	}
	