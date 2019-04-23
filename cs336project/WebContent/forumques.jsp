<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="cs336project.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html class="bg">
<head>
<title>Submit Questions</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<br>
	<br>
	<br>
	<div class="head2">
		<div class="aside">
			<h1 style="color: black;" align=center>Submit a Question</h1>
			<br>
			<div id="id01" class="modal">
				<form method="POST" class="modal-content animate" action="forumtryagain.jsp">
					<div class="container">
						<label for="user" style="color: black;" align="left"><b>Username/Email</b></label><br>
						<div class="input-container">
							<i class="fa fa-user-circle-o icon"></i> <input type="text"
								placeholder="Username/Email" name="username" required>
						</div>
						<label for="pass" style="color: black;" align="left"><b>Password</b></label><br>
						<div class="input-container">
							<i class="fa fa-key icon"></i> <input type="password"
								placeholder="Password" name="pass" required>
						</div>
						
						
						<label for="question" style="color: black;" align="left"><b>Question</b></label><br>
      					<textarea name="question" rows="5" cols="50" required></textarea>

						<div>
						<button type="submit" class="registerbtn">Post Question</button>
						</div>
						
					</div>
				</form>
			</div>
			<br> <br> 
		</div>

		<div class="footer">
			<!--<h3 style="color:RoyalBlue  ;" align=center>Login or SignUp!</h3>-->
			<p align=center>Copyright �2019</p>
		</div>

		<script>
// Get the modal
var modal = document.getElementById('id01');
var modal = document.getElementById('id02');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
	</div>
</body>
</html>