package com.servlets;

import java.io.IOException;

import com.Entity.LoginDetail;
import com.Entity.User;
import com.dao.LoginDao;
import com.db.HibernateUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addLogin")
public class AddLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String password = req.getParameter("password");
		String website = req.getParameter("website");
		String note = req.getParameter("note");
		
		HttpSession session = req.getSession();
		
		User user = (User) session.getAttribute("user");
		
		LoginDetail loginDetail = new LoginDetail(user, name, username, email1, email2, password, website, note);
		
		username = name = email1 = email2 = password = website = note = "";
		
		LoginDao logindao = new LoginDao(HibernateUtils.getSessionFactory());
		
		boolean saved = logindao.addLogin(loginDetail);
		session.setAttribute("user", user);
		if(saved) {
				session.setAttribute("successMsg", "Login Detail Added.");
				resp.sendRedirect("user_index.jsp");
		}else{
				session.setAttribute("failMsg", "Some Error Occured.");
				resp.sendRedirect("user_index.jsp");
		}
		
	}
	
}
