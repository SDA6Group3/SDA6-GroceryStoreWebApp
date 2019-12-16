<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.sda.model.EstablishConnection"%>
<%
	String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://fonts.googleapis.com/css?family=Manjari&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/registration.css">

</head>
<body class="goto-here">
	<section>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="index.html">Online Grocery System</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="index.html"
							class="nav-link">Home</a></li>
						<li class="nav-item dropdown"></li>
						<li class="nav-item"><a href="about.html" class="nav-link">About
								Us</a></li>
						<li class="nav-item"><a class="navbar-brand"
							href="HomePage.jsp"><img src="images/user.png"
								alt="Bootstrappin" width="50"><%=userName%></a></li>
						<li class="nav-item"><a class="navbar-brand"
							href="Registration.html"><img src="images/logout.png"
								alt="Bootstrappin" width="50">LogOut</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</section>
	<br />
	<br />
	<section id="home-section" class="hero"></section>
	<section class="ftco-section ftco-category ftco-no-pt">
		<div class="container">
			<div class="row">
				<%
					String imgCategory = "";
					String altValue = "";
					String base = "http://localhost:8080/SDA6-Final-Project/manageCartController";
					EstablishConnection dbObj = new EstablishConnection();
					Hashtable categories = dbObj.getCategories();
					Enumeration categoryIds = categories.keys();
					while (categoryIds.hasMoreElements()) {
						Object categoryId = categoryIds.nextElement();
						if (Integer.valueOf(categoryId.toString()) == 1) {
							imgCategory = "images/Fruits.png";
							altValue = "Fruits";
						}
						if (Integer.valueOf(categoryId.toString()) == 2) {
							imgCategory = "images/bg_2.jpg";
							altValue = "Vegetables";
						}
				%>

				<div class="col-lg-6 text-center">
					<div class="category-wrap ftco-animate d-flex align-items-end">
						<img class="img-fluid" alt="Colorlib Template"
							src="<%=imgCategory%>">

					</div>
					<div class="text px-3 py-1">
						<h2 class="mb-0">
							<a class="btn btn-primary"
								href="<%=base%>?action=getProductList&categoryId=<%=categoryId.toString()%>"><%=altValue%></a>
						</h2>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>

	</section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>