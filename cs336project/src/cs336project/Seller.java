package cs336project;
/**
 * @author Jimmy Wen
 * @author Fareen Pourmoussavian
 */
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpSession;


public class Seller {
	public ResultSet rs;
	public ResultSet rs2;
	public ResultSet rs3;
	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public Statement st2;
	public Statement st3;
	public Statement useST;
	public Statement makerST;
	public String sesh;
	
	public Seller(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		this.session = session;
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
			if(success == 0) {
				isUpdated = false;
			}
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
			if(success == 0) {
				isUpdated = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isUpdated=false;
		}
		return isUpdated;
	}
	
	public boolean addAuctionT(String vin, String sdt, String cdt, String minPrice, String color, String make, String model, String vehicle_truck) {
		boolean isAdded = true;
		try {
			ResultSet auctionIds = st.executeQuery("SELECT Auction_ID FROM Auction");
			int maxId = -1;
			while(auctionIds.next()) {
				if(auctionIds.getInt(1) >= maxId) maxId=auctionIds.getInt(1);
			}
			int insertId = maxId + 1;
			String vTab = "INSERT INTO Vehicle VALUES(";
			vTab=vTab+vin+", '";
			vTab=vTab+make+"', "+minPrice+", '";
			vTab=vTab+model+"', '";
			vTab=vTab+color+"', '";
			vTab=vTab+sdt+"', '0001-01-01 00:00');";
			java.sql.PreparedStatement updateVeh=conn.prepareStatement(vTab);
			int update2 = updateVeh.executeUpdate();
			if(update2 == 0) isAdded = false;
			
			String carTab="INSERT INTO Truck VALUES('";
			carTab = carTab+make + "','";
			carTab = carTab+model + "',";
			carTab = carTab+minPrice + ",'";
			carTab = carTab+color + "','";
			carTab = carTab+"0001-01-01 00:00', '";
			carTab = carTab+sdt + "',";
			carTab = carTab+vin + ",";
			carTab = carTab+vehicle_truck + ");";
			java.sql.PreparedStatement updateTruck=conn.prepareStatement(carTab);
			int update3 = updateTruck.executeUpdate();
			if(update3 == 0) isAdded = false;
			
			String query = "INSERT INTO Auction (winner,start_time,Auction_ID,sellerID,buyerID,vin,end_time,minPrice) VALUES('TBD', '";
			query = query.concat(sdt);
			query = query + "', ";
			query = query + insertId;
			query = query + ", '";
			query = query + session.getAttribute("user");
			query = query + "', 'tbd', ";
			query = query + vin;
			query = query + ", '";
			query = query + cdt;
			query = query + "', ";
			query = query + minPrice + ");";
			java.sql.PreparedStatement updateAuc=conn.prepareStatement(query);
			int update = updateAuc.executeUpdate();
			if(update == 0) isAdded = false;

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isAdded=false;
		}
		return isAdded;
	}
	
	public boolean addAuctionC(String vin, String sdt, String cdt, String minPrice, String color, String make, String model, String which_vehicle) {
		boolean isAdded = true;
		try {
			ResultSet auctionIds = st.executeQuery("SELECT Auction_ID FROM Auction");
			int maxId = -1;
			while(auctionIds.next()) {
				if(auctionIds.getInt(1) >= maxId) maxId=auctionIds.getInt(1);
			}
			int insertId = maxId + 1;
			
			
			String vTab = "INSERT INTO Vehicle VALUES(";
			vTab=vTab+vin+", '";
			vTab=vTab+make+"', "+minPrice+", '";
			vTab=vTab+model+"', '";
			vTab=vTab+color+"', '";
			vTab=vTab+sdt+"', '0001-01-01 00:00:00');";
			// Creating a prepared statement before you execute.
			
			//System.out.println(vTab);
			java.sql.PreparedStatement updateStud=conn.prepareStatement(vTab);
			
			int update2 = updateStud.executeUpdate();
			if(update2 == 0) isAdded = false;
			String carTab="INSERT INTO Cars VALUES('";
			carTab = carTab+make + "','";
			carTab = carTab+model + "',";
			carTab = carTab+minPrice + ",'";
			carTab = carTab+color + "','";
			carTab = carTab+"0001-01-01 00:00', '";
			carTab = carTab+sdt + "',";
			carTab = carTab+vin + ",";
			carTab = carTab+which_vehicle + ");";
			//System.out.println(carTab);
			
			java.sql.PreparedStatement updateCar=conn.prepareStatement(carTab);
			int update3 = updateCar.executeUpdate();
			
			if(update3 == 0) isAdded = false;
			String query = "INSERT INTO Auction (winner,start_time,Auction_ID,sellerID,buyerID,vin,end_time,minPrice) VALUES('TBD', '";
			query = query.concat(sdt);
			query = query + "', ";
			query = query + insertId;
			query = query + ", '";
			query = query + session.getAttribute("user");
			query = query + "', 'tbd', ";
			query = query + vin;
			query = query + ", '";
			query = query + cdt;
			query = query + "', ";
			query = query + minPrice + ");";
			
			java.sql.PreparedStatement updateAuc=conn.prepareStatement(query);
			int update = updateAuc.executeUpdate();
			if(update == 0) isAdded = false;

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isAdded=false;
		}
		return isAdded;
	}
	public boolean addAuctionS(String vin, String sdt, String cdt, String minPrice, String color, String make, String model, String vehicle_suv) {
		boolean isAdded = true;
		try {
			
			ResultSet auctionIds = st.executeQuery("SELECT Auction_ID FROM Auction");
			int maxId = -1;
			while(auctionIds.next()) {
				if(auctionIds.getInt(1) >= maxId) maxId=auctionIds.getInt(1);
			}
			String vTab = "INSERT INTO Vehicle VALUES(";
			vTab=vTab+vin+", '";
			vTab=vTab+make+"', "+minPrice+", '";
			vTab=vTab+model+"', '";
			vTab=vTab+color+"', '";
			vTab=vTab+sdt+"', '0001-01-01 00:00');";
			java.sql.PreparedStatement updateVehi=conn.prepareStatement(vTab);
			int update2 = updateVehi.executeUpdate();
			if(update2 == 0) isAdded = false;
			
			String carTab="INSERT INTO Suv VALUES('";
			carTab = carTab+make + "','";
			carTab = carTab+model + "',";
			carTab = carTab+minPrice + ",'";
			carTab = carTab+color + "','";
			carTab = carTab+"0001-01-01 00:00', '";
			carTab = carTab+sdt + "',";
			carTab = carTab+vin + ",";
			carTab = carTab+vehicle_suv + ");";
			java.sql.PreparedStatement updateSUV=conn.prepareStatement(carTab);
			int update3 = updateSUV.executeUpdate();
			if(update3 == 0) isAdded = false;
			
			int insertId = maxId + 1;
			String query = "INSERT INTO Auction (winner,start_time,Auction_ID,sellerID,buyerID,vin,end_time,minPrice) VALUES('TBD', '";
			query = query.concat(sdt);
			query = query + "', ";
			query = query + insertId;
			query = query + ", '";
			query = query + session.getAttribute("user");
			query = query + "', 'tbd', ";
			query = query + vin;
			query = query + ", '";
			query = query + cdt;
			query = query + "', ";
			query = query + minPrice + ");";
			java.sql.PreparedStatement updateAucti=conn.prepareStatement(query);
			int update = updateAucti.executeUpdate();
			if(update == 0) isAdded = false;
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isAdded=false;
		}
		return isAdded;
	}
	public void closeConnection() throws Exception{
		conn.close();
	}
	
}
