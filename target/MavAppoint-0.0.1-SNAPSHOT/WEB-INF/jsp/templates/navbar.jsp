<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<div class="container">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div id="inversenavbar" class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=LinkMap.HOME%>"> <b>MavAdvisor</b>
				</a>
			</div>

			<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=LinkMap.STUDENT_CREATE_ACCOUNT%>">Register
							Student</a></li>
					<form class="navbar-form navbar-right" role="form" method="post"
						action="<%=LinkMap.LOG_IN%>">
						<div class="form-group">
							<label class="sr-only" for="username">Username: </label> <input
								type="test" class="form-control" id="username" name="username"
								placeholder="Username">
						</div>
						<div class="form-group">
							<label class="sr-only" for="password">Password: </label> <input
								type="password" class="form-control" id="password"
								name="password" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-default">Login</button>
					</form>

				</ul>
			</div>
		</div>
	</nav>
</div>