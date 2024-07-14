<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Meal Plans</title>
</head>
<body>
    <h1>Generated Meal Plans</h1>
    <c:forEach var="plan" items="${mealPlans}">
    
        <h2>Meal Plan</h2>
        
        <p>Breakfast: <c:forEach var="meal" items="${plan.breakfast}">${meal.food}</c:forEach></p>
        <p>Snack 1: <c:forEach var="meal" items="${plan.snack1}"> ${meal.food}</c:forEach></p>
        <p>Lunch: <c:forEach var="meal" items="${plan.lunch}">${meal.food}</c:forEach></p>
        <p>Snack 2: <c:forEach var="meal" items="${plan.snack2}"> ${meal.food}</c:forEach></p>
        <p>Dinner:<c:forEach var="meal" items="${plan.dinner}"> ${meal.food}</c:forEach></p>
    </c:forEach>
</body>
</html>
