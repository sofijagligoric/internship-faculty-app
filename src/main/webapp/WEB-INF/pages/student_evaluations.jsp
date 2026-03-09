<%@page import="org.unibl.etf.faculty.dto.EvaluationDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.unibl.etf.faculty.dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="studentBean"
	type="org.unibl.etf.faculty.bean.StudentBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/style.css" type="text/css" rel="stylesheet">
<link href="styles/workentry.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Evaluations</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="workentry-main column-div">
	<a href="?action=studentsMonitoring" class="back-arrow" > &#8592; <span>Back</span></a>
		<%
		List<EvaluationDTO> evaluations = (List<EvaluationDTO>) request.getAttribute("evaluations");

		if (evaluations == null || evaluations.isEmpty()) {
		%>
		<p>No evaluations found for this student.</p>
		<%
		} else {
		%>
		<div class="we-cards-container">
			<%
			for (EvaluationDTO evaluation : evaluations) {
			%>
			<div class="we-card">
				<h3>
					<%=evaluation.getCompanyName()%></h3>
				<p>
					<strong>Internship:</strong>
					<%=evaluation.getInternshipName()%></p>
				<p>
				<strong>Description:</strong>
					<%=evaluation.getDescription()%></p>
			</div>
			<%
			}
			%>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>