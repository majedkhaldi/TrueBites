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


</head>
<body>
	<div class="contact1">
		<div class="container mt-5">
			

			<div class="container-contact1">
				<div class="contact1-pic js-tilt" data-tilt>
					<img src="images/new_image_corrected.png" alt="IMG">
				</div>
				<form class="contact1-form validate-form"
					action="${pageContext.request.contextPath}/contact" method="post">
					<span class="contact1-form-title"> Get in touch </span>

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
						<button class="contact1-form-btn">
							<span> Send Email <i class="fa fa-long-arrow-right"
								aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</form>

				<div>
					<c:if test="${not empty successMessage}">
						<div class="alert alert-success mt-3">${successMessage}</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger mt-3">${errorMessage}</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
