<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>View Application</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<body>
<%-- <c:set var="flag" value="false" />
<c:if test="hasRole('ROLE_REVIEWER')">
<c:forEach items="${application.job.committeeMembers}" var="mem">
	<c:if test="${mem.email == principal.username }">
		<c:set var="flag" value="true" />
	</c:if>
</c:forEach>
</c:if>
<security:authorize access="flag or hasRole('ROLE_REVIEWER') or principal.username == '${application.applicant.email}'"> --%>


<div class="container">
<!-- <p><span style="float:right;">
<a href="listApplicantJobs.html">Home</a> |
<a href="logout.html">Logout</a></span></p> -->

<table>
<td><a href="listApplicantJobs.html"><button>Home</button></a></td>
<td>
<form action="<c:url value="/logout" />" method="post">
<input name="_csrf" type="hidden" value="${_csrf.token}"/>
<input name="submit" type="submit" value="Logout" />
</form>
</td>
</table>

<h3>Application Details</h3>
<hr/>

<form class="form-horizontal">
  <div class="form-group">
    <label class="col-sm-2 control-label">Job Title:</label>
    <div class="col-sm-10">
      <p class="form-control-static">${application.job.title}</p>
    </div>
  </div>
  
    <div class="form-group">
    <label class="col-sm-2 control-label">Applicant Name:</label>
    <div class="col-sm-10">
      <p class="form-control-static">${application.applicant.firstName}</p>
    </div>
  </div>
  
    <div class="form-group">
    <label class="col-sm-2 control-label">Current Job title:</label>
    <div class="col-sm-10">
      <p class="form-control-static">${application.currentJobTitle}</p>
    </div>
  </div>
  
    <div class="form-group">
    <label class="col-sm-2 control-label">Current Job institution:</label>
    <div class="col-sm-10">
      <p class="form-control-static">${application.currentJobInstitution}</p>
    </div>
  </div>
  
    <div class="form-group">
    <label class="col-sm-2 control-label">Current Job Year:</label>
    <div class="col-sm-10">
      <p class="form-control-static">${application.currentJobYear}</p>
    </div>
  </div>
  
    <div class="form-group">
    <label class="col-sm-2 control-label">Application submit date:</label>
    <div class="col-sm-10">
      <p class="form-control-static"><fmt:formatDate pattern="M/d/yyyy" value="${application.submitDate}" /></p>
    </div>
  </div>
  

 	 <div class="form-group">
	<div class="col-sm-6">
		   <table class="table table-bordered">
		   <caption>Degrees</caption>
		   <tr>
		   <th>Name</th>
		   <th>School</th>
		   <th>Year</th>
		   </tr>
		   <c:forEach var="deg" items="${application.degrees}">
		   <tr>
		   <td>${deg.name}</td>
		   <td>${deg.school}</td>
		   <td>${deg.year}</td>
		   </tr>
			</c:forEach>
		   </table>
	</div>
   </div>
   
   <c:if test="${!empty application.cv.id}">
    <div class="form-group">
    <div class="col-sm-2">
    <a href="download.html?id=${application.cv.id}">Download CV</a>
    </div>
   
  </div>
 </c:if>
   
      <c:if test="${!empty application.researchStatement.id}">
      <div class="form-group">
      <div class="col-sm-2">
      <a href="download.html?id=${application.researchStatement.id}">Download Research Statement</a>
      </div>
     </div>
 </c:if>

      <c:if test="${!empty application.teachingStatement.id}">
    <div class="form-group">
    <div class="col-sm-2">
     <a href="download.html?id=${application.teachingStatement.id}">Download Teaching Statement</a>
     </div>
    
     </div>
 </c:if>
    
</form>



</div>
<%-- </security:authorize> --%>
</body>
</html>