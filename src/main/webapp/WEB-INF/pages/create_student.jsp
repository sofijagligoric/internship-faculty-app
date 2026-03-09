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
<link href="styles/companies.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Create student</title>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="main-new-company-div column-div">
	<a href="?action=students" class="back-arrow" style="margin: 15px 20px;"> &#8592; <span>Back</span></a>
		<%
		if (session.getAttribute("notification") != null && !session.getAttribute("notification").toString().isEmpty()){
		%>
		<div
			class="notification <%="success".equals(session.getAttribute("successStatus"))?"success":"error"%>">
			<%=session.getAttribute("notification")%>
		</div>
		<%
		}
		%>

		<div class="new-company-card">
			<h2 class="new-comp-header">Add new student</h2>
			<form class="column-div company-form" method="POST"
				action="?action=createStudent">

				<div class="column-div create-company-input-div">
					<label for="firstName"> First name:</label> <input type="text"
						name="firstName" id="firstName" required />
				</div>
				<div class="column-div create-company-input-div">
					<label for="lastName"> Last name:</label> <input type="text"
						name="lastName" id="lastName" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="usernameS"> Username:</label> <input type="text"
						name="usernameS" id="usernameS" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="passwordS"> Password:</label> <input type="text"
						name="passwordS" id="passwordS" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="indeks"> Index:</label> <input type="text"
						name="indeks" id="indeks" required />
				</div>

				<div class="column-div create-company-input-div">
					<label for="email"> Email:</label> <input type="email" name="email"
						id="email" required />
				</div>
				
				<input class="button-primary submit-button" type="submit"
					value="Create student" name="submit" />
			</form>
		</div>
	</div>

	<script>
    const notification = document.querySelector('.notification');
    if (notification) {
        setTimeout(() => {
            notification.style.transition = "opacity 0.5s ease";
            notification.style.opacity = "0";
            setTimeout(() => {
                notification.style.display = "none";
            }, 500);
        }, 5000);
    }
</script>
</body>
</html>