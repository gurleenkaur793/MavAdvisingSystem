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
			var postUrl = "<%=LinkMap.STUDENT_CREATE_ACCOUNT%>";
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
					<div class="panel-heading">Student Registration</div>
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
								<label class="col-sm-3 control-label">UTA StudentID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="Uta student id"
										id="Uta_Student_id" placeholder="Uta student id">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">NetID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="NetID" name="NetID"
										placeholder="NetID">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">UTA Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="email"
										name="email" placeholder="Email">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Password</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Password">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Confirm Password</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										id="confirmpassword" placeholder="Confirm Password">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label" for="major">Major</label>
								<div class="col-sm-9">
									<select id="major" name="major" class="form-control">
										<option value="1">--------Select--------</option>
										<option value="2">Computer Science</option>
										<option value="">Computer Engineering</option>
										<option value="">Mechanical Engineering</option>
										<option value="">Material Science</option>
										<option value="">Civil Engineering</option>
										<option value="">Electrical Engineering</option>
									</select>
								</div>
							</div>


							<button type="button" class="btn btn-Primary col-md-offset-5"
								id="btnSubmit">Create Advisor</button>
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