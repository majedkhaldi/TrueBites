<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">


<link rel="stylesheet" href="/css/diary.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/mealGenerator.css">
<title>Meals</title>
<style>
.card {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.card-body {
	overflow-y: auto;
}

.meal-gen-box {
	margin-bottom: 1rem;
}

.card .card-title {
	font-size: 1.25rem;
	font-weight: bold;
}

.card p {
	margin: 0;
}

strong {
	color: #de4b07;
}

.caloric-intake-card {
	background-color: white;
	border: 1px solid #dee2e6;
	border-radius: 0.50rem;
	box-shadow: 2px 2px 2px 2px whitesmoke;
	padding: 1rem;
	margin: 20px auto; /* Center the card with automatic margins */
	color: green;
	max-width: 300px; /* Set a maximum width */
	width: 90%; /* Responsive width */
	margin-bottom: -100px !important;
	margin-top: 200px;
}

.caloric-intake-card h3 {
	color: #de4b07;
	font-size: 1.5rem;
}

.circular-counter {
	fill: #de4b07; /* Use the strong element color */
}

.social-icons a {
	color: #4267B2; /* Default color for social media icons */
	margin-right: 15px;
	transition: color 0.3s;
}

.social-icons a:hover {
	color: #de4b07; /* Hover color for social media icons */
}
#logoutForm {
    display: flex;
    justify-content: center; /* Center horizontally */
    margin-top: 10px; /* Optional: Add some spacing */
	
    }
    .btn-custom {
		margin-top:10px;
    color: black; /* Adjust text color for contrast */
    border: none;
     /* Optional: remove border */
}
.btn-custom:hover {
    background-color: white;
    color: black;/* Adjust text color for contrast */
    border: none;
    margin-top: 8px
     /* Optional: remove border */
}

</style>
</head>
<body>
	<header  style="padding: 0px;" class="top">
		<nav id="navbarr">
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
								href="/profile/${user.id}/foodDiary">food Diary</a></li>
							<li><a class="nav-linkss" href="/profile/${user.id}">Profile</a></li>
							<li><a class="nav-linkss" href="#">Meals</a></li>
							<li><a class="nav-linkss" href="/contact">Contact Us</a></li>
							<li>
<li class="text-center">
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="submit" value="Logout!" class="btn-custom" />
    </form>
</li>
							</li>
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
				if (window.scrollY > 50) {
					navbar.classList.add('show-nav-links');
				} else {
					navbar.classList.remove('show-nav-links');
				}
			});
		</script>
	</header>

	

	<div class="row">
		<c:forEach var="plan" items="${mealPlans}" varStatus="status">
			<div class="col-md-4 mb-4">
				<div class="card meal-gen-box">
					<div class="card-header">
						<h1 style="color: #de4b07; font-size: 20px;">Meal Plan
							${status.index + 1}</h1>
					</div>
					<div class="card-body">
						<p class="card-text">
							<strong><i class="fa fa-coffee"></i> Breakfast:</strong>
							<c:forEach var="meal" items="${plan.breakfast}">${meal.food}<br />
							</c:forEach>
						</p>
						<p class="card-text">
							<strong><i class="fa fa-apple-alt"></i> Snack 1:</strong>
							<c:forEach var="meal" items="${plan.snack1}">${meal.food}<br />
							</c:forEach>
						</p>
						<p class="card-text">
							<strong><i class="fa fa-hamburger"></i> Lunch:</strong>
							<c:forEach var="meal" items="${plan.lunch}">${meal.food}<br />
							</c:forEach>
						</p>
						<p class="card-text">
							<strong><i class="fa fa-drumstick-bite"></i> Dinner:</strong>
							<c:forEach var="meal" items="${plan.dinner}">${meal.food}<br />
							</c:forEach>
						</p>
						<p class="card-text">
							<strong><i class="fa fa-cookie"></i> Snack 2:</strong>
							<c:forEach var="meal" items="${plan.snack2}">${meal.food}<br />
							</c:forEach>
						</p>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>




<section class="Subscribe">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-sm-6 col1">
                <div class="heading" data-aos="fade-right" data-aos-delay="300">
                    <h5>Do You Have Any Questions?</h5>
                    <h3>Feel Free To Contact Us</h3>
                </div>
            </div>
            <div class="col-lg-6 col-sm-6 col1">
                <form action="/contact">
                    <div class="input-group" data-aos="fade-left" data-aos-duration="800">
                        <input name="email" id="email" type="email" placeholder="Enter your email id" required class="form-control">
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">Contact Us</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


	<footer class="page-footer font-small indigo">
		<div class="gradient"></div>
		<div class="container">
			<div class="row text-center d-flex justify-content-center">
				<div class="col-md-12">
					<a href="index.html"><img id="logo1" src="images/image.png"
						alt="footer-logo"></a>
				</div>
			</div>
			<div class="row pb-3"></div>
		</div>
		<div class="col-md-12 text-center">
			<div id="a" class="mb-5 flex-center">
				<!-- Facebook -->
				<a class="fb-ic"> <i class="fab fa-facebook-f mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Twitter -->
				<a class="tw-ic"> <i class="fab fa-twitter mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Pinterest -->
				<a class="pin-ic"> <i class="fab fa-pinterest-p mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- YouTube -->
				<a class="yt-ic"> <i class="fab fa-youtube mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Vimeo -->
				<a class="vim-ic"> <i class="fab fa-vimeo-v mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Google Plus -->
				<a class="gplus-ic"> <i class="fab fa-google-plus-g mr-4"
					aria-hidden="true"></i>
				</a>
				<!-- Gmail -->
				<a class="gmail-ic" href="mailto:your-email@gmail.com"> <i
					class="fa fa-envelope fa-lg" aria-hidden="true"></i>
				</a>
			</div>
		</div>

	</footer>


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
