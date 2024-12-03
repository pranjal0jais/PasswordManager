package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.Entity.User;
import com.dao.UserDao;
import com.db.HibernateUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Register")
public class Register extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		SessionFactory factory = HibernateUtils.getSessionFactory();
		HttpSession session = req.getSession();
		
		User user = new User(name, email, password);
		
		UserDao userdao = new UserDao(factory);
		
		boolean userExists = userdao.userExists(user);
		if(!userExists) {
			boolean saved = userdao.saveUser(user);
			
			if(saved) {
				session.setAttribute("successMsg", "User Registered Successfully.");
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failMsg", "User Not Registered.");
				resp.sendRedirect("index.jsp");
			}
		} else {
			session.setAttribute("failMsg", "Email Id or Username already exists.");
			resp.sendRedirect("index.jsp");
		}
	}

	
}
