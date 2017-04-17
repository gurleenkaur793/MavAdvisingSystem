<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<h1>Admin Dashboard</h1>
		<h5>Advisors</h5>
		<div class="panel panel-default">
			<table class="table blacktable">
				<thead>
					<tr>
						<th>ID</th>
						<th>First</th>
						<th>Last</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${advisors}" var="a">
						<tr>
							<td>${a.getId()}</td>
							<td>${a.getFirstName()}</td>
							<td>${a.getLastName()}</td>
							<td>${a.getEmail()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>