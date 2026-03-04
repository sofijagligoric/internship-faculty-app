<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.unibl.etf.faculty.bean.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="styles/style.css" type="text/css" rel="stylesheet">
<link href="styles/login.css" type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
</head>
<body>

	<div class="main-div column-div">
		<%
		if (session.getAttribute("notification") != null && !session.getAttribute("notification").toString().isEmpty()){
		%>
		<div class="notification error">
			<%=session.getAttribute("notification")%>
		</div>
		<%
		}
		%>
		<form method="POST" action="?action=login"
			class="login-form column-div">
			<h1 class="login-title">Login</h1>
			<input type="text" name="username" required placeholder="Username" />
			<input type="password" name="password" required
				placeholder="Password" /> <input class="button-primary"
				type="submit" value="Login" name="submit" />

		</form>
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