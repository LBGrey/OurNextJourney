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
				<p style=" font-size:20px; font-weight:bold; margin-left:420px"><a href="/dashboard" style="text-decoration:none;color:#274f49">Home</a></p>
				<p style=" font-size:20px; font-weight:bold"><a href="/logout" style="text-decoration:none;color:#274f49">Logout</a></p>
				<input type="checkbox" class="checkbox" id="checkbox">
				<label for="checkbox" class="label">
					<div class="ball"></div>
				</label>
			</div>
		</div>
	</header>
	<main style="background-color:#738c82">
        <h1 style="text-align: center">Welcome ${name}</h1>
        <h2 style="margin-bottom:-20px; margin-left:20px; text-align:center">Checklist:</h2>
        <div id="myDIV" class="header">
          <h2>My To Do List</h2>
<!--           <input type="text" id="myInput" placeholder="Title..."> -->
		<form:form action="/todos/new" method="post" modelAttribute="todoS">
			<div class="form-group">
                  <%--  <form:label path="content"></form:label> --%>
				<form:input path="content" type="text" id="myInput" placeholder="Title..." />
				<form:errors path="content" class="text-danger" />
			</div>
				<form:hidden path="user" value="${user_id}"/>
				<input type="submit" id="myInput2" value="Add" class="addBtn" />
           </form:form>
          	<!-- <span onclick="newElement()" class="addBtn">Add</span> -->
        </div>
        <ul id="myUL">
			<c:forEach var="todo" items="${todos}">
                <li> <c:out value="${todo.content}"/>
                     <!-- <input style="width:40px" type="submit" value="X" class="close"/> -->
                     <a href="/todos/${todo.id}/delete" style="width:40px; text-decoration: none; color: black" class="close">X</a>
                </li>
            </c:forEach>
		</ul>
	</main>
</body>
<script type="text/javascript" src="/resources/js/app.js"></script>
</html>