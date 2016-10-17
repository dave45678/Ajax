<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		$('#submit').click(function(event) {
			var username = $('#user').val();
			$.get('AJAXServlet', {
				user : username
			}, function(responseText) {
				$('#message').text(">>>" + responseText);
			});
		});
	});
</script>
</head>
<body>
	<h1>AJAX Demo</h1>
	<form id="form1" name="form1" action="AJAXServlet" method="get">
		Enter your name: <input type="text" id="user" /><br /> <input
			type="button" id="submit" value="Ajax Submit" />
	</form>
	<p />


	<div id="message">it should change here!!!!</div>

</body>
</html>