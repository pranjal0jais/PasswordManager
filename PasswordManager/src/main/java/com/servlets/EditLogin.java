package com.servlets;

import java.io.IOException;

import com.Entity.LoginDetail;
import com.Entity.SimpleEncryption;
import com.Entity.User;
import com.dao.LoginDao;
import com.db.HibernateUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editLogin")
public class EditLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String password = req.getParameter("password");
		String website = req.getParameter("website");
		String note = req.getParameter("note");
		HttpSession session = req.getSession();

		LoginDao loginDao = new LoginDao(HibernateUtils.getSessionFactory());
		LoginDetail login = loginDao.getLoginDetailById(id);
		User user = (User) session.getAttribute("user");
		if (login != null) {
			try {
				login.setUser(user);
				name = SimpleEncryption.encrypt(name);
				login.setName(name);
				username = SimpleEncryption.encrypt(username);
				login.setUsername(username);
				email1 = SimpleEncryption.encrypt(email1);
				login.setEmail1(email1);
				email2 = SimpleEncryption.encrypt(email2);
				login.setEmail2(email2);
				password = SimpleEncryption.encrypt(password);
				login.setPassword(password);
				website = SimpleEncryption.encrypt(website);
				login.setWebsite(website);
				note = SimpleEncryption.encrypt(note);
				login.setNote(note);
			} catch (Exception exp) {
				exp.printStackTrace();
				;
			}
		}
		boolean updated = loginDao.saveChanges(login);
		if (updated) {
			session.setAttribute("successMsg", "Login Updated.");
		} else {
			session.setAttribute("failMsg", "Login not Updated.");
		}
		resp.sendRedirect("user_index.jsp");
	}

}
