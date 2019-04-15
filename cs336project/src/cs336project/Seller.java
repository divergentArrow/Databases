package cs336project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


public class Seller {
	public static String test() {
		return "foo";
	}
	
	public static List<String[]> listSellerItems(HttpSession session) {
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
		try {
			Statement st = conn.createStatement();
			ResultSet rs;
			String sesh = session.getAttribute("user").toString();
			if(sesh != null) {
				rs = st.executeQuery("SELECT * FROM Auction a WHERE a.sellerID LIKE '" + sesh + "'");
			} else {
				rs = st.executeQuery("SELECT * FROM Auction a");
			}
			String s = "";
			int auctionRowSize = rs.getMetaData().getColumnCount();//7;
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
	
	public static String makeListReadable(List<String[]> list) {
		String s = "";
		for(String[] row:list) {
			for(String item:row) {
				s = s + item + "\t";
			}
			s = s + "\n";
		}
		return s;
	}
	
}
