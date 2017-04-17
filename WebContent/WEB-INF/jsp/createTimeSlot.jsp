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
					<div class="panel-heading">Create Time Slot</div>
					<div class="panel-body">
						<form name="time_slot_create" id="time_slot_create"
							class="form-horizontal" role="form" method="post"
							action="<%=LinkMap.ADVISOR_CREATE_TIME_SLOT%>">

							<div class="form-group">
								<label class="col-sm-3 control-label">Start Date</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name="start_date" id="start_date" value="${startDate}"
										required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Start Time:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name=start_time id="start_time" value="${startTime}" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">End Time:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name=end_time id="end_time" required>
								</div>
							</div>

							<hr />

							<h4>Recurrence (optional)</h4>

							<div class="form-group">
								<label class="col-sm-3 control-label">End Date</label>
								<div class="col-sm-9">
									<input type="text" class="form-control datepicker"
										name="end_date" id="end_date">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-3">
									<span class="col-sm-2"> <input type="checkbox"
										name="mon" id="mon"> M
									</span> <span class="col-sm-2"> <input type="checkbox"
										name="tue" id="tue"> Tu
									</span> <span class="col-sm-2"> <input type="checkbox"
										name="wed" id="wed"> W
									</span> <span class="col-sm-2"> <input type="checkbox"
										name="thu" id="thu"> Th
									</span> <span class="col-sm-2"> <input type="checkbox"
										name="fri" id="fri"> F
									</span>
								</div>
							</div>
							<button type="submit" class="btn btn-Primary col-md-offset-5">Create
								Time Slot</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONTENT AREA -->
	<jsp:include page="templates/footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			$("#start_date").datetimepicker({
				format: 'MM/DD/YYYY'
			});
			$("#end_date").datetimepicker({
				format: 'MM/DD/YYYY'
			});
			$("#start_time").datetimepicker({
				pickDate: false
			});
			$("#end_time").datetimepicker({
				pickDate: false
			});
		});
	</script>
</body>
</html>
