<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.sda.model.Product"%>
<%@ page import="org.sda.model.EstablishConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	String base = "http://localhost:8080/SDA6-Final-Project/manageCartController";
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


					</ul>
				</div>
			</div>
		</nav>
		<br /> <br />
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 form1">
					<table style="width: 100%">


						<%
							String keyword = request.getParameter("keyword");
							System.out.println("SEARCH KEYWORD :" + keyword);
							keyword = "apple";
							if (keyword != null && !keyword.trim().equals("")) {
						%>

						<TR>
							<TD><FONT FACE="Verdana" SIZE="3"><B>Name</B></FONT></TD>
							<TD><FONT FACE="Verdana" SIZE="3"><B>Price</B></FONT></TD>
							<!-- <TD><FONT FACE="Verdana" SIZE="3"><B>Details</B></FONT></TD> -->
						</TR>
						<%
							EstablishConnection dbObj = new EstablishConnection();
								ArrayList products = dbObj.getSearchResults(keyword);
								Iterator iterator = products.iterator();
								while (iterator.hasNext()) {
									Product product = (Product) iterator.next();
								int categoryId = product.getCategoryId();
									System.out.println(product.getProductName());
									System.out.println("category id " + product.getCategoryId());
						%>
						<TR>
							<TD><FONT FACE="Verdana" SIZE="2"><%=product.getProductName()%></FONT></TD>
							<TD><FONT FACE="Verdana" SIZE="2"><%=product.getProductPrice()%>Kr</FONT></TD>
							<TD><A
								HREF="<%=base%>?action=addShoppingItem&productId=<%=product.getProductId()%>">
									<FONT FACE="Verdana" SIZE="2">Add to Cart</FONT> <%-- HREF="<%=base%>?action=productDetails&productId=<%=product.getProductId()%>">
										<FONT FACE="Verdana" SIZE="2">Details</FONT> --%>
							</A></TD>
						</TR>
						<%
							}
							} else
								out.println("Please enter a search keyword.");
						%>
					
				</div>
			</div>
		</div>


	</section>


</BODY>
</HTML>