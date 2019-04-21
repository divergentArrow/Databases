package cs336project;

import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;



public class Buyer {

	public ResultSet rs;

	public HttpSession session;
	public ApplicationDB db;
	public Connection conn;
	public Statement st;
	public String sesh;
	public long currentBid;

	public Buyer(HttpSession session) throws Exception{
		db = new ApplicationDB();
		conn = db.getConnection();
		st = conn.createStatement();
		this.session = session;
		sesh = session.getAttribute("user").toString();
		System.out.println("this is user from buyer");
		rs = st.executeQuery("SELECT * FROM Auction a WHERE a.buyerID LIKE '" + sesh + "'");
	}
	//checks the timestamp of the Auction against current time
	
	public boolean standardC(int auctID)  {
		boolean succ=false;
		try {
			java.sql.PreparedStatement timeStud=conn.prepareStatement(
					"select end_time FROM CS336.Auction WHERE Auction_ID=?");
			timeStud.setInt(1, auctID);
			ResultSet as=timeStud.executeQuery();		
			long returnd=0;
			while(as.next()) {
				returnd  = as.getLong(1);
			}
			Date dt=new Date(returnd);

			java.text.SimpleDateFormat sdf = 
					new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String endTime = sdf.format(dt);
			long now = dt.getTime();
			//Date current=new Date();

			String crrtimeStamp =   new java.text.SimpleDateFormat("yyyy.MM.dd.HH.mm.ss", Locale.US).format(new Date(System.currentTimeMillis()));
			Date curr=new Date(System.currentTimeMillis());	
			System.out.println(endTime);
			System.out.println(crrtimeStamp);
			System.out.println("crrnt in mili"+System.currentTimeMillis());

			boolean isafter=curr.after(dt);

			//if the current time returned isn't after the time now
			//for now this should be false but later turn to true 
			//this is because sql times are all in1965 and this is 2019
			if(isafter=true) {
				succ=true;


			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return succ;

	}

	public long getfinalbid(int auctID) {
		long value=0;
		java.sql.PreparedStatement bidStud;
		try {
			bidStud = conn.prepareStatement(
					"select minPrice FROM CS336.Auction WHERE Auction_ID=?");
			
			bidStud.setInt(1, auctID);
			rs=bidStud.executeQuery();		
			long returnd=0;
			while(rs.next()) {
				returnd  = rs.getLong(1);
			}
			value=returnd;
			//rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;/*
		System.out.println("this is returned finalbid"+returnd);
		
		bidStud=conn.prepareStatement(
				"select minPrice FROM CS336.Auction WHERE current_bid=?");
		bidStud.setInt(1, auctID);
		ResultSet bs=bidStud.executeQuery();
		while(bs.next()) {
			currentBid=bs.getLong(1); 
			
		}
		System.out.println(currentBid);*/
	
		
		
		return value;	
	}

	public String getSeller(int auctID) throws SQLException{
		java.sql.PreparedStatement bidStud=conn.prepareStatement(
				"select sellerID FROM CS336.Auction WHERE Auction_ID=?");
		bidStud.setInt(1, auctID);
		rs=bidStud.executeQuery();		
		String returnd=" ";
		while(rs.next()) {
			returnd  = rs.getString(1);

		}
		String value=returnd;
		System.out.println("this is returned seller"+returnd);	
		//rs.close();
		return value;	
	}


	public boolean setBHstory(int auctID,int curr_bid,String sellerID) {
		boolean isAdded=false;	   
		try {
			java.sql.PreparedStatement updateStud=conn.prepareStatement(
					"insert into Bid_History(bidID,Auction_ID,sellerID,buyerID,current_bid)"
							+ " values (?, ?, ?, ?,?)");
			updateStud.setInt(1,9);

			updateStud.setInt(2,auctID);
			updateStud.setString(3,sellerID);
			updateStud.setString(4, (String) session.getAttribute("user"));
			updateStud.setLong(5 ,curr_bid);
			System.out.println("made bid");
			// automatic bid
			updateStud.executeUpdate(); 
			System.out.println("sucssesfully ran updateStud");
			isAdded=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 



		return isAdded;


	}
	public boolean checkVbids(int auctID,int curr_bid) throws SQLException  {
	boolean isnt=false;
	boolean validtime;
	validtime = standardC(auctID);
	System.out.println("returned caniis"+validtime);
	long minBid=getfinalbid(auctID);
	boolean pastmin=false;
	if(curr_bid>minBid) {
	pastmin=true;
		
	}
	
	
	return isnt;
	}
	
	public boolean setAuctInc(int auctID,int curr_bid,boolean added) {
		// if your bid is bad do this 
		       
		
		
		//query db for all upper limits on same auct id that isn't the current bidder
		//store the upper limits in array
		//store the user uper limit in an array
		//get thr current top bid
		// while there are upper limits in list
		//if the the upperlimits
		    //if the current ind == theupper lim
		    //minmum price =crr bid in auction + increment
		    // ind=0
		// check if the upperlim index > minmium price
		// if it is create a new 
		     // minmum rize with incremetn

		
		
		
		return false;
		
	}
	
	
	
	public boolean setAuction(int auctID,int curr_bid){

		boolean isAdded=false;
		
		//LinkedList

		try {

			String sellerID=" " ;
			java.sql.PreparedStatement selectStud=conn.prepareStatement(
					"select sellerID FROM CS336.Auction WHERE Auction_ID= ? ");
			selectStud.setInt(1, auctID);
			System.out.println("reached this point");
			rs=selectStud.executeQuery();		
			while(rs.next()) {
				sellerID = rs.getString(1);

			}
			System.out.println(sellerID);
			//rs.close();

			boolean validtime=standardC(auctID);
			System.out.println("returned caniis"+validtime);
			long minBid=getfinalbid(auctID);

			System.out.println("this is currenf"+getfinalbid(auctID));

			//need to  check minimum increment for now but get final bid and compare 
			if(validtime && curr_bid>minBid) {			


				//String currSeller=getSeller(auctID);
				//System.out.println("Seller"+(String)currSeller);
				String quer="UPDATE Auction SET buyerID='"+ (String) session.getAttribute("user")+"'"+
						",curr_bid="+curr_bid+" "+"WHERE Auction_ID="+auctID+";" ;
				System.out.println(quer);
				java.sql.PreparedStatement updateStud=conn.prepareStatement(quer);
				updateStud.executeUpdate();
				isAdded=true;
				
				//boolean val=setAuctInc(auctID,curr_bid,isAdded);

				updateStud.close();

			}
			st.close();



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			isAdded=false;

		}







		return isAdded;

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

	public boolean addAuction(String vin, String sdt, String cdt, String minPrice) {
		boolean isAdded = true;
		try {
			ResultSet auctionIds = st.executeQuery("SELECT Auction_ID FROM Auction");
			int maxId = -1;
			while(auctionIds.next()) {
				if(auctionIds.getInt(1) >= maxId) maxId=auctionIds.getInt(1);
			}
			int insertId = maxId + 1;
			String query = "INSERT INTO Auction VALUES('TBD', '";
			query = query.concat(sdt);
			query = query + "', ";
			query = query + insertId;
			query = query + ", '";
			query = query + session.getAttribute("user");
			query = query + "', 'monkey', ";
			query = query + vin;
			query = query + ", '";
			query = query + cdt;
			query = query + "', ";
			query = query + minPrice + ");";
			int update = st.executeUpdate(query);
			if(update == 0) isAdded = false;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error in input");
			isAdded=false;
		}
		return isAdded;
	}

	public boolean addAuction(String vin, String sdt, String cdt) {
		boolean isAdded = true;
		try {
			ResultSet auctionIds = st.executeQuery("SELECT Auction_ID FROM Auction");
			int maxId = -1;
			while(auctionIds.next()) {
				if(auctionIds.getInt(1) >= maxId) maxId=auctionIds.getInt(1);
			}
			int insertId = maxId + 1;
			String query = "INSERT INTO Auction VALUES('TBD', '" + sdt + "', " + insertId + ", '" + session.getAttribute("user") + "', 'N/A', " + vin + ", '" + cdt + ";";
			int update = st.executeUpdate(query);
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
