<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Apply for Job</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script type="text/javascript" src="//code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
    var max_fields      = 20; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div>Degree <input type="text" name="degree"/> School <input type="text" name="school"/> Year <input type="text" name="year"/> <a href="#" class="remove_field">Remove</a><p></p></div>'); //add input box
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});

</script>

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

<h3>Apply for Job</h3>
<hr/>
<form:form class="form-horizontal" modelAttribute="application" action="applyForJob.html?${_csrf.parameterName}=${_csrf.token}"  enctype="multipart/form-data">
	 <div class="form-group">
	    <label class="col-sm-2 control-label">Job Title:</label>
	    <div class="col-sm-4">
	      <p class="form-control-static">${application.job.title}</p>
	    </div>
 	 </div>
	
	<input type="hidden" name="jobid" value="${application.job.id}" />
	<input type="hidden" name="appid" value="${application.applicant.id}" />
	
	<div class="form-group">
		<label class="control-label col-sm-2">Current Job Title:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="currentJobTitle"
 placeholder="Enter current job title" /> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Current Job Institution:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="currentJobInstitution"
 placeholder="Enter current job institution" /> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Current Job year:</label>
		<div class="col-sm-4">
			<form:input class="form-control" path="currentJobYear"
 placeholder="Enter current job year" /> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Upload CV:</label>
		<div class="col-sm-4">
			<input class="form-control" type="file" name="cvFile" placeholder="CV" /> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Upload Research Statement:</label>
		<div class="col-sm-4">
			<input class="form-control" type="file" name="rStmtFile" placeholder="Research Statement" /> 
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2">Upload Teaching Statement:</label>
		<div class="col-sm-4">
			<input class="form-control" type="file" name="tStmtFile" placeholder="Teaching Statement" /> 
		</div>
	</div>
	
	<br />
	<div style="padding-left: 60px">
		<div class="input_fields_wrap">
		
	    <button class="add_field_button">Add More</button><p></p>
	    <div>Degree <input type="text" name="degree" />  
	     School <input type="text" name="school" />
	    Year <input type="text" name="year" /> </div><p></p>
	    
		</div>
	</div>
	
	<br />
	<div class="form-group">
		<div class="col-sm-5"></div>
		<button type="submit" class="btn btn-primary">Apply</button>
	</div>
	
  </form:form>



</div>

</body>
</html>