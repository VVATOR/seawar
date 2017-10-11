<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="static/styles/style-battlefield.css"/>
	<link rel="stylesheet" type="text/css" href="static/styles/style.css" />
	<script src="static/field_random.js"></script>
<style>
div#lockBlock {
display:block;
position:absolute;
z-index:1000;
    height:100%;
    width:100%;
    opacity:0.5;
    background:#f00;
    /*color:#fff;*/
    
    
}
body, html { 
    width: 100%;
    height: 100%;
}
div#lockBlock{
	display:none;
}
div#lockBlock h1{
display:block;
	background: red;
	color white;
}
</style>
</head>
<body onload="addListener(); statusGame();">

<form action="CommandController" method="post">
	<input type="submit" name="action" value="SURRENDER" class="btn"/>	
	<input type="hidden" name="game" value="${param.game}" />	
</form>

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

<!-- <button type="button" onclick="inactivateCheckboxes();">inactivateCheckboxes!</button> -->
<!-- <button type="button" onclick="activateCheckboxes();">activateCheckboxes!</button> -->
<!-- <button type="button" onclick="listener();">listener!</button> -->
<h1>BATTLE field</h1>

<div id="content"></div>
<div id="lockBlock"><h1>НЕ ТВОЙ ХОД</h1></div>
	
<input type="hidden" id="gameId" value="${param.game}"/>
<input type="hidden" id="current_user" value="${current_user.id}"/>

<h2>game id: ${param.game}</h2>


<table>
	<thead>
		<tr>
			<th>ENEMY (${enemy.login})</th>
			<th width="100px"></th>
			<th>YOUR (${current_user.login})</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table>
				<thead>
					<th></th>
					<c:forEach begin="1" end="10" varStatus="colH">
						<th>${colH.index}</th>
					</c:forEach>
				</thead>
				<tbody>
				<c:forEach begin="1" end="10" varStatus="row">
				  	<tr>				  		
				  		<c:forEach begin="1" end="10" varStatus="column">
				  			<c:if test="${column.index eq 1}">
								<td>&#${row.index+96};</td>
							</c:if>
							<td>
							<c:set var="contains" value="UNKNOWN" />
							<c:forEach items="${enemyUserListPositions}" var="pos">
								<c:if test="${((pos.y*10)+pos.x) eq ((row.index * 10) + column.index)}">
									<c:set var="contains" value="${pos.status}" />
								</c:if>
							</c:forEach>							
							<c:choose>
								<c:when test="${(contains eq 'UNKNOWN') or (contains eq 'FILL')}">
									<input type="checkbox" class="checkbox field-position " id="item-${row.index * 10 + column.index}" value="${row.index * 10 + column.index}"/>
									<label for="item-${row.index * 10 + column.index}"/>
								</c:when>
								<c:otherwise>
									<input type="checkbox" class="checkbox field-position ${contains}" checked id="item-${row.index * 10 + column.index}" value="${row.index * 10 + column.index}"/>
									<label for="item-${row.index * 10 + column.index}"/>								
								</c:otherwise>
							</c:choose>	
						</c:forEach>
					</tr>
				</c:forEach>
				</tbody>
				</table>					

			</td>
			<td></td>
			<td>
				<table>
				<thead>
					<th></th>
					<c:forEach begin="1" end="10" varStatus="colH">
						<th>${colH.index}</th>
					</c:forEach>
				</thead>
				<tbody>
				<c:forEach begin="1" end="10" varStatus="row">
				  	<tr>
				  		<c:forEach begin="1" end="10" varStatus="column">
				  			<c:if test="${column.index eq 1}">
								<td>&#${row.index+96};</td>
							</c:if>
							<td>
							<c:set var="contains" value="UNKNOWN" />
							<c:forEach items="${currentUserListPositions}" var="pos">
								<c:if test="${((pos.y*10)+pos.x) eq ((row.index * 10) + column.index)}">
									<c:set var="contains" value="${pos.status}" />
								</c:if>
							</c:forEach>							
								<c:choose>
									<c:when test="${contains eq 'UNKNOWN'}">
										<input type="checkbox" class="checkbox field-position " id="checkbox-item-${row.index * 10 + column.index}" />
										<label for="checkbox-item-${row.index * 10 + column.index}"/>
									</c:when>
									<c:otherwise>
										<input type="checkbox" class="checkbox field-position ${contains}" checked="checked" id="checkbox-item-${row.index * 10 + column.index}" />
										<label for="checkbox-item-${row.index * 10 + column.index}"/>						
									</c:otherwise>
								</c:choose>
			 				</td>
						</c:forEach>
					</tr>
				</c:forEach>
				</table>					
				</form>
			</td>
		</tr>
	</tbody>
</table>
<hr />

<!-- <div id="panel_enemy"> -->
<%-- 	<jsp:include page="/WEB-INF/views/battle/battleField2.jsp" />	 --%>
<!-- </div> -->
<!-- <div id="panel_you"> -->
<%-- 	<jsp:include page="/WEB-INF/views/battle/panel_my.jsp" />	 --%>
<!-- </div> -->
</body>
</html>