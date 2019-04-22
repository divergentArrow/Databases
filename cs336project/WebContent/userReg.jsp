<%--
	@author Fareen Pourmoussavian
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>

	<%
	try {
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();
	
		//Create a SQL statement
		Statement stmt = conn.createStatement();
	    //out.print("strings");
		//Get parameters from the HTML form at the index.jsp
		String usern = request.getParameter("email_usr");
		String passcode = request.getParameter("psw");
		
		
		
			//  check if email already used
	    String checkEmailStr = "SELECT * FROM User WHERE Username_Email='" + usern + "'";
		System.out.println(checkEmailStr);

		ResultSet checkEmailResult = stmt.executeQuery(checkEmailStr);
		if(checkEmailResult.next() ){
			System.out.println("email used!");
			%> 
			<!-- if error, show the alert and go back to login page --> 
			<script> 
			    alert("Sorry, but the email you entered has been used");
			    window.location.href = "index.jsp";
			</script>
			<%
			return;
		}
		
		
		//check the password length
			if( passcode.length() < 8 ){
			System.out.println("password too short!");
			%> 
			<!-- if error, show the alert and go back to login page -->	
				
			<script> 
			    alert("Sorry, the password should be at least 8 characters");
			    window.location.href = "index.jsp";
			</script>
			<%
			return;			
		    }
	 		else if( passcode.length() > 45 ){
			System.out.println("password too long!");
			%> 
			<!-- if error, show the alert and go back to login page --> 
			<script> 
			    alert("Sorry, the password should be at most 45 characters");
			    window.location.href = "index.jsp";
			</script>
			<%
			return;			
		   }  
			
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO User(Username_Email,Pass) VALUES (? , ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = conn.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1,usern); 
		ps.setString(2,passcode); 
		ps.executeUpdate();
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		conn.close();
		out.println("insert succeeded ");
		session.setAttribute("user", usern); // the username will be stored in the session
		session.setAttribute("pass", passcode);
        out.println("welcome " + usern);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("insert failed");
	}
%>
