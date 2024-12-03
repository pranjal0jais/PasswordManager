package com.servlets;

import java.io.IOException;

import com.Entity.SimpleEncryption;
import com.Entity.User;
import com.dao.UserDao;
import com.db.HibernateUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDao userdao = new UserDao(HibernateUtils.getSessionFactory());
		try {
			email = SimpleEncryption.encrypt(email);
			password = SimpleEncryption.encrypt(password);
			System.out.println(email);
			System.out.println(password);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		User user = userdao.loginUser(email, password);

		HttpSession session = req.getSession();

		if (user == null) {
			session.setAttribute("failMsg", "Invalid Email or Password!");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("user", user);
			resp.sendRedirect("user_index.jsp");
		}
	}

}
