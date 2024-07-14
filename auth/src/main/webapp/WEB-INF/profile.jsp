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
<title>Profile</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<!--  -->
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/normalize.css">
<link rel="stylesheet" href="/css/vendor.css">
<link rel="stylesheet" href="/css/style1.css">
<link rel="stylesheet" href="/css/profile.css">
<link rel="stylesheet" href="/css/diary.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css">
<!-- <link rel="stylesheet" href="./css/style.css"> -->



</head>
<body>




	<nav id="navbarrr">
		<!-- container Start-->
		<div class="container">
			<!--Row Start-->
			<div class="row">
				<div class="col-lg-4 col-xs-9">
					<a href="index.html"><img id="logo" src="images/image.png"
						alt="logo"></a>
				</div>
				<div class="col-lg-8 col-xs-12 text-left">
					<ul class="nav-linkss">
						<li><a class="nav-linkss" href="#">food Diary</a></li>
						<li><a class="nav-linkss" href="#">Profile</a></li>
						<li><a class="nav-linkss" href="#">Meals</a></li>
						<li><a class="nav-linkss" href="#">Contact Us</a></li>
						<li>
							<form id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Logout!" />
							</form></li>
					</ul>
				</div>
			</div>
			<!--Row Ended-->
		</div>
		<!-- container Ended-->
	</nav>


	<div class="page-content page-container" id="page-content">
		<div class="padding">
			<div class="row container d-flex justify-content-center">
				<div class="col-xl-12 col-md-12 ">
					<div id="profile-card" class="card user-card-full">
						<div class="row m-l-0 m-r-0">
							<div class="col-sm-4 bg-c-lite-green user-profile">
								<div class="card-block text-center text-white">
									<div class="m-b-25">
										<img src="/images/blank-profile-picture-973460_960_720.webp"
											class="img-radius" alt="User-Profile-Image">
									</div>

									<h6 class="f-w-600">
										<c:out value="${thisuser.username}" />
									</h6>
									<a href="/user/edit"><button id="edit-profile"
											type="button" class="add-to-cart"
											data-product-tile="add-to-cart">Edit Profile</button></a>
								</div>

							</div>
							<div class="col-sm-8">
								<div class="card-block">
									<h6 class="m-b-20 p-b-5 b-b-default f-w-600">Your
										Information</h6>
									<div class="row">
										<div class="col-sm-12">

											<p class="m-b-10 f-w-600">User Name:</p>

											<h6 class="text-muted f-w-400">
												<c:out value="${thisuser.username}" />
											</h6>

										</div>
										<hr>

										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Email:</p>
											<h6 class="text-muted f-w-400">${thisuser.email}</h6>
										</div>
										<hr>
										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Weight:</p>
											<h6 class="text-muted f-w-400">${thisuser.weight}</h6>
										</div>
										<hr>

										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Height:</p>
											<h6 class="text-muted f-w-400">${thisuser.height}</h6>
										</div>
										<hr>

										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Health Goal:</p>
											<h6 class="text-muted f-w-400">${thisuser.goal}</h6>
										</div>
										<hr>

										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Activity Level:</p>
											<h6 class="text-muted f-w-400">${thisuser.activityLevel}</h6>
										</div>
										<hr>
										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Body Mass Index (BMI):</p>
											<h6 class="text-muted f-w-400">${bmi}</h6>
										</div>
										<hr>
										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Daily Calories Needs:</p>
											<h6 class="text-muted f-w-400">${thisuser.eer}</h6>
										</div>
										<hr>
</body>
</html>
