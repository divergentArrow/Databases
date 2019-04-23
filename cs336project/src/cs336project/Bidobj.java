package cs336project;
/**
 * @author Kamarudeen Ayankunbi
 */
public class Bidobj {
	String  buyerName;
	float bidamount;
	public Bidobj(String string, float long1) {
		this.buyerName=string;
		this.bidamount=long1;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public float getBidamount() {
		return bidamount;
	}
	public void setBidamount(float bidamount) {
		this.bidamount = bidamount;
	}
	
	
	
}