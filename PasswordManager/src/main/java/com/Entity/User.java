package com.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_detail")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String username;
	private String email;
	private String password;

	public User() {
	}

	public User(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User encryptUser(User user) {
		try {
			user.setEmail(SimpleEncryption.encrypt(user.email));
			user.setUsername(SimpleEncryption.encrypt(user.username));
			user.setPassword(SimpleEncryption.encrypt(user.password));
			return user;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	public User decryptUser(User user) {
		try {
			user.setEmail(SimpleEncryption.decrypt(user.email));
			user.setUsername(SimpleEncryption.decrypt(user.username));
			user.setPassword(SimpleEncryption.decrypt(user.password));
			return user;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}
