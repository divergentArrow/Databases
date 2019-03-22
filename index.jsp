<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
  <title>Login or Register Page</title> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    a:link, a:visited{
      color: blue;
    }
    a:active{
      color: black;
      text-decoration: none;
    }
    * {
  box-sizing: border-box;
}
.row::after {
  content: "";
  clear: both;
  display: block;
}
[class*="col-"] {
  float: left;
  padding: 15px;
}
html {
  font-family: "Lucida Sans", sans-serif;
}
.header {
  color: black;
  padding: 15px;
}
.menu ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.menu li {
  padding: 8px 12px;
  margin-bottom: 7px;
  margin-top: 7px;
  background-color: #33b5e5;
  color: #ffffff;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
}
.menu li:hover {
  background-color: #0099cc;
}
.aside {
  padding: 15px;
  color: #ffffff;
  text-align: center;
  font-size: 14px;
}
.head2 {
  color: #33b535;
  padding: 15px;
}
.footer {
  color: black;
  padding: 15px;
  height: auto;
  width: 100%;
}
/* For mobile phones: */
[class*="col-"] {
  width: 100%;
}
@media only screen and (min-width: 600px) {
  /* For tablets: */
  .col-s-1 {width: 8.33%;}
  .col-s-2 {width: 16.66%;}
  .col-s-3 {width: 25%;}
  .col-s-4 {width: 33.33%;}
  .col-s-5 {width: 41.66%;}
  .col-s-6 {width: 50%;}
  .col-s-7 {width: 58.33%;}
  .col-s-8 {width: 66.66%;}
  .col-s-9 {width: 75%;}
  .col-s-10 {width: 83.33%;}
  .col-s-11 {width: 91.66%;}
  .col-s-12 {width: 100%;}
}
@media only screen and (min-width: 768px) {
  /* For desktop: */
  .col-1 {width: 8.33%;}
  .col-2 {width: 16.66%;}
  .col-3 {width: 25%;}
  .col-4 {width: 33.33%;}
  .col-5 {width: 41.66%;}
  .col-6 {width: 50%;}
  .col-7 {width: 58.33%;}
  .col-8 {width: 66.66%;}
  .col-9 {width: 75%;}
  .col-10 {width: 83.33%;}
  .col-11 {width: 91.66%;}
  .col-12 {width: 100%;}
}
    .LoginBtn {
      color: white;
      padding: 18px 35px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 18px;
      margin: 2px 2px;
      cursor: pointer;
    }
    .Log {
      font-size: 24px;
      border-radius: 8px;
      box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    }
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
button {
  background-color: #3399CC;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
button:hover {
  opacity: 0.8;
}
/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
.icon {
  padding: 15px;
  background: royalblue;
  color: white;
  min-width: 30px;
  text-align: center;
  margin-bottom: 8px;
  margin-top: 8px;
}
.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
  margin-top: 5px;
}
/* Set a style for the submit button */
.registerbtn {
  background-color: royalblue;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.registerbtn:hover {
  opacity: 1;
}
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: red;
}
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}
.avatar {
  vertical-align: middle;
  width: 25%;
  height: 25%;
  border-radius: 50%;
}
img.avatar {
  width: 30%;
  border: 40%;
}
.container {
  padding: 16px;
}
span.pass {
  float: right;
  padding-top: 16px;
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}
/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}
/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}
/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.pass {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
  .tex{
    font-size: 18px;
    fon: bold;
  }
}
</style>
</head>
<body>
  <br>
  <br>
  <br>
  <div class="head2">
    <div class="aside">
    <h1 style="color:white;"><center>Login Page</center></h1>
  <br>
  <center><button onclick="document.getElementById('id01').style.display='block'" class="LoginBtn Log" style="width:auto;">Login</button></center>

  <div id="id01" class="modal">
  <form method="POST" class="modal-content animate"  action="login.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="pictures/def_profile.jpg" alt="Profile Avatar" class="avatar">
    </div>

    <div class="container">
      <h3><center>Login</center></h3>
      <label for="user" style="color:black;" align="left"><b>Username/Email</b></label><br>
      <div class="input-container">
      <i class="fa fa-user-circle-o icon"></i>
      <input type="text" placeholder="Username/Email" name="username" required>
    </div>
    <label for="pass" style="color:black;" align="left"><b>Password</b></label><br>
     <div class="input-container">
      <i class="fa fa-key icon"></i>
      <input type="password" placeholder="Password" name="pass" required>
      </div>
      <button type="submit" class="registerbtn">Login</button>
      <label for="Remember Me" style="color:black;">
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>
<br>
<center><button onclick="document.getElementById('id02').style.display='block'" class="LoginBtn Log" style="width:auto;">Register</button></center>
<div id="id02" class="modal">
<form method = "POST" class="modal-content animate" action="userReg.jsp">
  <div class="container">
     <img src="pictures/def_profile.jpg" alt="Profile Avatar" class="avatar">
    <p class="tex"><strong>Please fill in this form to create an account.</strong></p>
    <hr>
    <label for="email" style="color:black;" align="left"><b>Email/Username</b></label>
    <div class="input-container">
    <i class="fa fa-user-circle-o icon"></i>
    <input type="text" placeholder="Enter Email" name="email_usr" required>
  </div>
  <label for="psw" style="color:black;" align="left"><b>Password</b></label>
  <div class="input-container">  
    <i class="fa fa-key icon"></i>
    <input type="password" placeholder="Enter Password" name="psw" required>
    </div>
    <hr>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  <div class="container" style="background-color:#f1f1f1">
  <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
</div>
</form>
</div>
</div>
  <div class="footer">
    <h3 style="color:white;"><center> Login or Signup!</center></h3>
  </div>
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
</body>
</html>