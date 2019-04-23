<%--
	@author Fareen Pourmoussavian
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
session = request.getSession();
session.invalidate();
//session.getAttribute("user");   //this will throw an error
response.sendRedirect("index.jsp");
%>