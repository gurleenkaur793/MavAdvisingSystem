<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>MavAdvisor</title>
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
		<div id="calendar"></div>
	</div>
	<!-- CONTENT ENDS HERE -->

	<jsp:include page="templates/footer.jsp" />
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			weekends: false,
			defaultView: 'agendaWeek',
			header: {
				left: 'prev,today,next',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2015-10-15',
			businessHours: {
				start: '07:00',
				end: '19:00'
			},
			eventLimit: true,
			height: 550,
			events: [
				{
					id: 999,
					title: 'Test Event',
					start: '2015-10-15T12:00:00',
					end: '2015-10-15T14:00:00'
				}
			]
		})
	});		
</script>
</html>