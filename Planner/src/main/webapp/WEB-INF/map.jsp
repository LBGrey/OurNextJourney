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
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	<link rel="stylesheet" href="/css/style.css"/>
	<script src="/css/app.js"></script>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Our Next Journey</title>
</head>
<body>
<a href="/dashboard">Home</a>

	<input
      id="pac-input"
      class="controls"
      type="text"
      placeholder="Search Box"
    />
    <div id="floating-panel">
      <input id="hide-markers" type="button" value="Hide Markers" />
      <input id="show-markers" type="button" value="Show Markers" />
      <input id="delete-markers" type="button" value="Delete Markers" />
    </div>
    <div id="map" style="height:800px; width:600px"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyByFfqIXpaqPg_2sHHvc_ncS8RUyzg_C9E&callback=initAutocomplete&libraries=places&v=weekly"
      async
    ></script>
	<!-- <iframe
  width="450"
  height="250"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/search?key=AIzaSyByFfqIXpaqPg_2sHHvc_ncS8RUyzg_C9E&q=record+stores+in+Seattle" allowfullscreen> -->
<!-- </iframe> -->
<script src="<c:url value="/resources/js/app.js" />"></script>
</body>
</html>