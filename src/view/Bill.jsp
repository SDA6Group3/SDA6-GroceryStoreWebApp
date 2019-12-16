<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.sda.model.Product"%>
<%@ page import="org.sda.model.ShoppingItem"%>
<%@ page import="org.sda.model.EstablishConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
	String base = "http://localhost:8080/SDA6-Final-Project/manageCartController";
	EstablishConnection dbObj = new EstablishConnection();
	String userName = (String) session.getAttribute("userName");
	double totalAmount = 0.0;
	String action = request.getParameter("bilPID");
	System.out.println(action);
	if (action != null) {
		Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
		Enumeration cartItem = shoppingCart.elements();
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
<link rel="stylesheet" href="css/registration.css">
<script>
	function doSubmit() {
		window.open("CheckOut.jsp", "_self");
	}
</script>
</head>
<body class="goto-here imgReceipt"
	style="background-image: url('images/bg.png'); background-repeat: no-repeat; background-size: 1900px 900px;">
	<br />
	<br />
	<br />
	<br />
	<%-- <div>
		<jsp:include page="Menu.jsp" flush="true" />
	</div> --%>
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

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 form1">
				<table style="width: 100%">
					<TR>
						<TD><FONT FACE="Verdana"><B>Item Name</B></FONT></TD>
						<TD><FONT FACE="Verdana"><B>Item Price</B></FONT></TD>
						<TD><FONT FACE="Verdana"><B>Item Quantity</B></FONT></TD>
					</TR>

					<%
						while (cartItem.hasMoreElements()) {
								ShoppingItem item = (ShoppingItem) cartItem.nextElement();
								totalAmount += (item.getQuantity() * item.getPrice());
					%>

					<TR>
						<TD><FONT FACE="Verdana" WIDTH="70%" HEIGHT="30%"><%=item.getName()%></FONT></TD>
						<TD><FONT FACE="Verdana" WIDTH="70%" HEIGHT="30%"><%=item.getPrice()%>
								Kr</FONT></TD>
						<TD><FONT FACE="Verdana" WIDTH="70%" HEIGHT="30%"
							style="text-align: center;"><%=item.getQuantity()%></FONT></TD>
					</TR>
					<%
						}
					%>

					<%
						}
					%>
				</table>
				<TABLE>
					<TR>
						<TD><B>Total amount : <%=totalAmount%> Kr
						</B></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD></TD>
						<TD>
							<button class="btn btn-primary" property="button"
								onclick="doSubmit();" value="GotoPayment">Go to Payment</button>
						</TD>
						<TD>&nbsp; <a href="javascript:history.go(-1)"><button
									type="button" name="cancel" class="btn btn-primary cancelbtn">Back</button></a>
						</TD>
					</TR>
				</TABLE>
			</div>
		</div>
	</div>
</BODY>
</HTML>