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
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/diary.css">
    <title>Food Diary</title>
    <style>
        .search-bar {
            width: 300px;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .search-bar input {
            width: 100%;
            padding: 10px;
            font-size: 17px;
            border: 1px solid #dcdcdc;
            border-radius: 5px;
            outline: none;
        }
        .search-results {
            margin-top: 10px;
        }
        .search-results div {
            padding: 5px 0;
        }
          li button{
        background-color: red; 
        color: white;
        border: none;
        border-radius: 5px;
         margin-left: 10px;
         box-shadow: 2px 2px 2px grey;
         width: 65px;
        }
    </style>
</head>
<body>

<header class="top">
    <nav id="navbarr">
        <!-- container Start-->
        <div class="container">
            <!--Row Start-->
            <div class="row">
                <div class="col-lg-4 col-xs-9">
                   <img id="logo" src="/images/image.png" alt="logo">
                </div>
                <div class="col-lg-8 col-xs-12 text-left">
                    <ul class="nav-linkss">
						<li><a class="nav-linkss" href="#">food Diary</a></li>
                        <li><a class="nav-linkss" href="/profile/${userId}">Profile</a></li>
						<li><a class="nav-linkss" href="/generateMealPlans">Meals</a></li>
                        <li><a class="nav-linkss" href="/contact">Contact Us</a></li>
						<li class="text-center">
						    <form style="margin-top:18px;" id="logoutForm" method="POST" action="/logout">
						        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						        <input type="submit" value="Logout!" class="btn-custom" />
						    </form>
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
<!-- Header section Ended-->

<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="card-container">
                <div class="card">
                    <h3>Food Diary</h3>
                    <form action="/searchBrinner/${userId}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="meal-option">
                            <span>Breakfast</span>
                            <span class="plus-sign" data-target="#breakfast-search">+</span>
                        </div>
                        <div id="breakfast-search" class="search-bar">
                            <input type="text" class="form-control" name="query" placeholder="Search for breakfast options...">
                            <input type="hidden" name="type" value="breakfast">
                            <button type="submit" class="btn btn-success">Search</button>
                            <div class="search-results" id="breakfast-results">
                                <c:if test="${type == 'breakfast'}">
                                    <c:forEach var="result" items="${results}">
                                        <form action="/addToDiary/${userId}/${result.id}" method="post">
											<input type="hidden" name="type" value="breakfast">

											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                            <div>${result.food} (${result.calories} kcal)</div>
											
                                            <button type="submit" class="btn btn-secondary">Add</button>
                                        </form>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </form>
					<div> 
						<ul>
						<c:forEach var="brinner" items="${joinedBrinner}">
							<form action="/removeFromDiary/${userId}/${brinner.id}" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

								<input type="hidden" name="_method" value="delete">
								<input type="hidden" name="type" value="breakfast">

								<li style="display:block;"><c:out value="${brinner.food}"/><button type="submit">Delete</button></li>
							</form>

						</c:forEach>
						</ul>
					</div>
                    
                    <form action="/searchBrinner/${userId}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="meal-option">
                            <span>Lunch</span>
                        </div>
                        <div id="lunch-search" class="search-bar">
                            <input type="text" class="form-control" name="query" placeholder="Search for lunch options...">
                            <input type="hidden" name="type" value="lunch">
                            <button type="submit" class="btn btn-success">Search</button>
                            <div class="search-results" id="lunch-results">
                                <c:if test="${type == 'lunch'}">
                                    <c:forEach var="result" items="${results}">
                                        <form action="/addToDiary/${userId}/${result.id}" method="post">
											<input type="hidden" name="type" value="lunch">

											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                            <div>${result.food} (${result.calories} kcal)</div>

                                            <button type="submit" class="btn btn-secondary">Add</button>
                                        </form>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </form>
					<div> 
						<ul>
						<c:forEach var="lunch" items="${joinedLunch}">
							<form action="/removeFromDiary/${userId}/${lunch.id}" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

								<input type="hidden" name="_method" value="delete">
								<input type="hidden" name="type" value="lunch">

								<li style="display:block;"><c:out value="${lunch.food}"/><button type="submit">Delete</button></li>
							</form>

						</c:forEach>
						</ul>
					</div>
                    
                    <form action="/searchBrinner/${userId}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="meal-option">
                            <span>Dinner</span>
                            <span class="plus-sign" data-target="#dinner-search">+</span>
                        </div>
                        <div id="dinner-search" class="search-bar">
                            <input type="text" class="form-control" name="query" placeholder="Search for dinner options...">
                            <input type="hidden" name="type" value="dinner">
                            <button type="submit" class="btn btn-success">Search</button>
                            <div class="search-results" id="dinner-results">
                                <c:if test="${type == 'dinner'}">
                                    <c:forEach var="result" items="${results}">
                                        <form action="/addToDiary/${userId}/${result.id}" method="post">
											<input type="hidden" name="type" value="dinner">

											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div>${result.food} (${result.calories} kcal)</div>
                                            <button type="submit" class="btn btn-secondary">Add</button>
                                        </form>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </form>
					<div> 
						<ul>
						<c:forEach var="brinner" items="${joinedBrinner}">
							<form action="/removeFromDiary/${userId}/${brinner.id}" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

								<input type="hidden" name="_method" value="delete">
								<input type="hidden" name="type" value="dinner">

								<li style="display:block;"><c:out value="${brinner.food}"/><button type="submit">Delete</button></li>
							</form>

						</c:forEach>
						</ul>
					</div>
                    
                    <form action="/searchBrinner/${userId}" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="meal-option">
                            <span>Snack</span>
                            <span class="plus-sign" data-target="#snack-search">+</span>
                        </div>
                        <div id="snack-search" class="search-bar">
                            <input type="text" class="form-control" name="query" placeholder="Search for snack options...">
                            <input type="hidden" name="type" value="snack">
                            <button type="submit" class="btn btn-success">Search</button>
                            <div class="search-results" id="snack-results">
                                <c:if test="${type == 'snack'}">
                                    <c:forEach var="result" items="${results}">
                                        <form action="/addToDiary/${userId}/${result.id}" method="post">
											<input type="hidden" name="type" value="snack">

											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div>${result.food} (${result.calories} kcal)</div>
                                            <button type="submit" class="btn btn-secondary">Add</button>
                                        </form>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </form>
					<div> 
					<ul>
					<c:forEach var="snack" items="${joinedSnack}">
						<form action="/removeFromDiary/${userId}/${snack.id}" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

							<input type="hidden" name="_method" value="delete">
							<input type="hidden" name="type" value="snack">

							<li style="display:block;"><c:out value="${snack.food}"/><button type="submit">Delete</button></li>
						</form>

					</c:forEach>
					</ul>
				</div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="calorie-counter">
                <canvas id="calorieChart" width="200" height="200"></canvas>
                <h2><c:out value="${caloriesIn}"/></h2>
                <p>Consumed (kcal) of <c:out value="${calories}"/></p>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

    const totalCalories =  <c:out value="${calories}"/>;
    const consumedCalories = <c:out value="${caloriesIn}"/>;
    const remainingCalories = totalCalories - consumedCalories;

    const data = {
        labels: [
            'Consumed',
            'Remaining'
        ],
        datasets: [{
            data: [consumedCalories, remainingCalories],
            backgroundColor: [
                '#de4b07',
                '#e0e0e0'
            ],
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
        options: {
            cutoutPercentage: 70,
            responsive: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            let label = context.label || '';
                            if (label) {
                                label += ': ';
                            }
                            label += context.raw;
                            return label + ' kcal';
                        }
                    }
                }
            }
        },
    };

    const calorieChart = new Chart(
        document.getElementById('calorieChart'),
        config
    );
</script>

</body>
</html>














