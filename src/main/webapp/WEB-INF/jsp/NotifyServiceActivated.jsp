<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
</head>
<body>

<div class="topnav">
		<a  href="/">Authorize Service</a> 
		<a class="active" href="/NotifyServiceActivated">Notify Service Activated</a> 		
		<a href="/DeliverActivationCode">Deliver Activation Code</a> 		
	</div>
<div class="container" style="padding-top:20px">

	<form id="loginForm" method="post" class="form-horizontal">
    <div class="form-group">
        <label class="col-xs-3 control-label">Field1</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="field1" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-xs-3 control-label">Field2</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="field2" />
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-3 col-xs-offset-3">
            <button id="submit" type="button" class="btn btn-primary">Hit Service</button>
        </div>
    </div>
</form>

<div id="thanks"></div>

 </div>
<script>
 $(function() {
//twitter bootstrap script
	$("button#submit").click(function(){
	
	console.info($('form.form-horizontal').serialize());
		   	$.ajax({
    		   	type: "POST",
			url: "process.php",
			data: $('form.form-horizontal').serialize(),
        	success: function(msg){
 	          		  $("#thanks").html(msg)
 		        },
			error: function(){
				alert("failure");
				}
      			});
	});
});
</script>
</body>
</html>
