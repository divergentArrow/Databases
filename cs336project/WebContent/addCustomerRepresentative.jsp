<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer Representative</title>
</head>
<body>
	<%
		CustomerRepresentative cr = new CustomerRepresentative(session);
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		boolean success = false;
		if(!user.isEmpty() && user!=null){
			if(!pass.isEmpty() && pass!=null){
				success = cr.addCustomerRep(user, pass);
				if(success){
					out.println("New customer representative successfully added!");
				} else{
					out.println("Uh oh! Something went wrong!");
				}
			} else{
				out.println("Password field cannot be empty!");
			}
		} else{
			out.println("Username field cannot be empty!");
		}
	%>
	
	<a href="admin.jsp" class=box1>Return to Admin page</a>

</body>
</html>