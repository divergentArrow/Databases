

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>