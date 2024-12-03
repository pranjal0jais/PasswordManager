package com.db;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	static private SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		if(sessionFactory == null) {
			Configuration configuration = (Configuration) new Configuration().configure("hibernate.cfg.xml");
			return configuration.buildSessionFactory();
		}
		return sessionFactory;
	}
}
