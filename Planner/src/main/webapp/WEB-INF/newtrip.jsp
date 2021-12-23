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
				<h1 style="color:#368f81; font-size: 25px; font-weight:bolder; margin-top: 5px;"><strong>OUR NEXT JOURNEY</strong></h1>
				<p style=" font-size:20px; font-weight:bold; margin-left:420px"><a href="/dashboard" style="text-decoration:none;color:#368f81">Home</a></p>
				<p style=" font-size:20px; font-weight:bold"><a href="/logout" style="text-decoration:none;color:#368f81">Logout</a></p>
				<input type="checkbox" class="checkbox" id="checkbox">
				<label for="checkbox" class="label">
					<div class="ball"></div>
				</label>
			</div>
		</div>
	</header>
	<main class="bg">
		<div class="head">
			<h1>Add a new trip!</h1>
		
		<form:form action="/trip/new" method="post" modelAttribute="trip" class="form2">
		<form:hidden path="user" value="${user_id}"/>
		    <div class="col-med-6">
		        <form:label path="name" style="color:black">Title:</form:label>
		        <form:errors path="name"/>
		        <form:input path="name" style="margin-left:154px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="location" style="color:black">Location:</form:label>
		        <form:errors path="location"/>
		        <form:input path="location" style="margin-left:116px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="airline" style="color:black">Airline:</form:label>
		        <form:errors path="airline"/>
		        <form:input path="airline" style="margin-left:138px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="flightNumber" style="color:black">Flight Number:</form:label>
		        <form:errors path="flightNumber"/>
		        <form:input path="flightNumber" style="margin-left:66px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="itineraryNumber" style="color:black">Itinerary Number:</form:label>
		        <form:errors path="itineraryNumber"/>
		        <form:input path="itineraryNumber" format="yyyy-mm-dd" style="margin-left:40px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="startDate" style="color:black">Start Date</form:label>
		        <form:errors path="startDate"/>
		        <form:input type="date" path="startDate" style="margin-left:112px; width: 300px"/>
		    </div>
		    <div class="col-med-6" style="margin-top:20px;">
		        <form:label path="endDate" style="color:black">End Date</form:label>
		        <form:errors path="endDate"/>
		        <form:input type="date" path="endDate" format="yyyy-mm-dd" style="margin-left:123px; width: 300px"/>
		    </div>
	    		<input style="margin-top: 20px; margin-left: 225px" type="submit" value="Create" class="createnew" style="margin-left: 370px;"/>
		</form:form>  
		</div>
	</main>
</body>
</html>