<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.model.User"%>
<%@ page import="edu.uta.cse.group9.util.JSPMap"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<jsp:include page="templates/header.jsp" />
<head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnSubmit").click(function(){
			var postUrl = "<%=LinkMap.STUDENT_CREATE_APPOINTMENT%>";
			$.ajax({
				 type: "POST",
		         url: postUrl,
		         data: $("#user_create").serialize(), 
		         success: function(data)
		         {
		               alert(data);
		         }
			})
			return false;
		});	
	});
	
	</script>
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
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading">Create Appointment</div>
					<div class="panel-body">
						<form name="user_create" id="user_create" class="form-horizontal"
							role="form">

							<div class="form-group">
								<label class="col-sm-3 control-label">First Name</label>
								<div class="col-sm-9">
									<input name="firstname" type="text" class="form-control"
										id="firstname" placeholder="First Name">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Last Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="lastname"
										id="lastname" placeholder="Last Name">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Advisor Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="advisorname"
										name="advisorname" placeholder="Advisor Name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">UTA ID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="utaid" name="utaid"
										placeholder="UTA ID">
								</div>
							</div>



							<div class="form-group">
								<label class="col-sm-3 control-label" for="Advsing Task">Advsing
									Task</label> <select id="AdvisingTask" name="AdvisingTAsk"
									class="form-control">
									<option value="1">-------Select--------</option>
									<option value="2">Academic Suggestions</option>
									<option value="">Course Selection</option>
									<option value="">Swap Classes</option>
									<option value="">Drop Classes</option>

								</select>
							</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">Date</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="date"
								placeholder="Date">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Time</label>
						<div class="col-sm-9">
							<input type="time" class="form-control" id="time"
								placeholder="Time">
						</div>
					</div>




					<button type="button" class="btn btn-Primary col-md-offset-5"
						id="btnSubmit">Create Appointment</button>
					</form>
				</div>
			</div>
		</div>


	</div>
	</div>
	<!-- END CONTENT AREA -->

	<jsp:include page="templates/footer.jsp" />
</body>
</html>