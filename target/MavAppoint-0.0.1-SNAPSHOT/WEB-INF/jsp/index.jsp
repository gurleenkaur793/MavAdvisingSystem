<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.model.User"%>
<%@ page import="edu.uta.cse.group9.util.JSPMap"%>
<head>
<title>MavAdvisor</title>
<jsp:include page="templates/header.jsp" />
</head>
<body>
	<c:choose>
		<c:when test="${user == null}">
			<jsp:include page="templates/navbar.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="${user.getHeader()}" />
		</c:otherwise>
	</c:choose>

	<!-- ALERT AREA -->
	<c:choose>
		<c:when test="${error != null}">
			<div class="alert alert-danger">${error}</div>
		</c:when>
		<c:when test="${success != null}">
			<div class="alert alert-success">${success}</div>
		</c:when>
	</c:choose>

	<!-- CONTENT AREA -->
	<div class="container">
		<c:choose>
			<c:when test="${user == null}">
				<jsp:include page="welcome.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="${user.getDashboard()}" />
			</c:otherwise>
		</c:choose>
	</div>
	<!-- END CONTENT AREA -->

	<jsp:include page="templates/footer.jsp" />

</body>
</html>