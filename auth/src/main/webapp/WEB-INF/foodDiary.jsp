
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/diary.css">
    <title>Feast</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Montserrat', sans-serif;
            padding: 20px;
        }
        .top {
            margin-bottom: 20px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 1200px;
            margin-bottom: 20px;
            height: auto;
            margin-left: auto;
            margin-top: 150px;
        }
        .meal-option {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 18px;
        }
        .plus-sign {
            cursor: pointer;
            color: #007bff;
        }
        .search-bar {
            display: none;
            margin-bottom: 10px;
        }
        .calorie-counter, .macro-counter {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-bottom: 20px;
        }
        .calorie-counter canvas, .macro-counter canvas {
            max-width: 100%;
            margin: 0 auto;
        }
        .calorie-counter h2, .macro-counter h2 {
            color: #333333;
            margin: 10px 0;
            font-size: 36px;
            font-weight: 700;
        }
        .calorie-counter p, .macro-counter p {
            color: #666666;
            margin: 5px 0;
            font-size: 14px;
        }
        .macro-counter .macro-line {
            width: 100%;
            height: 15px;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .macro-protein { background-color: #de4b07; }
        .macro-fats { background-color: #666666; }
        .macro-carbs { background-color: #00b33c; }
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
                    <a href="index.html"><img id="logo" src="images/image.png" alt="logo"></a>
                </div>
                <div class="col-lg-8 col-xs-12 text-left">
                    <ul class="nav-linkss">
                        <li><a class="nav-linkss" href="#">Dashboard</a></li>
                        <li><a class="nav-linkss" href="#">Profile</a></li>
                        <li><a class="nav-linkss" href="#">Contact Us</a></li>
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

<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <div class="card-container">
                <div class="card">
                    <h3>Food Diary</h3>
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
            </div>
        </div>
        <div class="col-lg-3">
            <div class="calorie-counter">
                <canvas id="calorieChart" width="200" height="200"></canvas>
                <h2>896</h2>
                <p>Consumed (kcal) of 1600</p>
            </div>
            <div class="macro-counter">
                <p>Macronutrient Breakdown</p>
                <div class="macro-line macro-protein" style="width: 31%;"></div>
                <p>Protein: 31%</p>
                <div class="macro-line macro-fats" style="width: 26%;"></div>
                <p>Fats: 26%</p>
                <div class="macro-line macro-carbs" style="width: 43%;"></div>
                <p>Carbs: 43%</p>
            </div>
        </div>
    </div>
</div>

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

    const totalCalories = 1600;
    const consumedCalories = 1200;
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