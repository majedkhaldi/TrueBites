<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ page isErrorPage="true" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User Profile</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>

	<h1>Edit Profile</h1>
	<form:form action="/profile/${id}" method="post" modelAttribute="thisuser">
	    <input type="hidden" name="_method" value="put">
	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    
	    <h2>Update your Profile</h2>
	    
	    <div>
	        <form:label path="username">User Name:</form:label>
	        <form:errors path="username"/>
	        <form:input path="username"/>
	    </div>
	    <div>
	        <form:label path="email">Email:</form:label>
	        <form:errors path="email"/>
	        <form:textarea path="email"/>
	    </div>
	    <div>
	        <form:label path="weight">Weight:</form:label>
	        <form:errors path="weight"/>
	        <form:input path="weight"/>      
	    </div>
	    <div>
	        <form:label path="goal">Health Goal:</form:label>    
	        <form:errors path="goal"/>
	        <form:input path="goal"/>
	    </div>
	
	    <div>
	        <form:label path="activityLevel">Activity Level:</form:label>    
	        <form:errors path="activityLevel"/>
	        <form:input path="activityLevel"/>  
	    </div> 
	    <div>
	        <form:label path="bmi">Body Mass Index (BMI):</form:label>    
	        <form:errors path="bmi"/>
	        <form:input path="bmi"/>
	    </div>
	    <div>
	        <form:label path="eer">Daily Calories Needs:</form:label>    
	        <form:errors path="eer"/>
	        <form:input path="eer"/>
	    </div>
	    
	    
	    <input type="submit" value="Edit Profile"/>
	    
	</form:form> 
	
</body>
</html>