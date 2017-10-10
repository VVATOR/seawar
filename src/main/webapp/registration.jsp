<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration page</title>
	<link rel="stylesheet" type="text/css" href="./static/styles/style.css" />
	<link rel="stylesheet" type="text/css" href="./static/styles/dlg.css" />
</head>
<body>
	${message}
	<hr />

	<div class="parent">
		<div class="block">
			<h1>Registration</h1>
			<form action="CommandController" method="post">
				<input type="hidden" name="action" value="REGISTRY" /> 
				<input type="text" name="login" placeholder="login"/> 
				<input type="text" name="name" placeholder="name"/> 
				<input type="password" name="password" placeholder="password"/>				
				<input type="submit" value="create account" />
			</form>
			<br /> 
			<a href="authorisation.jsp">Sign in</a>
		</div>
	</div>

</body>
</html>