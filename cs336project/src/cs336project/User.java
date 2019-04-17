package cs336project;
public class User {

	private String username;


	private boolean isCrep;
	private boolean isAdmin;
	
	public User(String username,
			 boolean isRep, boolean isAdm) {
		this.username = username;
	
		
		isCrep = isRep;
		isAdmin = isAdm;
	}

	public User(){
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

	public void setCrepS(boolean is_customer_rep) {
		this.isCrep = is_customer_rep;
	}

	public boolean getAdmS() {
		return isAdmin;
	}

	public void setAdminS(boolean is_admin) {
		this.isAdmin = is_admin;
	}
	
	}
	