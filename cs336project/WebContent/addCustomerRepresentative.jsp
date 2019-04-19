<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="cs336project.*" %>
<!DOCTYPE html>
<html class="bg">
<style>
.bg{
	background-image: url("https://i.imgur.com/Qbv02Bu.jpg?");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 100%;
}
.box2{
  padding: 4px 4px;
  margin-bottom: 7px;
  margin-top: 7px; 
  background-color: Brown;
  color: Cornsilk ;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  width: 20%;
  align: center;
}
table{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
form{
	border: 2px solid black;
	background-color: Brown;
	color: white;
	width: 50%;
}
input{
	background-color: #FE6301;
	color: white;
}
div span{
	border: 2px solid black;
	background-color: Brown;
	color: white;
}
td{
margin:5px;
padding: 9px;
}
th{
font-size:22px;
padding: 5px;
}
.show {display: block;}
</style>
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