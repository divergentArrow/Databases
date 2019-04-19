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
			String query = "INSERT INTO User VALUES ('" + user + "', '" + pass + "')";
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
}
