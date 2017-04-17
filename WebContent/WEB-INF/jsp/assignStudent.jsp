<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.uta.cse.group9.model.Advisor"%>
<%@ page import="edu.uta.cse.group9.util.JSPMap"%>
<%@ page import="edu.uta.cse.group9.util.LinkMap"%>
<jsp:include page="templates/header.jsp" />
<head>
<link rel="stylesheet" href="css/bootstrap-multiselect.css"
	type="text/css" />
<title>Assign Student</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#assignBtn").click(function(){
			var selectedChkBox = $("input:checkbox:checked");
			var setCheckStartFlag = false;
			var setInvalidFlag = false;
			var startElement, endElement;			
			var prevElement;
			var i = 0;
			for(;i<selectedChkBox.length;i++){
				if(!setCheckStartFlag)
				{
					setCheckStartFlag=true;
				}else{
					if(new String(selectedChkBox[i].value).charCodeAt(0) != new String(prevElement.value).charCodeAt(0) + 1){
						setInvalidFlag = true;
						break;
					}
				}
				prevElement = selectedChkBox[i];
			}
			
			if((i == selectedChkBox.length) && !setInvalidFlag){
				startElement = selectedChkBox[0].value;
				endElement = selectedChkBox[selectedChkBox.length-1].value;
				alert("Start Element "+startElement);
				alert("End Element "+endElement);
			}else{
				alert("Please check select continous students list");
			}
			
		$("#hdnStartElem").val(startElement);
		$("#hdnEndElem").val(endElement);
		$("#hdnAdvisorId").val($("input[type='radio']:checked").val());
		$("#hdnNoOfStudents").val(selectedChkBox.length);
		$("#hidden-form").submit();
		});
	});
</script>
</head>
<body>
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
			<div class="col-md-8">
				<div id="tree"></div>
				<div class="panel panel-default">
					<div class="panel-heading">Student List</div>
					<div class="panel-body" id="studentList">
						<c:forEach items="${students}" var="entry">
							<div class="checkbox">
								<label><input type="checkbox" value="${entry.key}">${entry.key}</label>
							</div>
						</c:forEach>
						<br> <br>
						<button class="btn btn-primary" type="button" id="assignBtn">Assign</button>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">Student List</div>
					<div class="panel-body" style="color: black">
						<c:forEach items="${advisors}" var="a">
							<input type="radio" value="${a.getId()}" name="advisor[]" />
									${a.getFirstName()}
									${a.getLastName()}
									<br>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form name="hidden-form" id="hidden-form" method="POST">
		<input type="hidden" id="hdnStartElem" name="hdnStartElem" /> <input
			type="hidden" id="hdnEndElem" name="hdnEndElem" /> <input
			type="hidden" id="hdnAdvisorId" name="hdnAdvisorId" /> <input
			type="hidden" id="hdnNoOfStudents" name="hdnNoOfStudents" />
	</form>
</body>
</html>