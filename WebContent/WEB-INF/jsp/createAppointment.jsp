<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.model.User"%>
<%@ page import="edu.uta.cse.group9.util.JSPMap"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<jsp:include page="templates/header.jsp" />
<head>
<!-- DateTime Picker Files -->
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
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
		<jsp:include page="templates/alert.jsp" />
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">Create Appointment</div>
					<div class="panel-body">
						<form name="appointment_create" id="appointment_create"
							class="form-horizontal" role="form" method="post"
							action="<%=LinkMap.STUDENT_CREATE_APPOINTMENT%>">

							<!-- This needs to be dynamically retrieved from the Database -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="Advisor">Advisor</label>
								<div class="col-sm-9">
									<select id="advisor" name="advisor" class="form-control">
										<option value="">-------Select--------</option>
										<c:forEach items="${advisors}" var="adv">
											<option value="${adv.getId()}">${adv.getFirstName()}
												${adv.getLastName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<!-- This should be dynamically pulled from the database -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="Advsing Task">Advsing
									Task</label>
								<div class="col-sm-9">
									<select id="advising_task" name="advising_task"
										class="form-control">
										<option value="0">-------Select--------</option>
										<option value="1">Academic Suggestions</option>
										<option value="2">Course Selection</option>
										<option value="3">Swap Classes</option>
										<option value="4">Drop Classes</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Start Date/Time</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name="start_time" id="start_time" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">End Date/Time</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name="end_time" id="end_time" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Notes</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="student_notes"
										id="student_notes">
								</div>
							</div>

							<button type="submit" class="btn btn-Primary col-md-offset-5">Create
								Appointment</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT AREA -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#start_time").datetimepicker();
			$("#end_time").datetimepicker();
		});
	</script>
	<jsp:include page="templates/footer.jsp" />
</body>
</html>