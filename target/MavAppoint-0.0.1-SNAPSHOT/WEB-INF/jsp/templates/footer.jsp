<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="footer">
	CSE 5322 - Group 9 - Fall 2015<br /> Session:
	<%= session.getId() %><br />
	<c:if test="${user != null}">
		User: ${user.getFirstName()} ${user.getLastName()}
	</c:if>
</div>