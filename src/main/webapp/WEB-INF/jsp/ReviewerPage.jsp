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
<title>Reviewer Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<!-- <p><span style="float:right;">
<a href="logout.html">Logout</a></span></p> -->

<form action="<c:url value="/logout" />" method="post">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" />
</form>

<h3>Welcome - Reviewer Page</h3>
<hr />

<div class="col-sm-7">
<table class="table table-bordered">
<caption>jobs</caption>
<tr>
<th>Job Title</th>
<!-- <th></th> -->
</tr>


 <c:if test="${!empty jobs}">
<c:forEach items="${jobs}" var="job" >
<tr>
<td><a href="viewJobPosition.html?jobId=${job.id }">${job.title}</a> </td>
<%-- <td><a href="ViewAllApplicants.html?jobId=${job.id }"> View Applicants</a></td> --%>
</tr>

</c:forEach>
</c:if>
</table>
</div>

</div>

</body>
</html>