<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/infoForm.css">
</head>
<body>
	<div class="main">
		<input type="checkbox" id="chk" aria-hidden="true">

		<div class="signup">
			<form action='process' method='post'>
				<label for="chk" aria-hidden="true">Form for addtional info</label>
				<input type="number" name="first_name" placeholder="Height"
					required=""> <input type="number" name="last_name"
					placeholder="weigth" required=""> <input type="dropdown"
					name="email" placeholder="Gender" required=""> <input
					type="text" name="password" placeholder="Goal" required="">
				<input type="password" name="confirm_password"
					placeholder="Activity" required=""> <input type="password"
					name="confirm_password" placeholder="Age" required="">
				<button>Submit</button>
			</form>
		</div>
	</div>
</body>
</html>