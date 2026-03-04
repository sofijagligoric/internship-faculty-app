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
<title>Companies</title>
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
			<h2 class="title-h2">Company management</h2>
			<a href="?action=createCompany" class="pagination-link-enabled"
				style="max-width: none;">New company</a>
		</div>
		<div class="table-container">
			<table>

				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Address</th>
						<th>Active</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<%
					for (CompanyDTO comp : companyBean.getAllCompanies()) {
					%>
					<tr>
						<td><%=comp.getName()%></td>
						<td><%=comp.getEmail()%></td>
						<td><%=comp.getAddress()%></td>
						<td> <%=comp.getActive()?"active":"deactivated" %></td>
						<td>
							<div class="action-buttons">
								<%-- <form method="POST" style="display: inline;"
									action="?action=changeStatus">
									<input type="hidden" id="compId" name="compId"
										value="<%=comp.getId()%>">
									<button type="submit" class="apply-btn">Change status</button>
								</form> --%>
								<a href="?action=changeStatus&compId=<%=comp.getId()%>"
									class="pagination-link-enabled"
									style="max-width: none; background-color: <%= comp.getActive() ? "#c42a1f" : "#28a745" %>;"
									onclick="return confirm('Are you sure you want to change status for <%=comp.getName()%>?');">
									Change status </a>
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