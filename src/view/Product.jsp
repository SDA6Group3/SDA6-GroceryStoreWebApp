<!-- 
Product.jsp
--- This Jsp page is selected by the manageCartController when user clicks on any of the categories of Online Grocery System
and it shows all the products of the selected category.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.sda.model.Product"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.sda.model.EstablishConnection"%>

<!-- userName is a session variable and is set with the value of  user's firstname & lastname in RegistrationServlet controller 
when user log in to the system. Using session.getAttribute("userName") method name of the logged in user will be displayed 
 in different .jsp pages
-->
<%
	String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href="https://fonts.googleapis.com/css?family=Manjari&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<title>Online Grocery System title</title>
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
	<!-- END NAV -->
	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">Products</h1>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="row">
<!-- Below Jsp code identifies the category id from request.getParameter("categoryId") and contact DAO class EstablisConnection
 to get a list of products from the selected category id
 And products will be listed with an image,name,price and a link is provided to add the item to cart 
 -->			
				<%
					String categoryId = request.getParameter("categoryId");
					if (categoryId != null && !categoryId.trim().equals("")) {
						String base = "http://localhost:8080/SDA6-Final-Project/manageCartController";
						String imageUrl = "images/";
						EstablishConnection dbObj = new EstablishConnection();
						ArrayList products = dbObj.getProductsInCategory(categoryId);
						Iterator iterator = products.iterator();
						while (iterator.hasNext()) {
							Product product = (Product) iterator.next();
							Product productDets = dbObj.getProductDetails(product.getProductId());
				%>
				<%
					if (productDets != null) {
				%>
				<div class="col-md-6 col-lg-3 col-sm-6 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"> <img class="img-fluid"
							alt="Colorlib Template"
							src="<%=(imageUrl + productDets.getProductId())%>.png">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#"><%=productDets.getProductName()%></a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="price-sale"><%=productDets.getProductPrice()%></span>
									</p>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-12">
										<a
											href="<%=base%>?action=addShoppingItem&productId=<%=productDets.getProductId()%>">Add
											To Cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						}
					} else
						out.println("Invalid category.");
				%>
			</div>
			<a href="javascript:history.go(-1)"><button type="button"
					name="cancel" class="btn btn-primary cancelbtn">Back</button></a>
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
										class="text">info@onlinegrocerysystem.com</span></a></li>
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
				stroke-width="4" stroke="#EEEEEE" />
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
