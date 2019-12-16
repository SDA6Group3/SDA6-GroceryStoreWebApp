package org.sda.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

/* File Name - EstablishConnection.java
 * Author - Veena R
 * Date - 27 Nov 2019
 * 
 * This .java file is used to declare, initialize database connection variables used to establish the connection to the 
 * MySQL database
 */

public class EstablishConnection {
	private String connectionURL;
	private Connection connection;

	public EstablishConnection() {

	}

	public Connection getConnection() {

		this.connectionURL = "jdbc:mysql://localhost:3306/Grocery?autoReconnect=true&useSSL=false";
		try {
			this.connection = DriverManager.getConnection(connectionURL, "root", "Veena123");
		} catch (Exception ex) {
			ex.getMessage();
			System.out.println("Unable to connect to database.");
		}
		return connection;
	}

	public Hashtable getCategories() {
		Hashtable categories = new Hashtable();
		try {
			Connection connection = getConnection();
			Statement s = connection.createStatement();
			String sql = "SELECT categoryId, categoryName FROM Categories";
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				categories.put(rs.getString(1), rs.getString(2));
			}
			rs.close();
			s.close();
			connection.close();
		} catch (SQLException e) {
		}
		return categories;
	}

	public ArrayList getProductsInCategory(String categoryId) {
		ArrayList products = new ArrayList();
		System.out.println("Inside getProductsInCategory");
		try {
			Connection connection = getConnection();
			Statement s = connection.createStatement();
			String sql = "SELECT productId,productName,productPrice,categoryId FROM Product" + " WHERE categoryId="
					+ Integer.valueOf(categoryId);
			System.out.println("SQL Q_UER_Y" + sql);
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductPrice(rs.getDouble(4));
				products.add(product);
			}
			rs.close();
			s.close();
			connection.close();
		} catch (SQLException e) {
			e.getMessage();
		}
		return products;
	}

	public ArrayList getSearchResults(String keyword) {
		ArrayList products = new ArrayList();
		System.out.println("Inside getSearchResults() method");
		try {
			Connection connection = getConnection();
			Statement s = connection.createStatement();
			String sql = "SELECT productId, productName,productPrice,categoryId FROM Product"
					+ " WHERE productName LIKE '%" + keyword.trim() + "%'";
			System.out.println("Sql query for search" + sql);
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				System.out.println("Inside while loop of getSearchResults()");
				Product product = new Product();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setProductPrice(rs.getDouble("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
				products.add(product);
			}
			rs.close();
			s.close();
			connection.close();
		} catch (SQLException e) {
		}
		return products;
	}

	public Product getProductDetails(int productId) {
		Product product = null;
		System.out.println("INSIDE GETPRODUCTDETAILS() ...");
		try {
			Connection connection = getConnection();
			Statement s = connection.createStatement();
			String sql = "SELECT productId,productName,productPrice,categoryId FROM Product" + " WHERE productId="
					+ productId;
			System.out.println("SQL:" + sql);
			ResultSet rs = s.executeQuery(sql);
			if (rs.next()) {
				product = new Product();
				product.setProductId(rs.getInt(1));
				product.setProductName(rs.getString(2));
				product.setProductPrice(rs.getDouble(3));
			}
			rs.close();
			s.close();
			connection.close();
		} catch (SQLException e) {
			System.out.println("sql exception " + e.getMessage());
		}
		return product;
	}

	public boolean insertOrder(String contactName, String deliveryAddress, String cdName, String cdNumber,
			String cdExpiryDate, Hashtable shoppingCart) {
		boolean returnValue = false;

		try {
			Connection connection = getConnection();
			connection.setAutoCommit(false);
			Statement s = connection.createStatement();
			String sql = "INSERT INTO Orders"
					+ " (OrderId, ContactName, DeliveryAddress, CDName, CDNumber, CDExpiryDate)" + " VALUES" + " ("
					+ "null" + ",'" + contactName + "','" + deliveryAddress + "'," + "'" + cdName + "','" + cdNumber
					+ "','" + cdExpiryDate + "')";
			System.out.println("ORDERS ???" + sql);
			s.executeUpdate(sql);
			String selectSql = "SELECT * FROM Orders";
			ResultSet rs = s.executeQuery(selectSql);
			rs.next();
			rs.afterLast();
			rs.previous();
			int orderNo = rs.getInt(1);
			
			// now insert items into OrderInfo table
			Enumeration enumObj = shoppingCart.elements();
			while (enumObj.hasMoreElements()) {
				ShoppingItem item = (ShoppingItem) enumObj.nextElement();
				sql = "INSERT INTO OrderInfo (OrderId, ProductId, Quantity, Price)" + " VALUES (" + orderNo + ","
						+ item.getProductId() + "," + item.getQuantity() + "," + item.getTotalPrice() + ")";
				System.out.println("ORDER DETAILS :" + sql);
				s.executeUpdate(sql);
			}

			s.close();
			connection.commit();
			connection.close();
			returnValue = true;
		} catch (SQLException e) {
			try {
				connection.rollback();
				connection.close();
			} catch (SQLException se) {

				System.out.println(se.getMessage());
			}

		}
		return returnValue;
	}
}
