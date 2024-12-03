package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entity.User;

public class UserDao {
	private Session session = null;
	private Transaction tx = null;
	private SessionFactory factory = null;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveUser(User user) {
		boolean f = false;

		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			user = user.encryptUser(user);
			session.persist(user);
			tx.commit();
			f = true;
			return f;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return f;
		}
	}

	public boolean userExists(User user) {
		String email = user.getEmail();
		String username = user.getUsername();
		try {
			session = factory.openSession();
			User temp_user = session
					.createQuery("select e from User e where e.email = :email or e.username = :username", User.class)
					.setParameter("email", email).setParameter("username", username).getSingleResult();
			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}

	public User loginUser(String email, String password) {
		User user;
		try {
			session = factory.openSession();
			user = session
					.createQuery("select e from User e where e.email = :email and e.password = :password", User.class)
					.setParameter("email", email).setParameter("password", password).getSingleResult();
			return user;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}

	}

}
