<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Register</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
<a href="home.html">Home</a> |
<a href="login.html?Reg=no">Login</a></span></p> -->

<table>
<td><a href="home.html"><button>Home</button></a></td>
<td>
<a href="login.html?Reg=no"><button>Login</button></a>
</td>
</table>

<h3>User Registration </h3>
<hr/>
  <form:form class="form-horizontal" modelAttribute="user">
	<div class="form-group">
		<label class="control-label col-sm-2">First Name:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="firstName"
 placeholder="Enter first name" /> <form:errors path="firstName" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">Last Name:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="lastName"
 placeholder="Enter last name" /> <form:errors path="lastName" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">Email:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="email"
 placeholder="Enter email" /> <form:errors path="email" />
 		<c:if test="${ !empty msg }">
	    			<p>${msg}</p>
	   	</c:if>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">Phone:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="phone"
 placeholder="Enter phone" /> <form:errors path="phone" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">Address:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="address"
 placeholder="Enter address" /> <form:errors path="address" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">Password:</label>
		<div class="col-sm-4">
			<form:input type="password" class="form-control" path="password" placeholder="Enter password" /> <form:errors path="password" />
		</div>
	</div>
	<!-- <div class="form-group">
		<label class="control-label col-sm-2">Re-enter Password:</label>
		<div class="col-sm-4">
			<input type="password" class="form-control" name="repassword" placeholder="Re-enter password">
		</div>
	</div> -->
<br/>
	<div class="form-group">
		<div class="col-sm-5"></div>
		<button type="submit" class="btn btn-primary">Register</button>
	</div>
	
  </form:form>
</div>
</body>
</html>