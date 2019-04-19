
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html class="bg">
<head>
<title>Welcome!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.box1{
  padding: 24px 24px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: DarkRed ;
  color: #ffffff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}
.box1:hover {
  background-color: FireBrick  ;
}
.box2{
  padding: 6px 6px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: black ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 40%;
}
.bg{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
a {
font-size: 30px;
}
</style>
<%
out.println("<body>");
	ApplicationDB db = new ApplicationDB();		
	Connection conn = db.getConnection();

    String userid = request.getParameter("username");   
    String pwd = request.getParameter("pass");
   
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where Username_Email='" + userid + "' and Pass='" + pwd + "'");
    if (rs.next()) {
    	
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        
        if(userid.equals("admin") && pwd.equals("admin")){
        	response.sendRedirect("admin.jsp");
        }
        else{
        	User dummyUser = new User(session);
        	dummyUser.setUsername(userid);
        	boolean isCR = dummyUser.isCR(pwd);
        	if(isCR){
        		response.sendRedirect("customerRep.jsp");
        	} else{
        		response.sendRedirect("success.jsp");
        	}
        }
    } else {
        out.println("<br><center><div align=center class=box2><h1 align=center>Error! Invalid Username or Password</h1></div></center><br><br><div align=center><a href='index.jsp' class=box1>Try Again</a></div></body></html>");
    }
%>