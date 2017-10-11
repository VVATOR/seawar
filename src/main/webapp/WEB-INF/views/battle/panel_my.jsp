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
div#lock {
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
#lockBlock{
	display:none;
}
</style>
</head>
<body>

Enemy
<table>
	<thead>
		<tr>
			<th>YOUR</th>
		</tr>
	</thead>
	<tbody>
		<tr>			
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

			</td>
		</tr>
	</tbody>
</table>

</body>
</html>