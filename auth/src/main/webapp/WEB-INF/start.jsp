
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!doctype html>
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
    <title>Feast</title>
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
                <a href="index.html"><img id="logo" src="/images/image.png" alt="logo"></a>
            </div>
            <div class="col-lg-8 col-xs-12 text-left">
                <ul class="nav-links">
                    <li><a class="nav-link" href="#">Contact Us</a></li>
                    <li><a class="nav-link" href="#">About Us</a></li>
                    <li><a class="nav-link" href="#">Features</a></li>
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

<section class="banner-home">
<!-- Banner section Start-->
  <div class="container">
     <!--Row Start-->
      <div class="row">
          <div class="col-sm-12">
          <h1 data-aos="fade-left" data-aos-delay="300">Welcome to TrueBites.</h1><br>
          <h2 data-aos="fade-left" data-aos-delay="500">Truth in Every Bite.</h2>
          <h4 data-aos="fade-left" data-aos-delay="700">Discover a healthier version of yourself with TrueBites <span> where science-driven eating meets personalized nutrition for a smarter, happier lifestyle.</span></h4>
          <p data-aos="fade-left" data-aos-delay="900"></p>
          <a class="btn btn-success" href="recipes.html" role="button" data-aos="fade-up" data-aos-delay="1000">Get Started</a>
          </div>
      </div>
     <!--Row Ended-->
  </div>
 <!-- container Ended-->
</section>

<section class="features">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="heading" data-aos="fade-up" data-aos-delay="300">
          <h2 class="featurs-h2"> What makes us different?</h2>
        </div>
      </div>

      <div class="col-md-4" data-aos="fade-up" data-aos-delay="400">
        <div class="feature-item">
          <img src="images/plann.webp" alt="Personalized Plan" class="feature-image1">
          <h3>Personalized Plan</h3>
          <p>Achieve your health goals with a plan tailored to you. TrueBites will create a customized and effective nutrition plan based  on  your  own  information.</p>
        </div>
      </div>

      <div class="col-md-4" data-aos="fade-up" data-aos-delay="500">
        <div class="feature-item">
          <img src="images/meal.jpeg" alt="Customized Meals" class="feature-image">
          <h3>Customized Meals</h3>
          <p>Enjoy delicious meals that suit your dietary needs. TrueBites offers a variety of meal ideas every single day that make healthy eating easy and enjoyable.</p>
        </div>
      </div>

      <div class="col-md-4" data-aos="fade-up" data-aos-delay="600">
        <div class="feature-item">
          <img src="images/diary.png" alt="Food Diary" class="feature-image1">
          <h3>Food Diary</h3>
          <p>Track your eating habits with our intuitive food diary. Log your meals, monitor your progress, and stay accountable with TrueBite.</p>
        </div>
      </div>
    </div>
  </div>

</section>

<!-- Add AOS (Animate On Scroll) Library -->
<link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
<script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>


<!-- About section Ended-->
<section class="about">
  <!-- Page Content -->
  <div class="container">
     <div class="row">
         <div class="col-lg-6 col-sm-12" data-aos="fade-right" data-aos-delay="300">
            <a href="#" class="d-block">
              <img id="about" class="img-fluid img-thumbnail" src="images/aboutus.jpg" alt="about-bg">
            </a>
         </div>
         <div class="col-lg-6 col-sm-12">
            <div class="row" data-aos="fade-left" data-aos-delay="500">
                <div class="col-sm-12">
                    <h2>About <span>TrueBites</span></h2>
                   <p >
                    In today's world, the field of nutrition is often clouded with conflicting information and shocking articles that demonize certain foods. These misleading narratives can create confusion and unhealthy relationships with food. Our website’s idea is built on the fundamental belief that there are no inherently "bad" foods. Instead, we advocate for a balanced and informed approach to nutrition, emphasizing that all foods can be enjoyed in moderation as part of a healthy lifestyle.
                   </p>
                   <p >Our mission is to challenge the prevalent myths that dominate much of the nutritional discourse. We aim to provide evidence-based information and practical tools that empower individuals to make well-informed dietary choices without guilt or fear. By promoting the idea that all foods can fit into a balanced diet, we hope to foster a more positive and sustainable approach to eating. To achieve this, our website will feature a variety of tools and resources designed to help users understand their nutritional needs and make healthier choices.</p>
                </div>
            </div>

         </div>
     </div>
  </div>
  <!-- /.container -->
</section>
<!-- About section Ended-->
<!-- Items section Ended-->


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
           <form>
              <div class="input-group" data-aos="fade-left" data-aos-duration="800">
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
            <a href="index.html"><img  id="logo1" src="images/image.png" alt="footer-logo"></a>
        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

      <!-- Grid row-->
      
      <!-- Grid row-->

      <!-- Grid row-->
      <div class="row pb-3">

      </div>
      <!-- Grid row-->

    </div>
    <!-- Footer Links -->

  </footer>
  <!-- Footer -->
   
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
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