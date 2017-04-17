<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<%@ page import="edu.uta.cse.group9.model.User"%>
<head>
<title>MavAppoint</title>
<jsp:include page="templates/header.jsp" />

<%-- FullCalendar includes --%>
<link rel='stylesheet' href='css/fullcalendar.min.css'>
<link rel='stylesheet' href='css/fullcalendar.print.css' media='print'>
<script type='text/javascript' src='js/fullcalendar.min.js'></script>
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
	<!-- CONTENT BEGINS HERE -->
	<div class="container">
		<jsp:include page="templates/alert.jsp" />
		<div id="calendar"></div>
	</div>
	<!-- CONTENT ENDS HERE -->
	<jsp:include page="templates/footer.jsp" />
</body>
<c:choose>
	<c:when test='${user.getClass().getSimpleName().equals("Advisor")}'>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#calendar').fullCalendar({
					weekends: false,
					timezone: 'local',
					defaultView: 'agendaWeek',
					header: {
						left: 'prev,today,next',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					businessHours: {
						start: '07:00',
						end: '19:00'
					},
					eventLimit: true,
					height: 550,
					eventSources: [
						{
							url: '<%=LinkMap.ASYNC_TIME_SLOTS%>',
							type: 'POST',
							data: {
								advisor_id: '${user.id}'
							},
							error: function(){
								console.log('Error retrieving time slots!');
							}
						},
						{
							url: '<%= LinkMap.ASYNC_APPOINTMENTS %>',
							type: 'POST',
							data: {
								user_id: '${user.id}'
							},
							error: function(){
								console.log("Error retrieving appointments.");
							}
						}
					],
					selectable: true,
					select: function(startDate, endDate, jsEvent, view) {
						window.location.assign('<%=LinkMap.ADVISOR_CREATE_TIME_SLOT%>?starttime=' + startDate);
					},
					eventClick: function(event, jsEvent, view) {
						console.log("Event clicked: " + event.id +  " with View: " + view.name);
						// functionality depends on the user
					}
				})
			});		
		</script>
	</c:when>
	<c:when test='${user.getClass().getSimpleName().equals("Student")}'>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#calendar').fullCalendar({
					weekends: false,
					timezone: 'local',
					defaultView: 'agendaWeek',
					header: {
						left: 'prev,today,next',
						center: 'title',
						right: 'month,agendaWeek,agendaDay'
					},
					businessHours: {
						start: '07:00',
						end: '19:00'
					},
					eventLimit: true,
					height: 550,
					eventSources: [
						{
							url: '<%=LinkMap.ASYNC_TIME_SLOTS%>',
							type: 'POST',
							data: {
								student_id: '${user.id}'
							},
							error: function(){
								console.log('Error retrieving time slots!');
							}
						},
						{
							url: '<%= LinkMap.ASYNC_APPOINTMENTS %>',
							type: 'POST',
							data: {
								user_id: '${user.id}'
							},
							error: function(){
								console.log("Error retrieving appointments.");
							}
						}
					],
					selectable: true,
					select: function(startDate, endDate, jsEvent, view) {
						window.location.assign('<%=LinkMap.STUDENT_CREATE_APPOINTMENT%>?starttime=' + startDate);
					},
					eventClick: function(event, jsEvent, view) {
						console.log("Event clicked: " + event.id +  " with View: " + view.name);
						// functionality depends on the user
					}
				})
			});		
		</script>
	</c:when>
</c:choose>
</html>