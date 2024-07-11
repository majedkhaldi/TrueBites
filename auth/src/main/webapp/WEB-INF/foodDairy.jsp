<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Dairy</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700" rel="stylesheet">
	       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
	       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
	       <link rel="stylesheet" type="text/css" href="/css/animate.css">
	       <link rel="stylesheet" type="text/css" href="/css/main.css">
	       <link rel="stylesheet" type="text/css" href="/css/diary.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/app.js"></script>
	<style>
	        body {
	           display: flex;
	           justify-content: center;
	           align-items: center;
	           height: 100vh;
	           background-color: #f7f7f7;
	           font-family: 'Montserrat', sans-serif;
	        }
	   </style>-->
</head>
<body>
	<body>

	    <header class="top">
	        <nav id="navbarr">
	          <!-- container Start-->
	          <div class="container">
	             <!--Row Start-->
	             <div class="row">
	                  <div class="col-lg-4 col-xs-9">
	                      <a href="index.html"><img id="logo" src="images/image.png" alt="logo"></a>
	                  </div>
	                  <div class="col-lg-8 col-xs-12 text-left">
	                      <ul class="nav-linkss">
	                          <li><a class="nav-linkss" href="#">Dashboard</a></li>
	                          <li><a class="nav-linkss" href="#">profile</a></li>
	                          <li><a class="nav-linkss" href="#">contact us</a></li>
	                      </ul>
	                  </div>
	              </div>
	             <!--Row Ended-->
	          </div>
	         <!-- container Ended-->
	      </nav>
	      
	      <script>
	        window.addEventListener('scroll', function() {
	            var navbar = document.getElementById('navbar');
	            if (window.scrollY > 50) { // Adjust the scroll value as needed
	                navbar.classList.add('show-nav-links');
	            } else {
	                navbar.classList.remove('show-nav-links');
	            }
	        });
	      </script>
	      </header>
	      <!-- Header section Ended-->

	      <div class="card">
	        <div class="meal-option">
	            <span>Breakfast</span>
	            <span class="plus-sign" data-target="#breakfast-search">+</span>
	        </div>
	        <div id="breakfast-search" class="search-bar">
	            <input type="text" class="form-control" placeholder="Search for breakfast options...">
	        </div>
	        <div class="meal-option">
	            <span>Lunch</span>
	            <span class="plus-sign" data-target="#lunch-search">+</span>
	        </div>
	        <div id="lunch-search" class="search-bar">
	            <input type="text" class="form-control" placeholder="Search for lunch options...">
	        </div>
	        <div class="meal-option">
	            <span>Dinner</span>
	            <span class="plus-sign" data-target="#dinner-search">+</span>
	        </div>
	        <div id="dinner-search" class="search-bar">
	            <input type="text" class="form-control" placeholder="Search for dinner options...">
	        </div>
	        <div class="meal-option">
	            <span>Snack</span>
	            <span class="plus-sign" data-target="#snack-search">+</span>
	        </div>
	        <div id="snack-search" class="search-bar">
	            <input type="text" class="form-control" placeholder="Search for snack options...">
	        </div>
	    </div>

	    <script>
	        document.querySelectorAll('.plus-sign').forEach(function(plusSign) {
	            plusSign.addEventListener('click', function() {
	                var target = document.querySelector(this.getAttribute('data-target'));
	                if (target.style.display === 'none' || target.style.display === '') {
	                    target.style.display = 'block';
	                } else {
	                    target.style.display = 'none';
	                }
	                var card = target.closest('.card');
	                card.style.height = 'auto'; // Reset the height to auto to accommodate content
	                card.offsetHeight; // Force reflow
	                card.style.height = card.scrollHeight + 'px'; // Set height to scroll height to animate
	            });
	        });
	    </script>
	</body>
   
</body>
</html>

