<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<p><span style="float:right;">
<a href="home.html">Home</a> |
<a href="register.html">Register</a> |
<a href="login.html?Reg=no">Login</a></span></p>

<h3>Job Details</h3>
<hr/>
<div class="col-sm-12">
<table class="table table-bordered">
<tr><th>Title</th><th>Description</th><th>Publish Date</th><th>Close Date</th></tr>
<tr><td>${job.title}</td><td>${job.description}</td><td><fmt:formatDate pattern="M/d/yyyy" value="${job.publishDate}" /></td><td><fmt:formatDate pattern="M/d/yyyy" value="${job.closeDate}" /></td></tr>
</table>
</div>
</div>
</body>
</html>