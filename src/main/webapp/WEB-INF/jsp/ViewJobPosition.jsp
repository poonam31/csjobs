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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
<a href="adminPage.html">Home</a> |
<a href="logout.html">Logout</a></span></p> -->

<table>
<td><a href="adminPage.html"><button>Home</button></a></td>
<td>
<form action="<c:url value="/logout" />" method="post">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" />
</form>
</td>
</table>

<h3>View Job Position</h3>
<hr/>
<p>
<a href="ViewAllApplicants.html?jobId=${job.id}">View all Applicants</a></p>
<div class="col-sm-7">
<table class="table table-bordered">
<caption>Job Details</caption>
<tr>
<th>Title</th>
<td>${job.title}</td>
</tr>
<tr>
<th>Description</th>
<td>${job.description}</td>
</tr>
<tr>
<th>Publish Date</th>
<td><fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></td>
</tr>
<tr>
<th>Close Date</th>
<td><fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></td>
</tr>

<tr>
<th>Review Committee Chair</th>
<td> ${job.committeeChair.firstName} ${job.committeeChair.lastName}</td>
</tr>


<tr>
<th>Review Committee Members</th>
<td><ul><c:forEach items="${job.committeeMembers}" var="member">
<li> ${member.firstName} ${member.lastName}</li>
</c:forEach></ul></td>
</tr>

</table>

</div>
</div>
</body>
</html>
