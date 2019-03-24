
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<title>Welcome!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.box1{
  padding: 12px 12px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: #33b5e5;
  color: #ffffff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}
.box1:hover {
  background-color: #0099cc;
}
</style>
<%
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
        response.sendRedirect("success.jsp");
    } else {
        out.println("<br><h3 align=center>Error! Invalid Username or Password</h3><a href='index.jsp' class=box1>Try Again</a>");
    }
%>