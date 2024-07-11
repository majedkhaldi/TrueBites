<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="/css/infoForm.css">
</head>
<body>
	<div>
		<div class="main">
			<p>
				<form:errors path="user.*" />
			</p>

			<form:form method="POST" action="/register" modelAttribute="user">
				<label for="chk" aria-hidden="true">Sign up</label>
				<p>
					
					<form:input path="username" placeholder="User Name" />
					
				</p>

				<p>
					
					<form:password path="password" placeholder="Password" />
				</p>
				<p>
					<form:password path="passwordConfirmation" placeholder="Confirm Password" />
				</p>
				<input type="submit" value="Sign Up!" />
			</form:form>
		</div>
	</div>
</body>
</html>
