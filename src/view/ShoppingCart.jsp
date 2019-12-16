<!-- 
ShoppingCart.jsp
--- This Jsp page is selected by the manageCartController when user clicks on "Add To Cart" link of the product in product.jsp
-->
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
	double sum = 0.0;
	int bilPID = 0;
	double subTotal = 0.0;
	Hashtable shoppingCart = (Hashtable) session.getAttribute("shoppingCart");
	if (shoppingCart == null) {
		shoppingCart = new Hashtable(10);
	}
	String action = request.getParameter("action");
	if (action != null && action.equals("addShoppingItem")) {
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			Product product = dbObj.getProductDetails(productId);
			if (product != null) {
				ShoppingItem item = new ShoppingItem();
				item.setProductId(product.getProductId());
				item.setQuantity(1);
				item.setPrice(product.getProductPrice());
				item.setName(product.getProductName());
				shoppingCart.remove(Integer.toString(productId));
				shoppingCart.put(Integer.toString(productId), item);
				bilPID = product.getProductId();
				session.setAttribute("shoppingCart", shoppingCart);
			}
		} catch (Exception e) {
			out.println("Error adding the selected product to the shopping cart");
		}
	}
	if (action != null && action.equals("updateShoppingItem")) {
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			ShoppingItem item = (ShoppingItem) shoppingCart.get(Integer.toString(productId));
			if (item != null) {
				item.setQuantity(quantity);
			}
		} catch (Exception e) {
			out.println("Error updating shopping cart");
		}
	}
	if (action != null && action.equals("deleteShoppingItem")) {
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			shoppingCart.remove(Integer.toString(productId));
		} catch (Exception e) {
			out.println("Error deleting the selected item from the shopping cart");
		}
	}
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
<script>
	function doSubmit() {
		window.open("CheckOut.jsp", "_self");
	}
</script>
</head>
<body class="goto-here">
	<br />
	<div>
		<jsp:include page="Menu.jsp" flush="true" />
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<table style="width: 100%">

					<tr>
						<th><FONT FACE="Verdana" SIZE="3"><b>Name</b></FONT></th>
						<td></td>
						<th><FONT FACE="Verdana" SIZE="3"><b>Price</b></FONT></th>
						<td></td>
						<th><FONT FACE="Verdana" SIZE="3"><b>Quantity(Kg)</b></FONT></th>
						<td></td>
						<th><FONT FACE="Verdana" SIZE="3"><b>Subtotal</b></FONT></th>
						<td></td>
						<th><FONT FACE="Verdana" SIZE="3"><b>Update</b></FONT></th>
						<td></td>
						<th><FONT FACE="Verdana" SIZE="3"><b>Delete</b></FONT></th>
						<td></td>
					</tr>
					<%
						Enumeration cartItem = shoppingCart.elements();
						while (cartItem.hasMoreElements()) {
							ShoppingItem item = (ShoppingItem) cartItem.nextElement();
					%>
					<tr>
						<td><FONT FACE="Verdana" SIZE="2"><%=item.getName()%></FONT></td>
						<td></td>
						<td><FONT FACE="Verdana" SIZE="2"><%=item.getPrice()%>
								Kr</FONT></td>
						<td></td>
						<FORM>
							<INPUT class="form-control" TYPE="HIDDEN" NAME="action"
								VALUE="updateShoppingItem"> <INPUT TYPE="HIDDEN"
								NAME="productId" VALUE="<%=item.getProductId()%>">
							<td><INPUT TYPE="TEXT" Size="2" NAME="quantity"
								VALUE="<%=item.getQuantity()%>"></td>
							<td></td>
							<%
								if (item.getQuantity() <= 10) {
										subTotal = item.getQuantity() * item.getPrice();
										sum = sum + subTotal;
									} else {
										subTotal = 0.0;
							%>
							<p style="background-color: green; color: black;"text-align:center;>
								<B>Enter quantity with in 10</B>
							</p>
							<%
								}
							%>
							<td><FONT FACE="Verdana" SIZE="2"><%=subTotal%> Kr</FONT></td>
							<td></td>
							<td><INPUT class="btn btn-danger" TYPE="SUBMIT"
								VALUE="Update"></td>
							<td></td>
						</FORM>
						<FORM>
							<INPUT TYPE="HIDDEN" NAME="action" VALUE="deleteShoppingItem">
							<INPUT TYPE="HIDDEN" NAME="productId" VALUE="<%=item.getProductId()%>">
							<td><INPUT class="btn btn-danger" TYPE="SUBMIT"
								VALUE="Delete"></td>
							<td></td>
						</FORM>
					</tr>
					<tr>
						<td></td>
					</tr>

					<%
						}
					%>
					<tr>
						<TD><A class="btn btn-primary"
							HREF="<%=base%>?action=Bill&bilPID=<%=bilPID%>">View Cart & Checkout</A></TD>
						<br />

						<TD>&nbsp; <a href="javascript:history.go(-1)"><button
									type="button" name="cancel" class="btn btn-primary cancelbtn">Back</button></a>
						</TD>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
