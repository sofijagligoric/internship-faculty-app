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
<link href="styles/companies.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Students</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="main-companies-div">
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
		<div class="row-div create-comp-button-div">
			<h2 class="title-h2">Student management</h2>
			<div class="action-buttons" style="width: auto;">
				<button onclick="openModal()" class="apply-btn">Load from
					file</button>
				<a href="?action=createStudent" class="pagination-link-enabled"
					style="max-width: none;">New student</a>
			</div>
		</div>
		<div class="table-container">
			<table>

				<thead>
					<tr>
						<th>First name</th>
						<th>Last name</th>
						<th>Index</th>
						<th>Email</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<%
					for (StudentDTO s : studentBean.getAllStudentsForFaculty(userBean.getUser().getId())) {
					%>
					<tr>
						<td><%=s.getFirstName()%></td>
						<td><%=s.getLastName()%></td>
						<td><%=s.getIndeks()%></td>
						<td><%=s.getEmail()%></td>
						<td>
							<div class="action-buttons">
								<a href="?action=updateStudent&studentId=<%=s.getId()%>"
									class="pagination-link-enabled"
									style="max-width: none; background-color: #327fba;">Update</a>
								<a href="?action=deleteStudent&studentId=<%=s.getId()%>"
									class="pagination-link-enabled"
									style="max-width: none; background-color: #c42a1f;"
									onclick="return confirm('Are you sure you want to delete student: <%=s.getFirstName()%> <%=s.getLastName()%>?');">
									Delete </a>
							</div>
						</td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div id="fileModal" class="file-modal">
		<div class="file-modal-content column-div">
			<h3>Load data from CSV file</h3>
			<form method="POST" action="?action=uploadStudentsCsv"
				enctype="multipart/form-data" class="column-div file-form">

				<label>File:</label> <input type="file" name="file" accept=".csv"
					required />

				<div class="action-buttons">
					<button type="submit" class="apply-btn">Upload</button>
					<button type="button" class="apply-btn" onclick="closeModal()"
						style="background-color: #c42a1f;">Cancel</button>
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
    
    function openModal() {
        document.getElementById('fileModal').style.display = "block";
    }
    function closeModal() {
        document.getElementById('fileModal').style.display = "none";
    }
</script>
</body>
</html>