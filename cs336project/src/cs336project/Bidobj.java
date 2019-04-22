package cs336project;

public class Bidobj {
	long bidId;
	long bidamount;
	public long getBidId() {
		return bidId;
	}

	public void setBidId(long bidId) {
		this.bidId = bidId;
	}

	public long getBidamount() {
		return bidamount;
	}

	public void setBidamount(long bidamount) {
		this.bidamount = bidamount;
	}

	public Bidobj() {

	}
	
	public Bidobj(long bidId,long bidAmount) {
		this.bidId=bidId;
		this.bidamount=bidAmount;
	}
}
