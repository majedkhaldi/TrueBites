<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/infoForm.css">
<style>
.error {
	text-align: center;
	color: red;
}
</style>
</head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
<link rel="stylesheet" href="css/infoForm.css">
</head>
<body>
	<div class="main">
		<form:form action="/calculate/${thisuser.id}" method="post"
			modelAttribute="thisuser">
			<label for="chk" aria-hidden="true">Update your Profile</label>
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<p>

				<form:errors path="username" />
				<form:input path="username" placeholder="User Name" />
			</p>
			<p>

				<form:errors path="email" />
				<form:input path="email" placeholder="Email" />
			</p>

			<p>

				<input name="weight" placeholder="Weight" />
			</p>
			<p>

				<input type="number" name="height" placeholder="height" />
			</p>
			<p>
				<input type="number" name="age" placeholder="Age" required>
			</p>
			<p>
			<p>

				<select name="goal">
					<option id="o" value="0">Maintain</option>
					<option id="o" value="1">Lose</option>
					<option id="o" value="2">Gain</option>
				</select>
			</p>
			<p>

				<select name="activity">

					<option id="o" value="1.2">Sedentary: little or no
						exercise</option>
					<option id="o" value="1.375">Lightly active: Exercise 1-3
						times/week</option>
					<option id="o" value="1.46">Lightly to moderately active:
						Exercise 4-5 times/week</option>
					<option id="o" value="1.55">Moderately active: Daily
						exercise or intense exercise 3-4 times/week</option>
					<option id="o" value="1.725">Very active: Intense exercise
						6-7 times/week</option>
					<select>
			</p>



			<input id="buttons" type="submit" value="Edit Profile" />

		</form:form>
	</div>



</body>
</html>