<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Applicant Job list</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
Home |
<a href="logout.html">Logout</a></span></p> -->

<form action="<c:url value="/logout" />" method="post">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" />
</form>

<h3>Welcome ${user.firstName} </h3>
<hr/>

<c:choose>
<c:when test="${empty jobs}">
<div class="col-sm-7">
<b>Note:</b> No jobs to apply.
</div>
</c:when>
<c:otherwise>
<div class="col-sm-7">
<table class="table table-bordered table-condensed">
<caption>Open Job Positions</caption>

<tr>
<th>Title</th>
<th></th>
</tr>

<c:forEach var="job" items="${jobs}">

<tr>
<td>${job.title}</td>
<td><a href="applyForJob.html?jobid=${job.id}&appid=${user.id}">Apply<span style="padding-right: 62px"></span></a></td>
</tr>

</c:forEach>
</table>
</div>
</c:otherwise>
</c:choose>

<!-- **************************************************************************** -->
<c:choose>
<c:when test="${empty applications}">
<div class="col-sm-7">
<b>Note:</b> You have not applied for any jobs.
</div>
</c:when>
<c:otherwise>

<div class="col-sm-7">

<table class="table table-bordered table-condensed">
<caption>You have applied for below Job Positions</caption>

<tr>
<th>Title</th>
<th colspan="2">Application Operations</th>

</tr>

<c:forEach var="app" items="${applications}">

<tr>
<td>${app.job.title}</td>
<td><a href="viewApplication.html?appid=${app.id}">View</a></td>
<td><a href="editApplication.html?appid=${app.id}">Edit</a></td>
</tr>

</c:forEach>
</table>
</div>
</c:otherwise>

</c:choose>


</div>
</body>
</html>