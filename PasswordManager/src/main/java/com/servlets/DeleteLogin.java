package com.servlets;

import java.io.IOException;

import com.Entity.LoginDetail;
import com.dao.LoginDao;
import com.db.HibernateUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteLogin")
public class DeleteLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession();
		LoginDao loginDao = new LoginDao(HibernateUtils.getSessionFactory());
		LoginDetail login = loginDao.getLoginDetailById(id);
		boolean deleted = loginDao.deleteLogin(login);
		if (deleted) {
			session.setAttribute("successMsg", "Login Deleted.");
		} else {
			session.setAttribute("failMsg", "Login Not Deleted.");
		}
		resp.sendRedirect("user_index.jsp");
	}
}
