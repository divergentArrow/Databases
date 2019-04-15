package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


public class Seller {
	public ResultSet rs;
	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public String sesh;
	
	public Seller(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		sesh = session.getAttribute("user").toString();
		rs = st.executeQuery("SELECT * FROM Auction a WHERE a.sellerID LIKE '" + sesh + "'");
	}
	
	public List<String[]> listSellerItems() {
		try {
			String s = "";
			int auctionRowSize = rs.getMetaData().getColumnCount();//8;
			String[] sArr = new String[auctionRowSize];
			ArrayList<String[]> allColumns = new ArrayList<String[]>();
			while(rs.next()) {
				for(int i=1; i<=auctionRowSize; i++) {
					s = rs.getString(i);
					sArr[i-1] = s;
				}
				allColumns.add(sArr);
			}
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			return allColumns;
		} catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public String makeListReadable(List<String[]> list) {
		String s = "";
		for(String[] row:list) {
			for(String item:row) {
				s = s + item + "\t\t";
			}
			s = s + "\n";
		}
		return s;
	}
	
	public boolean updateItem(String vin, String sdt, String cdt, String minPrice) {
		boolean isUpdated = true;
		try {
			String query = "UPDATE Auction SET start_time='" + sdt + "', end_time='" + cdt + "', minPrice=" + minPrice + " WHERE vin=" + vin + ";";
			int success = st.executeUpdate(query);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isUpdated=false;
		}
		return isUpdated;
	}
	
	public boolean updateItem(String vin, String sdt, String cdt) {
		boolean isUpdated = true;
		try {
			String query = "UPDATE Auction SET start_time='" + sdt + "', end_time='" + cdt + "' WHERE vin=" + vin + ";";
			int success = st.executeUpdate(query);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isUpdated=false;
		}
		return isUpdated;
	}
	
	public void closeConnection() throws Exception{
		conn.close();
	}
	
}
