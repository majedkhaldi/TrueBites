<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/young.css">
<title>Feast</title>
<style>
.banner-home {
	height: auto;
	padding-top: 187px;
}

p {
	margin: 0;
	color: #969696;
	font-size: 15px;
	line-height: 10px;
	letter-spacing: 0.5px;
	text-align: left;
	font-weight: 400;
	margin-bottom: 200px;
}

.form-container {
	position: relative;
	display: inline-block;
}

.hover-arrow {
	position: absolute;
	left: -25px;
	top: 50%;
	transform: translateY(-50%);
	opacity: 0;
	transition: opacity 0.3s ease;
}

.button {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border: 1px solid #ccc;
	background-color: #f0f0f0;
	transition: background-color 0.3s ease;
	border-radius: 10px;
	width: 100px;
	background-color: yellow; 
}

.button:hover {
	background-color: #e0e0e0;
}

.button:hover+.hover-arrow {
	opacity: 1;
}
</style>
</head>
<body>

	<!-- Header section Start-->


	<nav id="navbar">
		<!-- container Start-->
		<div class="container">
			<!--Row Start-->
			<div class="row">

				<div class="col-lg-8 col-xs-3">

					<!-- Page Content -->
					<div id="page-content-wrapper">
						<span class="slide-menu" onclick="openNav()"></span>
					</div>

				</div>
			</div>
			<!--Row Ended-->
		</div>
		<!-- container Ended-->
	</nav>
	</header>
	<!-- Header section Ended-->

	<section class="banner-home"></section>
	<!-- Banner section End-->

	<!-- About Section Start -->
	<div id="about-us">
		<div class="container">

			<div class="row" style="margin-right: 0; margin-left: 0;">
				<div data-aos="fade-up" data-aos-duration="800">
					<img
						src="https://media.istockphoto.com/id/1046623026/photo/text-sign-showing-the-best-is-yet-to-come-be-patient-conceptual-photo-dont-lose-hope-light.jpg?s=612x612&w=0&k=20&c=sQ5kA9-ZRwE3o3e_8IsWu3G6G7zzDBVtqJUKaq2besw="
						alt="about-bg" class="thumbnail image">
					<h1>You're Not Ready Yet</h1>

					<p>We're excited about your interest in a balanced diet! At
						this time, we recommend focusing on healthy habits and listening
						to your body's needs. You're on the right path! Keep learning,
						growing, and when the time comes, we'll be here to help you create
						the perfect diet. Remember, eating a variety of foods, staying
						hydrated, and getting regular exercise are great ways to take care
						of your body. Your journey to a healthier lifestyle is just
						beginning. Take it one step at a time, and celebrate your progress
						along the way! Feel free to explore our resources on healthy
						eating, and don't hesitate to reach out if you have any questions
						or need support. Your health and well-being are important to us,
						and we believe in your ability to make positive choices for your
						future. Stay motivated, stay curious, and remember that every
						small effort counts towards a healthier you.</p>


				</div>
				<form action="/" class="form-container">
					<button type="submit" class="button">Home</button>
					<span class="hover-arrow">←</span>
				</form>
			</div>
		</div>
	</div>



	<!-- Footer -->

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- Custom JavaScript -->
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>