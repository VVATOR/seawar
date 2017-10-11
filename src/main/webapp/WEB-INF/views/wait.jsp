<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="m" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wait enemy</title>
	<link rel="stylesheet" type="text/css" href="static/styles/style.css" />
	<script src="static/field_random.js">	
</script>

</head>
<body onload="statusEnymyFieldFill()">


	<m:menu-top/>
	
<form action="CommandController" method="post">
	<input type="submit" name="action" value="SURRENDER" class="btn"/>	
	<input type="hidden" name="game" value="${param.game}" />	
</form>
<form action="CommandController" method="post">
	<input type="submit" value="DASHBOARD" class="btn"/>	
	<input type="hidden" name="game" value="${param.game}" />	
	<input type="hidden" name="action" value="TO_DASHBOARD" />
</form>


	<h1>wait of the enimy...</h1>

	<input type="hidden" id="enemyId" value="${enemy.id}" />
	<input type="hidden" id="gameId" value="${param.game}" />
	<input type="hidden" id="current_user" value="${current_user.id}" />

	You wait while <b>${enemy.login}</b> set ship position

	<div id="content">
		<img src="./static/images/loader.gif" alt="wait of the enimy..." />
	</div>
</body>
</html>