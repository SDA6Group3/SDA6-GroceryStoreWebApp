<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body class="goto-here"
	style="background-image: url('images/bg1.png'); background-repeat: no-repeat; background-size: 1900px 900px;">
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
	<br />
	<br />

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<table style="width: 100%">
					<TR>
						<p style="color: black;">
							<B><font size="6">Payment Details</font></B>
						</p>
						<TD VALIGN="TOP">
							<FORM
								action="http://localhost:8080/SDA6-Final-Project/manageCartController">
								<INPUT TYPE="HIDDEN" NAME="action" VALUE="order">
								<TABLE>

									<TR>
										<TD COLSPAN="2" style="color: black;"><I><B>Delivery
													Details</B></I></TD>
									</TR>
									<TR>
										<TD>Contact Name:</TD>
										<TD><INPUT TYPE="TEXT" NAME="contactName"></TD>
									</TR>
									<TR>
										<TD>Delivery Address:</TD>
										<TD><INPUT TYPE="TEXT" NAME="deliveryAddress"></TD>
									</TR>
									<TR>
										<TD COLSPAN="2" style="color: black;"><I><B>Credit/Debit
													card Details</B></I></TD>
									</TR>
									<TR>
										<TD>Name on Card:</TD>
										<TD><INPUT TYPE="TEXT" NAME="cdName"></TD>
									</TR>
									<TR>
										<TD>CDCE Number:</TD>
										<TD><INPUT TYPE="TEXT" NAME="cdNumber"></TD>
									</TR>
									<TR>
										<TD>Card Expiry Date:</TD>
										<TD><INPUT TYPE="TEXT" NAME="cdExpiryDate"></TD>
									</TR>
									<br />
									<TR>
										<TD>&nbsp;</TD>

										<TD><INPUT class="btn btn-primary" TYPE="SUBMIT"
											VALUE="Pay" style="height: 30px; width: 100px;"> <a
											href="javascript:history.go(-1)"><button type="button"
													name="cancel" class="btn btn-primary"
													style="height: 30px; width: 100px;">Back</button></a></TD>
									</TR>
								</TABLE>
							</FORM>
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</div>
	<br />
	<br />
</BODY>
</HTML>