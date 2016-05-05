<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View Jobs</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>

<body>

<div class="container">
<!-- <p><span style="float:right;">
<a href="register.html">Register</a> | <a href="login.html?Reg=no">Login</a></span></p> -->

<table>
<td><a href="register.html"><button>Register</button></a></td>
<td>
<a href="login.html?Reg=no"><button>Login</button></a>
</td>
</table>

<h3>Open Jobs </h3>
<hr/>


<ul>
<c:forEach var="job" items="${jobs}">

<%-- <li><a href="http://localhost:8080/csjobs/">${job.title}</a></li> --%>

<li><a href="jobDetails.html?jobid=${job.id}">${job.title}</a></li>

</c:forEach>
</ul>

<!-- <hr />
<p><a href="register.html">Register here</a></p><br/>
<p><a href="login.html">Login</a></p> -->
</div>

</body>
</html>