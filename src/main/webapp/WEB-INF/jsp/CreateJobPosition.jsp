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

<h3>Create new job</h3>
<hr/>

<form:form modelAttribute="job">
<div class="col-sm-10">
<table class="table table-bordered">
<tr>
  <th>Title</th>
  <td><form:input path="title" /></td>
</tr>

<tr>
  <th>Description</th>
  <td><form:input path="description" /></td>
</tr>

<tr>
  <th>Publish Date</th>
  <td><form:input path="publishDate"  /></td>

</tr>

<tr>
  <th>Close Date</th>
  <td><form:input path="closeDate" /></td>
  
</tr>


<tr>
  <th>Committee Chair</th>
  <td>
  <form:select path="committeeChair">
	  <c:forEach items="${reviewers}" var="rev">
	  <form:option value="${rev.id}">${rev.firstName} ${rev.lastName} </form:option>
	 </c:forEach>
  </form:select>
  </td>
</tr>


<tr>
  <th>Committee members</th>
  <td>
  <c:forEach items="${reviewers}" var="rev1">
  <form:checkbox path="committeeMembers" value="${rev1.id}" />${rev1.firstName} ${rev1.lastName} <br/>
   </c:forEach>
  </td>
</tr>

<tr>
  <th><br /></th>
  <td><input type="submit" name="Create" value="Create" /></td>
</tr>
</table>
</div>
</form:form>

</div>
</body>
</html>
