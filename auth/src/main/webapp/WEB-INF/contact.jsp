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
<title>Contact Us</title>
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<!--===============================================================================================-->
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
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">

<link rel="stylesheet" href="/css/main1.css">
<link rel="stylesheet" href="/css/util.css">
<style type="text/css">


</style>


</head>
<body>
	<!-- Header section Start-->
	<header class="top">
		<nav id="navbar">
			<!-- container Start-->
			<div class="container">
				<!--Row Start-->
				<div class="row">
					<div class="col-lg-4 col-xs-9">
						<a href="/"><img id="logo" src="/images/image.png" alt="logo"></a>
					</div>
					<div class="col-lg-8 col-xs-12 text-left">
						<ul class="nav-links">
							<li><a class="nav-link" href="/">Home</a></li>
							<li><a class="nav-link" href="/#abouts"><button
										onmouseover="change(this)">About Us</button></a></li>
							<li><a class="nav-link" href="/#features"><button
										onmouseover="change(this)">Features</button></a></li>
							<c:if test="${flag!=false}">
								<li><a class="nav-linkss" href="/profile/${user}">Profile</a>
								</li>
							</c:if>
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
	<div class="contact1">
		<div class="container mt-5">


			<div class="container-contact1">
				<div class="contact1-pic js-tilt" data-tilt>
					<img src="images/new_image_corrected.png" alt="IMG">
				</div>
				<form class="contact1-form validate-form"
					action="${pageContext.request.contextPath}/contact" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <span class="contact1-form-title">
						Get in touch </span>

					<div class="wrap-input1 validate-input"
						data-validate="Name is required">
						<input class="input1" type="text" name="name" placeholder="Name">
						<span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input1" type="text" name="email" placeholder="Email">
						<span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
						data-validate="Subject is required">
						<input class="input1" type="text" name="subject"
							placeholder="Subject"> <span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
						data-validate="Message is required">
						<textarea class="input1" name="message" placeholder="Message"></textarea>
						<span class="shadow-input1"></span>
					</div>

					<div class="container-contact1-form-btn">
						<div>
							<c:if test="${not empty successMessage}">
								<div class="alert alert-success mt-3">${successMessage}</div>
							</c:if>
							<c:if test="${not empty errorMessage}">
								<div class="alert alert-danger mt-3">${errorMessage}</div>
							</c:if>
						</div>
						<button class="contact1-form-btn">
							<span> Send Email <i class="fa fa-long-arrow-right"
								aria-hidden="true"></i>
							</span>
						</button>
					</div>

				</form>

			</div>
		</div>
		<section class="Subscribe">
			<div class="container">
				<!-- Grid row-->
				<div class="row">
					<!-- Grid column -->
					<div class="col-lg-6 col-sm-6 col1">
						<div class="heading" data-aos="fade-right" data-aos-delay="300">
							<h5>Thanks for your feedback!!</h5>
							<h3>we'll get back to you soon.</h3>
						</div>
					</div>
					<c:if test="${flag==false}">
						<div class="col-lg-6 col-sm-6 col1">
							<form action="/registrationPage">
								<div class="input-group" data-aos="fade-left"
									data-aos-duration="800">
									<!-- <input name="email" id="email" type="email" placeholder="Enter your email id" required> -->
									<button class="btn btn-info" type="submit">Register</button>

								</div>

							</form>

						</div>
					</c:if>
					<c:if test="${flag!=false}">
						<div class="col-lg-6 col-sm-6 col1">
							<form action="/profile/${user}">
								<div class="input-group" data-aos="fade-left"
									data-aos-duration="800">
									<!-- <input name="email" id="email" type="email" placeholder="Enter your email id" required> -->
									<button class="btn btn-info" type="submit">Profile</button>

								</div>

							</form>

						</div>
					</c:if>

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
						<a href="index.html"><img id="logo1" src="images/image.png"
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

	</div>
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
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
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
	</script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script>
		</body>
		</html>
	