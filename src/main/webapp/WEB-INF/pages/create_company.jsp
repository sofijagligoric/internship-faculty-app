<%@page import="org.unibl.etf.faculty.dto.CompanyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="companyBean"
	type="org.unibl.etf.faculty.bean.CompanyBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/style.css" type="text/css" rel="stylesheet">
<link href="styles/companies.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Create company</title>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="main-new-company-div">
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
			<h2 class="new-comp-header">Add new company</h2>
			<form class="column-div company-form" method="POST"
				action="?action=createCompany">

				<div class="column-div create-company-input-div">
					<label for="name"> Company name:</label> <input type="text"
						name="name" id="name" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="usernameC"> Username:</label> <input type="text"
						name="usernameC" id="usernameC" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="passwordC"> Password:</label> <input type="text"
						name="passwordC" id="passwordC" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="address"> Address:</label> <input type="text"
						name="address" id="address" required />
				</div>

				<div class="column-div create-company-input-div">
					<label for="email"> Email:</label> <input type="email" name="email"
						id="email" required />
				</div>
				<div class="row-div create-company-radio">
					<label> Active:</label> 
					<div class="row-div create-company-radio-div "> 
					 <input
						type="radio" name="isActive" id="active_yes" value="true" checked />
						<label for="active_yes">Yes</label></div>
					<div class="row-div create-company-radio-div ">
					<input type="radio"
						name="isActive" id="active_no" value="false" />
						<label for="active_no">No</label> 
						</div>
				</div>

				<input class="button-primary submit-button" type="submit"
					value="Create company" name="submit" />
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