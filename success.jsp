<%
    if ((session.getAttribute("user") == null)) {
	%>
		You are not logged in<br/>
		<a href="index.jsp">Please Login or Register</a>
	<%
	} 
	else {
	%>
	Welcome <%=session.getAttribute("user")%>!  <!--//this will display the username that is stored in the session.-->
	<a href='logout.jsp'>Log out</a>
	<%
	}
	%>