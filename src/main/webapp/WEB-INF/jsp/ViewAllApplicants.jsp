<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View All Applicants</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
<a href="adminPage.html">Home</a> |
<a href="logout.html">Logout</a></span></p> -->

<!-- <table>
<td><a href="adminPage.html"><button>Home</button></a></td>
<td> -->
<form action="<c:url value="/logout" />" method="post">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" />
</form>
<!-- </td>
</table> -->

<h3>Job Title - ${job.title}</h3>
<hr/>
<div class="col-sm-7">
<c:if test="${empty applications}">
<p>No applicants </p>
</c:if>
 <c:if test="${!empty applications}">
<table class="table table-bordered">
<caption>Applicants of job</caption>
<tr>
<th>Applicant Name</th>
<th></th>
</tr>



<c:forEach items="${applications}" var="application" >
<tr>
<td>${application.applicant.firstName} ${application.applicant.lastName}</td>
<td> <a href="viewApplication.html?appid=${application.id }">View application</a> </td>
</tr>

</c:forEach>

</table>
</c:if>
</div>


</div>
</body>
</html>
