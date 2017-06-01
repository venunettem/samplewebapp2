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

	<!-- /.container -->
	<div class="topnav">
		<a class="active" href="/">Authorize Service</a> 
		<a href="/NotifyServiceActivated">Notify Service Activated</a> 		
		<a href="/DeliverActivationCode.jsp">Deliver Activation Code</a> 		
	</div>
	<div class="container" style="padding-top: 20px">

		<form id="loginForm" name="loginForm" method="post"
			class="form-horizontal" autocomplete="on">
			<div class="form-group">
				<label class="col-xs-3 control-label">Request Id</label>
				<div class="col-xs-5">
					<input type="text" class="form-control" name="requestId"
						id="requestId" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-3 control-label">Services</label>
				<div class="col-xs-5">
					<input type="text" class="form-control" name="services"
						id="services" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-3 control-label">Card Holder Name</label>

				<div class="col-xs-4">
					<input type="text" class="form-control" name="firstName"
						placeholder="First name" id="firstNameMessage" /> <span
						class="help-block"></span>
				</div>

				<div class="col-xs-4">
					<input type="text" class="form-control" name="lastName"
						placeholder="Last name" id="lastNameMessage" /> <span
						class="help-block lastNameMessage"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-3 control-label">Account Number</label>
				<div class="col-xs-5">
					<input type="text" class="form-control" name="accountNumber"
						id="accountNumber" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-3 control-label">Expiration</label>
				<div class="col-xs-3">
					<input type="text" class="form-control" placeholder="Month"
						data-stripe="exp-month" id="expiryMonth" />
				</div>
				<div class="col-xs-3">
					<input type="text" class="form-control" placeholder="Year"
						data-stripe="exp-year" id="expiryYear" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-xs-3 control-label">Security Code</label>
				<div class="col-xs-2">
					<input type="text" class="form-control cvvNumber"
						name="securityCode" id="securitycode" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-3 control-label">Source</label>
				<div class="col-xs-2">
					<input type="text" class="form-control" name="source" id="source" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-3 col-xs-offset-3">
					<button id="submit" type="button" class="btn btn-primary">Hit
						Service</button>
				</div>
			</div>
		</form>


		<div class="form-group">
			<label class="col-xs-3 control-label">Response</label>
			<textarea class="form-control" rows="5" id="response"></textarea>
		</div>
		<div id="thanks"></div>
	</div>

	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>
 $(function() {
//twitter bootstrap script
	$("button#submit").click(function(){
	
	
  var data = JSON.stringify( $('form.form-horizontal').serializeArray() ); //  <-----------
  console.log( data );
  
  var main = {};
  
  var securityCode = $('#securitycode').val();
  var source = $('#source').val();
  var services = [];
  
  
  services.push($('#services').val());
  
  main.securityCode = securityCode;
  main.source = source;
  main.services = services;
  
  console.log('Data prepared');
  
  var cardInfo = {};
  var encryptedData= {};
  encryptedData.accountNumber = $('#accountNumber').val();
  encryptedData.expiryMonth = $('#expiryMonth').val();
  
  cardInfo.encryptedData = encryptedData;
  
  main.cardInfo = cardInfo;
  console.log(main);
  
  jQuery.support.cors = true;
	$.ajax({
	//url: "http://localhost:8083/test",
	url:"http://localhost:8181/users/v1/testMDES",
	type: 'post',
    data: JSON.stringify(main),
    dataType: 'json',
    cache: false,
    timeout: 600000,
    contentType: "application/json",
	success: function(msg){
			  $('#response').text(JSON.stringify(msg));
		},
	error: function(e, statusText){
	  $("#thanks").html(statusText);
		//alert("failure");
			//$('<pre>'+JSON.stringify(obj)+'</pre>').appendTo('#thanks')
			$('#response').text(msg);
		}
		});
	});
});
</script>
</body>
</html>
