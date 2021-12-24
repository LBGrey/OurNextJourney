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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
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
	<div class="box">
			<div class="search_select_box" id="search_select_box">
				<select onchange="openWindow(this)" id="select_page" class="w-100" class="operator" data-live-search="true">
					<option value="">Select an airline..</option>
					<option value="https://www.airasia.com/en/gb">AirAsia</option>
					<option value="https://www.emirates.com/us/english/">Emirates Airlines</option>
					<option value="https://www.qatarairways.com/en/homepage.html">Qatar Airways</option>
					<option value="https://www.saudia.com">Saudie Arabian Airlines</option>
					<option value="https://www.airasia.com/en/gb">AirAsia</option>
					<option value="https://www.airchina.us/US/GB/Home">Air China</option>
					<option value="https://www.airnewzealand.co.nz">Air New Zealand Group</option>
					<option value="http://www.ana.co.jp">ANA - All Nippon Airways</option>
					<option value="https://flyasiana.com/C/US/EN/index">Asiana Airlines</option>
					<option value="https://www.cathaypacific.com/cx/en_US.html">Cathay Pacific</option>
					<option value="https://www.cebupacificair.com">Cebu Pacific Air</option>
					<option value="https://www.china-airlines.com/tw/en">China Airlines</option>
					<option value="https://us.ceair.com/en/">China Eastern Airlines</option>
					<option value="https://www.csair.com/cn/">China Southern Airlines</option>
					<option value="https://www.garuda-indonesia.com/other-countries/en/index">Garuda Indonesia</option>
					<option value="http://www.hnair.com">Hainan Group</option>
					<option value="https://www.jal.com/index.html">JAL Group(Japan Airlines)</option>
					<option value="https://www.jetstar.com/us/en/home?adults=1&children=0&flexible=1&flight-type=2&infants=0&origin=HNL&tab=1">Jetstar</option>
					<option value="http://flykingfisher.com">Kingfisher Airlines</option>
					<option value="https://www.koreanair.com/us/en">Korean Air</option>
					<option value="http://www.malaysiaairlines.com">Malaysia Airlines</option>
					<option value="http://www.qantas.com.au">Qantas</option>
					<option value="http://www.shenzhenair.com">Shenzhen Airlines</option>
					<option value="https://www.singaporeair.com/en_UK/us/home#/book/bookflight">Singapore Airlines</option>
					<option value="https://www.thaiairways.com">Thai Airways International</option>
					<option value="http://www.vietnamairlines.com">Vietnam Airlines</option>
					<option value="https://www.virginaustralia.com/us/en/#/">Virgin Australia</option>
					<option value="https://www.aerlingus.com/html/en-US/home.html">Aer Lingus</option>
					<option value="https://www.aeroflot.ru/ru-ru">Aeroflot Russian Airlines</option>
					<option value="http://www.airberlin.com">Air Berlins Group</option>
					<option value="https://www.airfrance.com/indexCom_en.html">Air France KLM</option>
					<option value="https://www.austrian.com/us/en/homepage">Austrian Airlines Group</option>
					<option value="https://www.britishairways.com/travel/home/public/en_us/">British  AIrways</option>
					<option value="https://www.easyjet.com/en/">easyJet</option>
					<option value="http://www.iberia.com">Iberia Group</option>
					<option value="http://www.lufthansa.com">Lufthansa</option>
					<option value="https://www.norwegian.com">Norwegian Air Shuttle</option>
					<option value="https://www.ryanair.com/us/en">Ryanair</option>
					<option value="https://www.swiss.com/us/en/homepage">Swiss</option>
					<option value="http://flights.thomson.co.uk">Thomson Airways</option>
					<option value="https://www.turkishairlines.com">Turkish Airlines</option>
					<option value="https://www.vueling.com">Vueling</option>
					<option value="http://www.avianca.com">Avianca</option>
					<option value="http://www.voegol.com.br">Gol Linhas Aereas</option>
					<option value="https://www.latamairlines.com/us/en">TAM Linhas Aereas</option>
					<option value="http://www.aircanada.com">Air Canada</option>
					<option value="https://www.southwest.com/?ref=airtran.com">Southwest</option>
					<option value="https://www.alaskaair.com">Alaska Airlines</option>
					<option value="https://www.aa.com">American Airlines</option>
					<option value="https://www.united.com/en/us">United Airlines</option>
					<option value="https://www.delta.com">Delta Airlines</option>
					<option value="http://www.frontierairlines.com">Frontier Airlines</option>
					<option value="https://www.jetblue.com">JetBlue Airways</option>
					<option value="https://www.southwest.com">Southwest Airlines</option>
					<option value="http://www.usairways.com">US AIrways</option>
					<option value="https://www.westjet.com">WestJet</option>
				</select>
			</div>
		</div>
	</div>
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
<script src="<c:url value="/resources/js/app2.js" />"></script>
<script type="text/javascript" src="/resources/js/app.js"></script>
</body>
</html>
