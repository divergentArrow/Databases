
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://dbproject.c7uz35ugmdw0.us-east-2.rds.amazonaws.com:3306/CS336","root", "dbpass");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where Username_Email='" + userid + "' and Pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>