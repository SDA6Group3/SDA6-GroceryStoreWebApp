<!-- 
Index.jsp
-- This jsp file opens up when user log into Online Grocery System web application
-- index.jsp file has 3 sections divided into header,main content and footer
-- header section contains "Online Grocery System" heading , login user symbol,name and logout
-- main content section displays the different categories of the online grocery system like Vegetables,Fruits
-- a query string framed to perform an action once user clicks on desired category and passes the value of category id,name to the next page
-- footer section contains the details about contact us .
-->

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
<title></title>
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
</head>
<body class="goto-here">

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
	<!-- END nav -->

	<section id="home-section" class="hero">
		<div class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url(images/bg_1.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-md-12 ftco-animate text-center">
							<h1 class="mb-2">We serve Fresh Vegetables &amp; Fruits</h1>
							<h2 class="subheading mb-4">We deliver organic vegetables
								&amp; fruits</h2>
						</div>

					</div>
				</div>
			</div>

			<div class="slider-item"
				style="background-image: url(images/bg_2.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div
						class="row slider-text justify-content-center align-items-center"
						data-scrollax-parent="true">

						<div class="col-sm-12 ftco-animate text-center">
							<h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
							<h2 class="subheading mb-4">We deliver organic vegetables
								&amp; fruits</h2>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<br />
	<br />
	<br />
	<br />
	<br />
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
								href="<%=base%>?action=browseCatalog&categoryId=<%=categoryId.toString()%>"><%=altValue%></a>
						</h2>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>


	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Online Grocery System</h2>
						<p></p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Contact Us</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">ABC 12, 21212, Lund, Sweden</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>



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
	<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>-->
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>