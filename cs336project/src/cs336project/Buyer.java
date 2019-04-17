package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;


public class Buyer {
	public ResultSet rs;
	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public String sesh;
	
	public Buyer(){
	}
	
	public String testMethod(int vin,int auctID,int curr_bid,int max_bid,String buyID){
		db = new ApplicationDB();
		conn = db.getConnection();
		try {
			st = conn.createStatement();
			/*rs = st.executeQuery(" insert into Auction_System"
		            + " values (?, ?, ?, ?)");*/
			java.sql.PreparedStatement updateStud=conn.prepareStatement( "insert into Auction_System"
		            + " values (?, ?, ?, ?, ?)"); 
			

			updateStud.setInt(1,vin);
			updateStud.setInt(2,auctID);
			updateStud.setInt(3,curr_bid);
			updateStud.setInt(4,max_bid);
			updateStud.setString(5, buyID);
			updateStud.executeUpdate(); 
			st.close();
			updateStud.close();
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			//st.setString(1, auctID);
			//ps.setString(2, newBeer);
			//ps.setFloat(3, price);
			//Run the query against the DB
			//st.executeUpdate();

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			

			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
		
		
		
	    return "Hello";
	 
	}
	
	public Buyer(HttpSession session) throws Exception{
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
			conn.close();
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
	
}
