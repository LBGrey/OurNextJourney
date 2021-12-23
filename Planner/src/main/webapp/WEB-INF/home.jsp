<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Our Next Journey</title>
</head>
<body>
	<header>
		<div class="navbar" style="background-color:black">
			<div class="container">
				<h1 style="color:#274f49; font-size: 25px; font-weight:bolder"><strong>OUR NEXT JOURNEY</strong></h1>
			</div>
		</div>
	</header>
	<main>
		<div class="bk">
			<!-- <h1 style="text-align:center">Our next Journey</h1> -->
			<div style="display:flex; flex-direction: column; justify-content:center; color: white; margin-top: 100px">
				<div style="height:200px; width:800px; text-align: center; font-weight:bolder; ">
					<h2 style="background-color: rgba(0, 0, 0, 0.3); border-radius: 20px">Welcome to Our Next Journey!  Here you can track your flights, plan your itinerary, and track your reminders and lists all in one place.  We hope you enjoy our site, safe travels!</h2>
			</div>
				<div style="display: flex; text-algin: center; font-weight:bolder; margin-top: 50px; ">
					<div style="display: inline; color: white; margin-right: 150px; text-align: center;">
						<p style="background-color: rgba(0, 0, 0, 0.3); border-radius: 20px">Not a user yet?</p>
						<p style="font-weight:bold; background-color: rgba(0, 0, 0, 0.3); border-radius: 20px; padding-left: 10px; padding-right: 10px"><a href="/register" style="color:white; font-size: 40px">Register</a></p>
					</div>
					<div style="display: inline; color: white; text-align: center;">
						<p style="background-color: rgba(0, 0, 0, 0.3); border-radius: 20px; padding-left: 10px; padding-right: 10px">Already a user?</p>
						<p style="font-weight:bold; background-color: rgba(0, 0, 0, 0.3); border-radius: 20px"><a href="login" style="color:white; font-size: 40px">Login</a></p>
					</div>
				</div> 
		</div>
	</main>
</body>
</html>