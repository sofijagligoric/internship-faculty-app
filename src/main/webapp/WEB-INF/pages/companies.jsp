<%@page import="org.unibl.etf.faculty.dto.CompanyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="companyBean" type="org.unibl.etf.faculty.bean.CompanyBean" scope="session"/>
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
<div class="main-companies-div">
		<%
		if (session.getAttribute("notification") != null){
		%>
		<div class="notification <%="success".equals(session.getAttribute("successStatus"))?"success":"error"%>">
				<%=session.getAttribute("notification")%>
		</div>
		<%
		}
		%>
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
						<td><%=comp.getActive()?"yes":"no"%></td>
						<td>
							<div class="action-buttons">
								<form method="POST" style="display: inline;"
									action="?action=changeStatus">
									<input type="hidden" id="compId" name="compId" value="<%=comp.getId()%>">
									<button type="submit" class="apply-btn">Change status</button>
								</form>

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