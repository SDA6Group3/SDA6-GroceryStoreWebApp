package org.sda.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.sda.model.Customer;
import org.sda.model.EstablishConnection;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private EstablishConnection dbHandler = new EstablishConnection();
	PrintWriter out = null;

	public RegistrationServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Inside doPost");
		out = response.getWriter();
		connection = dbHandler.getConnection();
		HttpSession session = request.getSession(true);
		try {
			if (request.getParameter("GetStarted") != null) {
				System.out.println(request.getParameter("GetStarted"));
				String firstName = request.getParameter("FirstName");
				String lastName = request.getParameter("LastName");
				String phoneNumber = request.getParameter("Phone");
				String address = request.getParameter("Address");
				int zipCode = Integer.valueOf(request.getParameter("Zip"));
				String country = request.getParameter("Country");
				String Email = request.getParameter("EMail");
				String pwd1 = request.getParameter("pwd1");
				String pwd2 = request.getParameter("pwd2");
				Customer reg = new Customer(firstName, lastName, phoneNumber, address, zipCode, country, Email,
						pwd1, pwd2);

				String queryString = "INSERT INTO Customer(customerId,FirstName,LastName,PhoneNumber,Address,Zip,Country,pwd1,pwd2,Email) VALUES (default,?,?,?,?,?,?,?,?,?)";
				System.out.println("queryString " + queryString);
				PreparedStatement ps = connection.prepareStatement(queryString);
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, phoneNumber);
				ps.setString(4, address);
				ps.setInt(5, zipCode);
				ps.setString(6, country);
				ps.setString(7, pwd1);
				ps.setString(8, pwd2);
				ps.setString(9, Email);
				int rowAffected = ps.executeUpdate();
				if (rowAffected == 1) {
					request.getRequestDispatcher("/Registration.html").forward(request, response);
				}
			}
			if (request.getParameter("Login") != null) {
				String Email = request.getParameter("EMail");
				String pwd1 = request.getParameter("chkPwd");
				String selQueryStr = "Select * from Customer where Email='" + Email+ "' and pwd1 = '" + pwd1 + "'";
				PreparedStatement ps = connection.prepareStatement(selQueryStr);
				ResultSet rs = null;
				rs = ps.executeQuery();
				rs.last();
				int count = rs.getRow();
				String userName = rs.getString(2)+" "+rs.getString(3);
				if (count != 0) {
					session.setAttribute("userName", userName);
					request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
				}
				rs.close();
				ps.close();
			}
			connection.close();

		} catch (SQLException e) {
			request.setAttribute("ErrorMsg", "Error during registration");
			request.getRequestDispatcher("/LoginErrorPage.jsp").forward(request, response);
		}

	}

}
