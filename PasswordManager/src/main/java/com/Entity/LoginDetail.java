package com.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "login_detail")
public class LoginDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(nullable = false)
	private String name;

	@ManyToOne
	private User user;
	@Column(nullable = false)
	private String username;

	@Column(nullable = false)
	private String email1;
	private String email2;

	@Column(nullable = false)
	private String password;

	private String website;
	private String note;

	public LoginDetail() {

	}

	public LoginDetail(User user, String name, String username, String email1, String email2, String password,
			String website, String note) {
		try {
			name = SimpleEncryption.encrypt(name);
			this.name = name;
			this.user = user;
			username = SimpleEncryption.encrypt(username);
			this.username = username;
			email1 = SimpleEncryption.encrypt(email1);
			this.email1 = email1;
			email2 = SimpleEncryption.encrypt(email2);
			this.email2 = email2;
			password = SimpleEncryption.encrypt(password);
			this.password = password;
			website = SimpleEncryption.encrypt(website);
			this.website = website;
			note = SimpleEncryption.encrypt(note);
			this.note = note;
		} catch (Exception exp) {
			exp.printStackTrace();
		}
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public LoginDetail decrypt(LoginDetail obj) {
		try {
			obj.name = SimpleEncryption.decrypt(obj.name);
			obj.username = SimpleEncryption.decrypt(obj.username);
			obj.email1 = SimpleEncryption.decrypt(obj.email1);
			obj.email2 = SimpleEncryption.decrypt(obj.email2);
			obj.password = SimpleEncryption.decrypt(obj.password);
			obj.website = SimpleEncryption.decrypt(obj.website);
			obj.note = SimpleEncryption.decrypt(obj.note);
			return obj;
		} catch (Exception ex) {
			ex.printStackTrace();
			return obj;
		}
	}
}
