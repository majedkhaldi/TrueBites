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
        <p>Breakfast: ${plan.breakfast}</p>
        <p>Snack 1: ${plan.snack1}</p>
        <p>Lunch: ${plan.lunch}</p>
        <p>Snack 2: ${plan.snack2}</p>
        <p>Dinner: ${plan.dinner}</p>
    </c:forEach>
</body>
</html>
