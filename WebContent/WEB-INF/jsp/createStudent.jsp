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
		<jsp:include page="templates/alert.jsp" />
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading">Student Registration</div>
					<div class="panel-body">
						<form name="user_create" id="user_create" class="form-horizontal"
							method="post" action="<%=LinkMap.STUDENT_CREATE_ACCOUNT%>"
							role="form">

							<div class="form-group">
								<label class="col-sm-3 control-label">First Name</label>
								<div class="col-sm-9">
									<input name="firstname" type="text" class="form-control"
										id="firstname" placeholder="First Name" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Last Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="lastname"
										id="lastname" placeholder="Last Name" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">UTA ID</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="uta_id"
										id="uta_id" placeholder="1001000000" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">UTA Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="email"
										name="email" placeholder="first.last@mavs.uta.edu" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Username
									(optional)</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="Username">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Password</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="Password" required>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label">Confirm Password</label>
								<div class="col-sm-9">
									<input type="password" class="form-control"
										id="confirm_password" name="confirm_password"
										placeholder="Confirm Password" required>
								</div>
							</div>

							<!-- Remove this since a) it should be retrieved from the database and b) it isn't used 
							<div class="form-group">
								<label class="col-sm-3 control-label" for="major">Major</label>
								<div class="col-sm-9">
									<select id="major" name="major" class="form-control">
     									 <option value="">--------Select--------</option>
     									 <option value="0">Computer Science</option>
     									 <option value="1">Computer Engineering</option>
      									 <option value="2">Mechanical Engineering</option>
      									 <option value="3">Material Science</option>
      									 <option value="4">Civil Engineering</option>
    								     <option value="5">Electrical Engineering</option>
   									 </select>
								</div>
							</div> -->

							<!-- These should be generated dynamically -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="student_type">Student
									Type</label>
								<div class="col-sm-9">
									<select id="student_type" name="student_type"
										class="form-control" required>
										<option value="">--------Select--------</option>
										<option value="0">Undergraduate</option>
										<option value="1">Graduate</option>
										<option value="2">Doctorate</option>
									</select>
								</div>
							</div>

							<!-- These should be generated dynamically -->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="EnrollmentType">Enrollment
									Type</label>
								<div class="col-sm-9">
									<select id="enrollment_type" name="enrollment_type"
										class="form-control" required>
										<option value="">--------Select--------</option>
										<option value="0">Prospective</option>
										<option value="1">Current</option>
										<option value="2">Alumni</option>
									</select>
								</div>
							</div>

							<button type="submit" class="btn btn-Primary col-md-offset-5">Create
								Student</button>
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