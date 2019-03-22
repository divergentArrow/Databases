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


		
		//Class.forName("com.mysql.jdbc.Driver").newInstance();
		//Connection conn = DriverManager.getConnection("jdbc:mysql://dbproject.c7uz35ugmdw0.us-east-2.rds.amazonaws.com:3306/CS336");
	
		ApplicationDB db = new ApplicationDB();	
		Connection conn = db.getConnection();
		//Create a SQL statement
		Statement stmt = conn.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String usern = request.getParameter("email_usr");
		String passcode = request.getParameter("psw");
		

		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO User(Username_Email,Pass) VALUES (?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = conn.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1,usern); 
		ps.setString(2,passcode); 

		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		conn.close();
		out.print("insert succeeded");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>








</body>
</html>	