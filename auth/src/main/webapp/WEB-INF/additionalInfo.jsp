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

		<form action="/calculate/${user}" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <label for="chk" aria-hidden="true">Complete your Profile</label>
    <input type="number" name="height" placeholder="Height(cm)" required>
    <input type="number" name="weight" placeholder="Weight(kg)" required>
    <select name="gender" required>
        <option value="" disabled selected style="display: none;">Gender</option>
        <option value="m">Male</option>
        <option value="f">Female</option>
    </select>
    <select name="Goal" required>
        <option  disabled selected style="display: none;">Goal</option>
        <option value="0">Maintain</option>
        <option value="1">Lose</option>
        <option value="2">Gain</option>
    </select>
    <select name="activityLevel" required>
        <option value="1.2" disabled selected style="display: none;">Activity Level</option>
        <option value="1.2">Sedentary: little or no exercise</option>
        <option value="1.375">Lightly active: Exercise 1-3 times/week</option>
        <option value="1.46">Lightly to moderately active: Exercise 4-5 times/week</option>
        <option value="1.55">Moderately active: Daily exercise or intense exercise 3-4 times/week</option>
        <option value="1.725">Very active: Intense exercise 6-7 times/week</option>
    </select>
    <input type="number" name="age" placeholder="Age" required>
    <label id="note" for="chk" aria-hidden="true">Note: we need this information to create your account.</label>
    <button id="button" type="submit">Submit</button>
</form>

	</div>
	</div>
</body>
</html>