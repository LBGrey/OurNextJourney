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
			<div class="container">
				<h1 style="color:#368f81; font-size: 25px; font-weight:bolder; margin-top: 5px;"><a href="/dashboard" style="text-decoration:none; color:#368f81"><strong>OUR NEXT JOURNEY</strong></a></h1>
				<p style=" font-size:20px; font-weight:bold; margin-left:420px"><a href="/dashboard" style="text-decoration:none;color:#368f81">Home</a></p>
				<p style="font-size:20px; font-weight:bold"><a href="/trip/new" style="text-decoration:none;color:#368f81">Add Trip</a></p>
				<p style=" font-size:20px; font-weight:bold"><a href="/logout" style="text-decoration:none;color:#368f81">Logout</a></p>
				<input type="checkbox" class="checkbox" id="checkbox">
				<label for="checkbox" class="labels">
					<div class="ball"></div>
				</label>
			</div>
		</div>
	</header>
	<div style="display:flex; flex-direction:row;">
	<input
      id="pac-input"
      class="controls"
      type="text"
      placeholder="Search Box"
    />
    <!-- <div id="floating-panel">
      <input id="hide-markers" type="button" value="Hide Markers" />
      <input id="show-markers" type="button" value="Show Markers" />
      <input id="delete-markers" type="button" value="Delete Markers" />
    </div> -->
    <div id="map" style="height:820px; width:700px"></div>


   <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByFfqIXpaqPg_2sHHvc_ncS8RUyzg_C9E&callback=initAutocomplete&libraries=places&v=weekly"
      async
    ></script>
    
    
    <div style="display: inline">
     <div style="background-color: #4898d3; min-width: 600px; max-height: 250px; margin-top: 30px; margin-left: 20px; border-radius: 10px;">
		<div id="myDIV" class="header" style="border-radius: 10px">
			<div style="background-color: #788f9c; border: 1px solid black;">
				<h2 style="font-size:35px; text-align:center; margin-top: 5px; margin-bottom: 20px; font-family: gothic; color: #e8e8e8; height: 25px;">${trip.name} Details</h2>
			</div>
			<div style="display: flex; color: linen; font-size: 20px">
				<div style="width: 300px; margin-left: 100px; margin-top: 20px">
					<%-- <p style="display: flex">Trip Name: <c:out value="${trip.name}"/></p> --%>
					<p>Location: <c:out value="${trip.location}"/></p>
					<p>Flight Number: <c:out value="${trip.flightNumber}"/></p>
					<p>Date I Leave: <fmt:formatDate value="${trip.startDate}" pattern="dd/ MMM /yyyy" /></p>
				</div>
				<div style="width: 500px; margin-left: 100px; margin-top: 20px;">
					<p>Airline: <c:out value="${trip.airline}"/></p>
					<p>Itinerary Number: <c:out value="${trip.itineraryNumber}"/></p>
					<p>Date I Return: <fmt:formatDate value="${trip.endDate}" pattern="dd/ MMM /yyyy" /></p>
				</div>
			</div>
		</div>
	</div>
    <main style="background-color: #4898d3; min-width: 780px; min-height: 180px; margin-top: 10px; margin-left: 20px; border-radius: 10px;">
		<div id="myDIV" class="header" style="border-radius: 10px">
			<div style="background-color: #788f9c; border: 1px solid black;">
				<h2 style="font-size:35px; text-align:center; margin-top: 5px; margin-bottom: 20px; font-family: gothic; color: #e8e8e8; height: 25px;">My To Do Checklist</h2>
			</div>
			<div>
				<form:form action="/todos/new" method="post" modelAttribute="todoS" style="display: flex; margin-top: 20px;">
					<form:hidden path="trip" name="trip" value="${trip_id}"/>
					<div class="form-group">
						<form:label path="content" style="margin-right: 10px; color: white; font-size: 20px; text-shadow: 1px 2px 2px black;"><strong>Don't Forget</strong></form:label>
						<form:input path="content" id="myInput" placeholder=" I need..." style="margin-right: 0px"/>
						<form:errors path="content" class="text-danger" />
						<form:hidden path="user" value="${user_id}"/>
					</div>
						<input type="submit" id="myInput2" value="Add" class="addBtn" />
				</form:form>
			</div>
		</div>
		<div style="overflow-y: scroll; overflow-x: hidden; max-height: 180px; max-width:100%; margin-left: 20px; background-color: #4898d3;">
	        <ul id="myUL">
				<c:forEach items="${todos}" var="todo">
					<li style="width: 670px; margin-left: 25px;"> <c:out value="${todo.content}"/>
					<a href="/todos/${todo.id}/delete/${trip_id}" style="width:40px; text-decoration: none; color: black" class="close">X</a>
					</li>
	            </c:forEach>
			</ul>
		</div>
	</main>
	<main style="background-color: #4898d3; min-width: 780px; min-height: 200px; margin-top: 10px; margin-left: 20px;  border-radius: 10px;">
		<div id="myDIV" class="header" style="border-radius: 10px">
			<div style="background-color: #788f9c; border: 1px solid black;">
				<h2 style="font-size:35px; text-align:center; margin-top: 5px; margin-bottom: 20px; font-family: gothic; color: #e8e8e8; height: 25px;">My Places</h2>
			</div>
			<div>
				<form:form action="/places/new" method="post" modelAttribute="placeS" style="display: flex; margin-top: 20px;">
					<form:hidden path="trip" name="trip" value="${trip_id}"/>
					<div class="form-group">
						<form:label path="contents" style="margin-right: 10px; color: white; font-size: 20px; text-shadow: 1px 2px 2px black;"><strong>I want to go to:</strong></form:label>
						<form:input path="contents" id="myInput" placeholder=" Next place..." style="margin-right: 0px"/>
						<form:errors path="contents" class="text-danger" />
						<form:hidden path="user" value="${user_id}"/>
					</div>
						<input type="submit" id="myInput2" value="Add" class="addBtn" />
				</form:form>
			</div>
		</div>
		<div style="overflow-y: scroll; overflow-x: hidden; max-height: 200px; max-width:100%; background-color: #4898d3; margin-left: 20px">
	        <ul id="myUL">
				<c:forEach items="${places}" var="place">
					<li style="width: 670px; margin-left: 25px;"> <c:out value="${place.contents}"/>
					<a href="/places/${place.id}/delete/${trip_id}" style="width:40px; text-decoration: none; color: black" class="close">X</a>
					</li>
	            </c:forEach>
			</ul>
		</div>
	</main>
	</div>
    </div>
</body>
     <script src="<c:url value="/resources/js/app.js" />"></script>
     <script type="text/javascript" src="/resources/js/app.js"></script>

</html>