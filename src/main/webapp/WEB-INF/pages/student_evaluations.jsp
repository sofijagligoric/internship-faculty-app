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
    <%
    String studentIdRaw = request.getParameter("studentId");
    
    if (studentIdRaw != null) {
        try {
            int id = Integer.parseInt(studentIdRaw);
            List<EvaluationDTO> evaluations = studentBean.getAllEvaluationsForStudent(id);
            
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
                        <h3> <%=evaluation.getCompanyName()%></h3>
                        <p><strong>Internship:</strong> <%=evaluation.getInternshipName()%></p>
                         <p> <%=evaluation.getDescription()%></p>
                    </div>
                    <%
                    }
                    %>
                </div>
            <%
            }
        } catch (NumberFormatException e) {
            out.println("<p>Invalid Student ID format.</p>");
        }
    } else {
    %>
        <p>Error: No student selected.</p>
    <%
    }
    %>
</div>
</body>
</html>