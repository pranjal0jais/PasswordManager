package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entity.LoginDetail;
import com.Entity.User;

public class LoginDao {
	private Session session = null;
	private Transaction tx = null;
	private SessionFactory factory = null;

	public LoginDao(SessionFactory factory) {
		this.factory = factory;
	}

	public LoginDetail getLoginDetailById(int id) {
		try {
			session = factory.getCurrentSession();
			tx = session.beginTransaction();
			LoginDetail obj = session.createQuery("select e from LoginDetail e where e.id = :id", LoginDetail.class)
					.setParameter("id", id).getSingleResult();
			if (obj == null) {

				System.out.println("obj not found");
				return null;
			}
			tx.commit();
			return obj;
		} catch (Exception ex) {
			tx.rollback();
			ex.printStackTrace();
			return null;
		}
	}

	public boolean saveChanges(LoginDetail obj) {
		try {
			session = factory.getCurrentSession();
			tx = session.beginTransaction();
			session.merge(obj);
			tx.commit();
			return true;
		} catch (Exception ex) {
			tx.rollback();
			ex.printStackTrace();
			return false;
		}
	}

	public boolean addLogin(LoginDetail login) {
		try {
			session = factory.getCurrentSession();
			tx = session.beginTransaction();
			session.persist(login);
			tx.commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean deleteLogin(LoginDetail obj) {
		try {
			session = factory.getCurrentSession();
			tx = session.beginTransaction();
			session.remove(obj);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx == null) {
				System.out.println(e.getMessage());
			}
			return false;
		}
	}

	public List<LoginDetail> getAllLogins(User user) {
		session = factory.getCurrentSession();
		tx = session.beginTransaction();

		List<LoginDetail> loginList = session
				.createQuery("select e from LoginDetail e where e.user.id = :user_id order by e.name",
						LoginDetail.class)
				.setParameter("user_id", user.getId()).getResultList();
		tx.commit();
		return loginList;
	}
}
