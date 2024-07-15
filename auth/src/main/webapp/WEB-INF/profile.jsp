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
<link rel="stylesheet" type="text/css" href="/css/style.css">

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
	<link rel="stylesheet" href="/css/animate.css">
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
					<img id="logo" src="/images/image.png"
						alt="logo">
				</div>
				<div class="col-lg-8 col-xs-12 text-left">
					<ul class="nav-linkss">
						<li><a class="nav-linkss"
							href="/profile/${thisuser.id}/foodDiary"">food Diary</a></li>
						<li><a class="nav-linkss" href="#">Profile</a></li>
						<li><a class="nav-linkss" href="/generateMealPlans">Meals</a></li>
						<li><a class="nav-linkss" href="/contact">Contact Us</a></li>
						<li>
							<form id="logoutForm" method="POST" action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Logout!" />
							</form>
						</li>
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
									<a href="/profile/${thisuser.id}/edit"><button
											id="edit-profile" type="button" class="add-to-cart"
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
											<h6 class="text-muted f-w-400">${thisuser.activitylevel}</h6>
										</div>
										<hr>
										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Body Mass Index (BMI):</p>
											<h6 class="text-muted f-w-400">${thisuser.bmi}</h6>
										</div>
										<hr>
										<div class="col-sm-12">
											<p class="m-b-10 f-w-600">Daily Calorie Needs:</p>
											<h6 class="text-muted f-w-400">${thisuser.eer}</h6>
										</div>
										<hr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="Subscribe">
		<div class="container">
			<!-- Grid row-->
			<div class="row">
				<!-- Grid column -->
				<div class="col-lg-6 col-sm-6 col1">
					<div class="heading" data-aos="fade-right" data-aos-delay="300">
						<h5>Do You Have Any Questions?</h5>
						<h3>Feel Free To Contact Us</h3>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6 col1">
					<form action="/contact">
						<div class="input-group" data-aos="fade-left"
							data-aos-duration="800">
							<!-- <input name="email" id="email" type="email" placeholder="Enter your email id" required> -->
							<button class="btn btn-info" type="submit">Contact Us</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<footer class="page-footer font-small indigo">
		<div class="gradient"></div>
		<!-- Footer Links -->
		<div class="container">

			<!-- Grid row-->
			<div class="row text-center d-flex justify-content-center">

				<!-- Grid column -->
				<div class="col-md-12">
					<a href="index.html"><img id="logo1" src="/images/image.png"
						alt="footer-logo"></a>
				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row-->

			<!-- Grid row-->

			<!-- Grid row-->

			<!-- Grid row-->
			<div class="row pb-3"></div>
			<!-- Grid row-->

		</div>
		<div class="col-md-12 text-center">
			<div id="a" class="mb-5 flex-center">
				<!-- Facebook -->
				<a class="fb-ic"> <i class="fa fa-facebook-official mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Twitter -->
				<a class="tw-ic"> <i class="fa fa-twitter fa-lg mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Pinterest -->
				<a class="pin-ic"> <i class="fa fa-pinterest fa-lg mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- YouTube -->
				<a class="yt-ic"> <i class="fa fa-youtube mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Vimeo -->
				<a class="vim-ic"> <i class="fa fa-vimeo mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Google Plus -->
				<a class="gplus-ic"> <i class="fa fa-google-plus fa-lg mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Gmail -->
				<a class="gmail-ic" href="mailto:your-email@gmail.com"> <i
					class="fa fa-envelope fa-lg" aria-hidden="true"></i>
				</a>
			</div>
		</div>


	</footer>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
	<!-- Custom JavaScript -->
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script>
		$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			event.preventDefault();
			$(this).ekkoLightbox();
		});
	</script>
</body>
</html>
</body>
</html>
