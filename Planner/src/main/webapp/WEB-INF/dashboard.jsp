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
<body class="grey">
	<header>
		<div class="navbar" style="background-color:black">
			<div class="container" style="justify-items:center">
				<h1 style="color: #368f81; font-size: 25px; font-weight:bolder; margin-top: 5px"><strong>OUR NEXT JOURNEY</strong></h1>
				<p style="font-size:20px; font-weight:bold"><a href="/trip/new" style="text-decoration:none; color: #368f81">Add Trip</a></p>
				<p style=" font-size:20px; font-weight:bold"><a href="/logout" style="text-decoration:none; color: #368f81">Logout</a></p>
				<input type="checkbox" class="checkbox" id="checkbox">
				<label for="checkbox" class="labels">
				<div class="ball"></div>
				</label>
			</div>
		</div>
	</header>
	<h1 style="text-align: center;" class="welcome">Welcome ${name}</h1>
    <h2 style="margin-left: 200px; margin-top: 50px">My Journeys</h2>
    <div style="margin-top:40px">
		<table class="table table-dark table-striped" style="width: 1400px">
		    <thead>
		        <tr class="table-secondary">
		            <th scope="col">Trip</th>
		            <th scope="col">Location</th>
		            <th scope="col">Airline</th>
		            <th scope="col">Flight Number(s)</th>
		            <th scope="col">Itinerary Number(s)</th>
		            <th scope="col">Leaving</th>
		            <th scope="col">Returning</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${trips}" var="trip">
		    <c:if test="${trip.user.id == user_id}">
		        <tr class="table-secondary">
		            <td><a href="/show/${trip.id}" style="text-decoration: none"><c:out value="${trip.name}"/></a></td>
		            <td><c:out value="${trip.location}"/></td>
		            <td><c:out value="${trip.airline}"/></td>
		            <td><c:out value="${trip.flightNumber}"/></td>
		            <td><c:out value="${trip.itineraryNumber}"/></td>
		            <td><fmt:formatDate value="${trip.startDate}" pattern="dd/ MMM /yyyy" /></td>
		            <td><fmt:formatDate value="${trip.endDate}" pattern="dd/ MMM /yyyy" /></td>
		            <td>
		            	<c:if test="${trip.user.id == user_id}">
		            		<a href="/trip/${trip.id}/edit" style="text-decoration: none; background-color: #2d2d78; color: white; border: black 1px solid; padding:5px">Edit</a>
		            		<a href="/trip/${trip.id}/delete" style="text-decoration: none; background-color: #9f0e0c; color: white; border: black 1px solid; padding: 5px">Delete</a>
		            	</c:if>
		            </td>
		        </tr>
		      </c:if>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
    
    
    
    
    <script src="<c:url value="/resources/js/app.js" />"></script>
	
</body>
</html>