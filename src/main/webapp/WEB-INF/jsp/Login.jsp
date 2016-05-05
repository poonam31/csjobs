<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
<a href="home.html">Home</a> |
<a href="register.html">Register</a></span></p> -->

<table>
<td><a href="home.html"><button>Home</button></a></td>
<td>
<a href="register.html"><button>Register</button></a>
</table>

<h3>Login</h3>
<hr/>

<c:if test="${ !empty msg }"> <p>${msg}</p> </c:if>
<br />

<form:form class="form-horizontal" action="/csjobs/login" method="POST">

<!-- action="/csjobs/login" method="post" -->

<c:if test="${ !empty err }"> <p>${err}</p> </c:if>

	<div class="form-group">
		<label class="control-label col-sm-2">Username:</label>
		<div class="col-sm-4">
			<input class="form-control" type="text" name="username"
 placeholder="Enter username" />  <%-- <form:errors path="email" /> --%>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Password:</label>
		<div class="col-sm-4">
			<input class="form-control" type="password" name="password"
 placeholder="Enter password" /> <%--  <form:errors path="password" /> --%>
		</div>
	</div>
	
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   
	<div class="form-group">
		<div class="col-sm-5"></div>
		<button type="submit" name="submit"  class="btn btn-primary" value="Login" > Login </button>
	</div>
	
</form:form>

</div>
</body>
</html>