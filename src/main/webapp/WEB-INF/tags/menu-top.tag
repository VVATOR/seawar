<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>



<div class="menu-top">
<div>User: ${current_user.login} (${current_user.name})</div>
	<form action="CommandController" method="post">
		<input type="submit" name="action" value="LOGOUT" class="btn" />
	</form>
</div>