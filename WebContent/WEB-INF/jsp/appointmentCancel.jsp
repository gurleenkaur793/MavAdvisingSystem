<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.model.User"%>
<%@ page import="edu.uta.cse.group9.util.JSPMap"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<jsp:include page="templates/header.jsp" />
<head>

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

	<!-- CONTENT AREA -->
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<c:choose>
					<c:when test="${error != null}">
						<div class="alert alert-danger">${error}</div>
					</c:when>
					<c:when test="${success != null}">
						<div class="alert alert-success">${success}</div>
					</c:when>
				</c:choose>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">Cancel Appointment</div>
					<div class="panel-body">
						<form name="appointment_cancel" id="appointment_cancel"
							class="form-horizontal" role="form" method="post"
							action="<%=LinkMap.APPOINTMENT_CANCEL%>">

							<div class="form-group">
								<label class="col-sm-3 control-label">Reason</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="reason"
										id="reason">
								</div>
							</div>

							<button type="submit" class="btn btn-Primary col-md-offset-5">Cancel
								Appointment</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>