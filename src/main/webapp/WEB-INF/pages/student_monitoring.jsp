<%@page import="org.unibl.etf.faculty.dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="studentBean"
	type="org.unibl.etf.faculty.bean.StudentBean" scope="session" />
<jsp:useBean id="userBean" type="org.unibl.etf.faculty.bean.UserBean"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/style.css" type="text/css" rel="stylesheet">
<link href="styles/studentMonitoring.css" type="text/css"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Student monitoring</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="main-student-management-div">
		<h2 class="title-h2">Student monitoring</h2>

		<div class="student-cards-container column-div">
			<%
        for (StudentDTO s : studentBean.getAllStudentsForFaculty(userBean.getUser().getId())) {
        %>
			<div class="student-card">
				<div class="student-info">
					<h3><%=s.getFirstName()%>
						<%=s.getLastName()%></h3>
					<p>
						Index: <strong><%=s.getIndeks()%></strong>
					</p>
				</div>

				<div class="student-actions">
					<form action="Controller" method="POST">
						<input type="hidden" name="studentId" value="<%= s.getId() %>">

						<button type="submit" name="action" value="studentWorkentries"
							class="btn-work">Work entries</button>
						<button type="submit" name="action" value="studentEvaluations"
							class="btn-eval">Evaluations</button>
						<button type="submit" name="action" value="studentGrade"
							class="btn-grade">Grade</button>
					</form>
				</div>
			</div>
			<%
        }
        %>
		</div>
	</div>
</body>
</html>