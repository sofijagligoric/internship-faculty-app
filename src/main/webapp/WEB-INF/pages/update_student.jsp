<%@page import="org.unibl.etf.faculty.dto.CreateStudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="studentBean" type="org.unibl.etf.faculty.bean.StudentBean" scope="session" />
<%
    CreateStudentDTO s = (CreateStudentDTO) request.getAttribute("studentToUpdate");
    String studentId = (String) request.getAttribute("currentStudentId");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <link href="styles/style.css" type="text/css" rel="stylesheet">
    <link href="styles/companies.css" type="text/css" rel="stylesheet">
</head>
<body>
    <%@include file="header.jsp"%>
    <div class="main-new-company-div">
    <% if (s != null) { %>
        <div class="new-company-card">
            <h2 class="new-comp-header">Update student: <%= s.getFirstName() %></h2>
            <form class="column-div company-form" method="POST" action="?action=updateStudent">
                
                <input type="hidden" name="studentId" value="<%= studentId %>" />

                <div class="column-div create-company-input-div">
                    <label>First name:</label> 
                    <input type="text" name="firstName" value="<%= s.getFirstName() %>" required />
                </div>
                <div class="column-div create-company-input-div">
                    <label>Last name:</label> 
                    <input type="text" name="lastName" value="<%= s.getLastName() %>" required />
                </div>
                
                <div class="column-div create-company-input-div">
					<label for="username"> Username:</label> <input type="text"
						name="username" id="username" value="<%= s.getUsername() %>" required />
				</div>
				
				<div class="column-div create-company-input-div">
					<label for="password"> Password:</label> <input type="text"
						name="password" id="password"  value="<%= s.getPassword() %>" />
				</div>
                <div class="column-div create-company-input-div">
                    <label>Index:</label> 
                    <input type="text" name="indeks" value="<%= s.getIndeks() %>" required />
                </div>
                <div class="column-div create-company-input-div">
                    <label>Email:</label> 
                    <input type="email" name="email" value="<%= s.getEmail() %>" required />
                </div>
                
                <input class="button-primary submit-button" type="submit" value="Save changes" name="submit" />
            </form>
        </div>
        <% } else { %>
                <h2 class="new-comp-header">Student not found!</h2>
            <% } %>
    </div>
</body>
</html>