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
<title>Insert title here</title>
</head>
<body style="background-color: darkgrey">
	<div class="intro">
	</div>
	<main class="wrap" style="margin-left: 300px;">
	    <div class="box1">
	    	<h2 style="color: white">Registration</h2>
		    <form:form action="/register" method="post" modelAttribute="newUser" class="row g-3">
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="firstName" class="text-danger" />
		            <br/>
		            <label class="form-label">First Name:</label>
		            <form:input path="firstName" class="form-control" />
		        </div>
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="lastName" class="text-danger" />
		            <br/>
		            <label class="form-label">Last Name:</label>
		            <form:input path="lastName" class="form-control" />
		        </div>
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="email" class="text-danger" />
		            <label class="form-label" style="margin-top:20px;">Email:</label>
		            <form:input path="email" class="form-control" /><br/>
		        </div>
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="password" class="text-danger" />
		            <label class="form-label">Password:</label>
		            <form:password path="password" class="form-control" /><br/>
		        </div>
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="confirm" class="text-danger" />
		            <label class="form-label">Confirm Password:</label>
		            <form:password path="confirm" class="form-control" /><br/>
		        </div>
		        <input type="submit" value="Register" class="submit" />
		    </form:form>
	    </div>
	    <div class="box2" style="height: 420px; margin-top: 200px">
	    	<h2 style="color:white">Login</h2>
		    <form:form action="/login" method="post" modelAttribute="newLogin" class="row g-3">
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="email" class="text-danger" />
		            <label class="form-label" style="margin-right:40px; margin-top:20px;">Email:</label>
		            <form:input path="email" class="form-control" />
		        </div>
		        <div class="col-12" style="display:flex; flex-direction:column">
		            <form:errors path="password" class="text-danger" />
		            <label class="form-label" style="margin-right:40px; margin-top:20px">Password:</label>
		            <form:password path="password" class="form-control" />
		        </div>
		        <input type="submit" value="Login" class="submit" />
		    </form:form>
	    </div>
    </main>
</body>
</html>