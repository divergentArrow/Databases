package cs336project;
/**
 * @author Kamarudeen Ayankunbi
 */
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
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
	public float tpcurr_bid;
	public float upperlim_bid;
	public int currAuctID;

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

	@SuppressWarnings("deprecation")
	public boolean standardC(int auctID)  {
		boolean succ=false;
		Date dt=null;
		Time returnd = null;
		Date datert = null;
		Date hold=null;
		try {
			java.sql.PreparedStatement timeStud=conn.prepareStatement(
					"select end_time FROM CS336.Auction WHERE Auction_ID=?");
			timeStud.setInt(1, auctID);
			ResultSet as=timeStud.executeQuery();		
			//Time returnd=null;
			while(as.next()) {
			datert=as.getDate(1);
			hold=as.getDate(1);

			returnd=as.getTime(1);
			System.out.println(returnd);
			
	
			}
		
			
			
			java.text.SimpleDateFormat sdf = 
					new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			//String endTime = sdf.format(datert);
			//long now = dt.getTime();
			//Date current=new Date();

			String crrtimeStamp =   new java.text.SimpleDateFormat("yyyy.MM.dd.HH.mm.ss", Locale.US).format(new Date(System.currentTimeMillis()));
			Date curr=new Date(System.currentTimeMillis());	
			Timestamp now = new Timestamp(curr.getTime());
			Timestamp END = new Timestamp(datert.getTime());
			/*datert.setHours(returnd.getHours());
			datert.setMinutes(returnd.getMinutes());
			datert.setSeconds(returnd.getSeconds());*/
			
			END.setHours(returnd.getHours());
			END.setMinutes(returnd.getMinutes());
			END.setSeconds(returnd.getSeconds());
			



			System.out.println(now);
			System.out.println(END);
			System.out.println("crrnt in mili"+System.currentTimeMillis());

			boolean isafter=now.after(END);

			//if the current time returned isn't after the time now
			//for now this should be false but later turn to true 
			//this is because sql times are all in1965 and this is 2019
			if(isafter==false) {
				succ=true;


			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return succ;

	}

	public float getfinalbid(int auctID) throws SQLException {
		float value=0;
		float returnd=0;
		java.sql.PreparedStatement bidStud;
		try {
			bidStud = conn.prepareStatement(
					"select minPrice, curr_bid FROM CS336.Auction WHERE Auction_ID=?");

			bidStud.setInt(1, auctID);
			rs=bidStud.executeQuery();		
			while(rs.next()) {
				returnd  = rs.getFloat(1);
				tpcurr_bid=rs.getFloat(2);
			}
			value=returnd;

			//rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		String returnds=Float.toString(returnd);
		System.out.println("this is returned finalbid"+returnds);




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
	public boolean getBuyExist(String buyr) {
		boolean ex=false;
		String comp=" ";
		java.sql.PreparedStatement bidStud;
		try {
			bidStud = conn.prepareStatement(
					"select a.BUsername_Email FROM CS336.Buyer a WHERE BUsername_Email=?");
			bidStud.setString(1, buyr);
			rs=bidStud.executeQuery();
			rs.getString(1);
			while(rs.next()) {
				comp  = rs.getString(1);

			}
			if(comp==(String) session.getAttribute("user")) {
			ex=true;
			}
		} catch (SQLException e) {
			ex=true;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	return ex;
		
	}

	public String getBuyerFid(Long long1) throws SQLException{
		java.sql.PreparedStatement bidStud=conn.prepareStatement(
				"select a.buyerID FROM CS336.Bid_History a WHERE bidID=?");
		bidStud.setFloat(1, long1);
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


	public boolean setBHstory(int auctID,float curr_bid,String sellerID) {
		boolean isAdded=false;	
		int min=0;
		try {
			
			java.sql.PreparedStatement bidStud=conn.prepareStatement(
					"SELECT bidID FROM Bid_History ORDER BY bidID DESC LIMIT 1");
			rs=bidStud.executeQuery();
			while(rs.next()) {
				min=rs.getInt(1);
			}
			boolean check=getBuyExist((String) session.getAttribute("user"));
			//insert into buyer
			if(check==false) {
				java.sql.PreparedStatement buyStud=conn.prepareStatement("insert into Buyer(Pass,BUsername_Email)"
						+ " values (?, ?)"); 
				buyStud.setString(1,(String) session.getAttribute("pass"));
				buyStud.setString(2,(String) session.getAttribute("user"));
				buyStud.executeUpdate(); 
			}
			//change bid history
			java.sql.PreparedStatement updateStud=conn.prepareStatement(
					"insert into Bid_History(bidID,Auction_ID,sellerID,buyerID,current_bid)"
							+ " values (?, ?, ?, ?,?)");
			updateStud.setInt(1,min+1);

			updateStud.setInt(2,auctID);
			updateStud.setString(3,sellerID);
			updateStud.setString(4, (String) session.getAttribute("user"));
			updateStud.setFloat(5 ,curr_bid);
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
	public boolean checkVbids(int auctID,float curr_bid) throws SQLException  {
		boolean isnt=false;
		boolean validtime;
		validtime = standardC(auctID);
		System.out.println("returned caniis"+validtime);
		float minBid=getfinalbid(auctID);
		boolean pastmin=false;
		if(curr_bid>minBid) {
			pastmin=true;
		}


		return isnt;
	}
	//public 
	public long getminInc(int auctID) throws SQLException {
		long min=0;
		java.sql.PreparedStatement bidStud=conn.prepareStatement(
				"select min_incr FROM CS336.Auction WHERE Auction_ID=?");
		bidStud.setInt(1, auctID);
		rs=bidStud.executeQuery();
		int j=1;
		while(rs.next()) {
			min=rs.getLong(j);
		}

		return min;

	}

	public boolean setAuctInc(int auctID,float curr_bid,boolean added) throws SQLException {
		// if your bid is bad do this 
		if(curr_bid<tpcurr_bid) {
			ArrayList<Bidobj> allTop = new ArrayList<Bidobj>();
			HashMap<Integer,Float> allTopnew = new HashMap<Integer,Float>();

		


			java.sql.PreparedStatement bidStud=conn.prepareStatement(
					"SELECT a.buyerID,b.Max_bid From Bid_History a INNER Join User b ON  a.buyerID=b.Username_Email Where a.Auction_ID=?"
					/*	SELECT b.Max_bid, a.buyerID,b.Username_Email,a.Auction_ID
				From Auction a INNER Join User b ON  a.buyerID=b.Username_Email  Group By (buyerID)*/

					);
			bidStud.setInt(1, auctID);
			rs=bidStud.executeQuery();		
			//long returnd=0;
			ResultSetMetaData resultSetMetaData = rs.getMetaData();

			final int columnCount = ( resultSetMetaData.getColumnCount());
			System.out.println("this is column count"+columnCount);
			Bidobj bidhold = null;
			while(rs.next()) {
				for(int j=1;j<columnCount;j++) {
					System.out.println("this is resultsetbid_curr: " +rs.getFloat(j+1));
					System.out.println("rs first val: "+j);
					System.out.println("rs second val: "+j+1);
					bidhold=new Bidobj(rs.getString(j),rs.getFloat(j+1));
					allTop.add(bidhold);

				}

			}
			System.out.println(allTop);
			System.out.println(allTopnew);
			System.out.println(tpcurr_bid);
			System.out.println(getminInc(auctID));

			float min_p=tpcurr_bid+getminInc(auctID);
			System.out.print( min_p);
			int ind=0;
			String altBuyer=" ";
			Bidobj allobj=allTop.get(ind);
			float currtop=allobj.getBidamount();
			while(allTop.size()>0) {
				if(ind==allTop.size()) {
					ind=0;
				}
				if(allTop.get(ind).getBidamount()>=min_p) {
					//System.out.println(allTop.get(ind).getBidId());
					//altBuyer=
					//getBuyerFid(allTop.get(ind).getBidId());

					//System.out.println(altBuyer);
					setAuctionB(auctID,min_p,altBuyer);
					//id bid and upper
				}
				else {
					allTop.remove(ind);
					ind=ind--;
				}
				if(allTop.size()==1) {
					break;
				}
				min_p+=getminInc(auctID);
				++ind;
			}



		}	
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

	public boolean setAuctionB(int auctID,float curr_bid,String buyID) throws SQLException {
		boolean added=false;
		String quer="UPDATE Auction SET buyerID='"+ buyID+"'"+
				",curr_bid="+curr_bid+" "+"WHERE Auction_ID="+auctID+";" ;
		System.out.println(quer);
		java.sql.PreparedStatement updateStud=conn.prepareStatement(quer);
		updateStud.executeUpdate();
		added=true;

		return added;
	}

	public boolean setAuction(int auctID,float curr_bid,float upperlim_bid){
		this.upperlim_bid=upperlim_bid;
		boolean isAdded=false;

		//LinkedList

		try {

			//only add if valid bid


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

			String quer="UPDATE User SET Max_Bid='"+upperlim_bid+"'"+"WHERE Username_Email= '"
					+ (String) session.getAttribute("user")+"'"+";" ;
			System.out.println(quer);
			selectStud=conn.prepareStatement(quer);
			selectStud.executeUpdate();




			boolean validtime=standardC(auctID);
			System.out.println("returned caniis"+validtime);
			float minBid=getfinalbid(auctID);

			System.out.println("this is currenf"+getfinalbid(auctID));
			//need to  check minimum increment for now but get final bid and compare 
			if(validtime && curr_bid>=minBid) {			
				java.sql.PreparedStatement updateStud = null;
				if(tpcurr_bid<curr_bid) {

					//String currSeller=getSeller(auctID);
					//System.out.println("Seller"+(String)currSeller);
					String querd="UPDATE Auction SET buyerID='"+ (String) session.getAttribute("user")+"'"+
							",curr_bid="+curr_bid+" "+"WHERE Auction_ID="+auctID+";" ;
					System.out.println(querd);
					updateStud=conn.prepareStatement(querd);
					updateStud.executeUpdate();

				}
				//neeed to remove this
				setBHstory(auctID, curr_bid, sellerID);
				boolean val=setAuctInc(auctID,curr_bid,isAdded);
				
				isAdded=true;


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


}