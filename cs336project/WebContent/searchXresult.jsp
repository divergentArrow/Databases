<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<head>
<title>Questions Search Results</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<h1 style="color: black;" align=center>Search Results Based on Submitted Keyword</h1>
<%
out.println("<body>");
	ApplicationDB db = new ApplicationDB();		
	Connection conn = db.getConnection();
	
	String kw = request.getParameter("keyword") ;
	System.out.println(kw) ; 
	
	Statement statement = conn.createStatement();

    // System.out.println(ques) ; lkj ;lkj
   
    Statement st = conn.createStatement();
    ResultSet rs;
    
    
    
    // String QueryString = "SELECT * FROM Questions WHERE Question LIKE '%{kw}%'";
    
  	// String QueryString = "SELECT * FROM Questions WHERE Question LIKE CONCAT('%',kw,'%')" ;
  	
  	String QueryString = "SELECT * FROM Questions WHERE Question LIKE '%" + kw + "%';" ; 
    
  	
  	
    // String QueryString = "SELECT * from Questions" ; 
    rs = statement.executeQuery(QueryString);
    
    %>
    <TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
    <%
    while (rs.next()) {
    %>
    <TR>
    <TD><%=rs.getString("Question")%></TD>
    </TR>
    <% } %>
    <%
    // close all the connections.
    rs.close();
    statement.close();
    conn.close();
    %>
    </TABLE>
    </font>
    </body>
    </html>