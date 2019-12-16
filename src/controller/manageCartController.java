/* manageCartController
 * --- manageCartController is servlet used as a controller
 * --- MVC pattern is used to implement OnlineGrocerySystem application
 * --- 		
 */
package org.sda.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manageCartController")
public class manageCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out = null;

	public manageCartController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside doPost of managecartcontroller servlet");
		String url = "";
		String action = request.getParameter("action");
		System.out.println("Action " + action);
		if (action != null) {
			if (action.equals("search")) {
				url = "/SearchResults.jsp";
			} else if (action.equals("getProductList")) {
				url = "/Product.jsp";
			} else if (action.equals("addShoppingItem") || action.equals("updateShoppingItem")
					|| action.equals("deleteShoppingItem")) {
				url = "/ShoppingCart.jsp";
			} else if (action.equals("Bill")) {
				url = "/Bill.jsp";
			} else if (action.equals("checkOut")) {
				url = "/CheckOut.jsp";
			} else if (action.equals("order")) {
				url = "/Order.jsp";
			}
		}
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
}
