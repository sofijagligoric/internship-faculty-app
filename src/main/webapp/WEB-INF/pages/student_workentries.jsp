<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="org.unibl.etf.faculty.dto.StudentDTO"%>
<%@page import="org.unibl.etf.faculty.dto.WorkentryDTO"%>
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
<title>Work entries</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="workentry-main column-div">
		<%
            List<WorkentryDTO> entries = (List<WorkentryDTO>) request.getAttribute("workEntries");
            
            if (entries == null || entries.isEmpty()) {
        %>
		<p>No entries found for this student.</p>
		<%
            } else {
            %>
		<div class="we-cards-container">
			<%
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy.");
                    for (WorkentryDTO entry : entries) {
                    %>
			<div class="we-card">
				<h3>
					<%=entry.getInternshipName()%></h3>
				<p>
					<strong>Week start:</strong>
					<%=entry.getWeekStart() != null ? entry.getWeekStart().format(formatter) : "/"%></p>
				<p><%=entry.getActivity()%></p>
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