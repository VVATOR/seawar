<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./static/styles/style.css" />
<link rel="stylesheet" type="text/css" href="./static/styles/dlg.css" />

</head>
<body>

	${message}
	<hr />



	<div class="parent">
		<div class="block">
			<h1>Authorisation</h1>
			<form action="CommandController" method="post">
				<input type="text" name="login" placeholder="login" /> <input
					type="password" name="password" placeholder="password" /> <input
					type="submit" name="action" value="LOGIN" class="btn" />
			</form>
			<br /> <a href="registration.jsp" class="">Registration</a>
		</div>
	</div>

</body>
</html>