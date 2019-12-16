package org.sda.model;

public class Customer {
	private String firstName;
	private String lastName;
	private String phonenumber;
	private String address;
	private String Country;
	private int zipcode;
	private String email;
	private String pwd1;
	private String pwd2;

	public Customer(String firstName, String lastName, String phonenumber, String address, int zipcode,
			String country, String email, String pwd1, String pwd2) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.phonenumber = phonenumber;
		this.address = address;
		this.Country = country;
		this.zipcode = zipcode;
		this.email = email;
		this.pwd1 = pwd1;
		this.pwd2 = pwd2;
	}

	public Customer(String email, String pwd1) {
		this.email = email;
		this.pwd1 = pwd1;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}
}