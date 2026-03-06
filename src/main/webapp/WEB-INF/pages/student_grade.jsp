<%@page import="org.unibl.etf.faculty.dto.ApplicationDTO"%>
<%@page import="org.unibl.etf.faculty.dto.GradeDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.unibl.etf.faculty.dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="gradeBean" type="org.unibl.etf.faculty.bean.GradeBean"
	scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Grades</title>
<link rel="stylesheet" href="styles/style.css">
<link href="styles/grade.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<%@include file="header.jsp"%>

	<div class="main-grades-div">
	<%
		if (session.getAttribute("notification") != null && !session.getAttribute("notification").toString().isEmpty()) {
		%>
		<div
			class="notification <%="success".equals(session.getAttribute("successStatus")) ? "success" : "error"%>">
			<%=session.getAttribute("notification")%>
		</div>
		<%
		}
		%>
		<%
        String studentIdRaw = request.getParameter("studentId");
        if (studentIdRaw != null) {
            int studentId = Integer.parseInt(studentIdRaw);
            List<ApplicationDTO> applications = gradeBean.getStudentAcceptedApplications(studentId);
            List<GradeDTO> grades = gradeBean.getAllGradesForStudent(studentId);
    %>
		<div class="row-div create-grade-button-div">
			<h2 class="title-h2">Student grades</h2>
		</div>
		<div class="table-container">

			<table>
				<thead>
					<tr>
						<th>Internship Name</th>
						<th>Grade</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<% for (ApplicationDTO app : applications) { 
                GradeDTO currentGrade = null;
                for(GradeDTO g : grades) {
                    if(g.getInternshipId().equals(app.getInternshipId())) {
                        currentGrade = g;
                        break;
                    }
                }
            %>
					<tr>
						<td><%= app.getInternshipName() %></td>
						<td><%= (currentGrade != null) ? currentGrade.getValue() : "Not graded" %></td>
						<td>
						<div class="action-buttons">
							<% if (currentGrade != null) { %> <a
							href="Controller?action=deleteGrade&gradeId=<%= currentGrade.getId() %>&studentId=<%= studentId %>"
							onclick="return confirm('Are you sure you want to delete this grade?')"
							class="pagination-link-enabled"
							style="max-width: none; background-color: #c42a1f;">Delete</a> <% } else { %>
							<button
								onclick="openModal(<%= app.getInternshipId() %>, <%= studentId %>)"
								 class="apply-btn" >Add Grade</button> <% } %>
								</div>
						</td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<% } %>
		</div>
	</div>

	<div id="gradeModal" class="grade-modal">
		<div class="grade-modal-content column-div">
			<h3>Enter Grade (5-10)</h3>
			<form action="Controller" method="get">
				<input type="hidden" name="action" value="addGrade"> <input
					type="hidden" name="studentId" id="modalStudentId"> <input
					type="hidden" name="internshipId" id="modalInternshipId"> <input
					type="number" name="gradeValue" min="5" max="10" required>
				<br>
				<br>
				<div class="action-buttons">
				<button type="submit" class="apply-btn">Save</button>
				<button type="button" class="apply-btn" onclick="closeModal()" style="background-color: #c42a1f;">Cancel</button>
				</div>
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

    function openModal(internshipId, studentId) {
        document.getElementById('modalInternshipId').value = internshipId;
        document.getElementById('modalStudentId').value = studentId;
        document.getElementById('gradeModal').style.display = "block";
    }
    function closeModal() {
        document.getElementById('gradeModal').style.display = "none";
    }
</script>

</body>
</html>