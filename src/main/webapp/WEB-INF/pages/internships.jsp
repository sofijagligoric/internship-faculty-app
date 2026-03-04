<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="org.unibl.etf.faculty.dto.InternshipDTO"%>
<%@page import="org.unibl.etf.faculty.dto.CompanyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="internshipBean"
	type="org.unibl.etf.faculty.bean.InternshipBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/style.css" type="text/css" rel="stylesheet">
<link href="styles/internships.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Internships</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="column-div main-internships-div">
	<div class="title-div">  <h2 class="title-h2">Available internships</h2></div>
		<div class="cards-container">
			<%
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy.");
			for (InternshipDTO internship : internshipBean.getAllInternships()) {
			%>
			<div class="internship-card">
				<div class="card-header">
					<h3><%=internship.getName()%></h3>
				</div>

				<div class="card-body">
					<p>
						<strong>Company:</strong>
						<%=internship.getCompanyName()%></p>
					<p>
						<strong>Start:</strong>
						<%=internship.getStartDate() != null ? internship.getStartDate().format(formatter) : "/"%>
					</p>

					<p>
						<strong>End:</strong>
						<%=internship.getEndDate() != null ? internship.getEndDate().format(formatter) : "/"%>
					</p>

					<p>
						<strong>About:</strong>
						<%=internship.getAbout()%></p>
					<p>
						<strong>Technologies:</strong>
						<%=internship.getTechnologies()%></p>
					<p>
						<strong>Skills:</strong>
						<%=internship.getSkills()%></p>
					<p>
						<strong>Requirements:</strong>
						<%=internship.getRequirements()%></p>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>