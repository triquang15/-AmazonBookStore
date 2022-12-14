package com.devteam.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devteam.dao.UserDAO;
import com.devteam.entity.Users;

public class UserServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		entityManagerFactory = Persistence.createEntityManagerFactory("AmazonBookStore");
		entityManager = entityManagerFactory.createEntityManager();
		
		userDAO = new UserDAO(entityManager);
	}
	
	public void listUser() throws ServletException, IOException {
		listUser(null);
	}
	
	public void listUser(String message) throws ServletException, IOException {
		List<Users> lisUsers = userDAO.listAll();
		
		request.setAttribute("listUsers", lisUsers);
		if(message != null) {
			request.setAttribute("message", message);
		}
		
		String listpage = "user_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listpage);
		requestDispatcher.forward(request, response);
	
	}
	
	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		
		Users existUser = userDAO.findByEmail(email);
		if(existUser != null) {
			String message = "Count not create user. A user with email " + email + "already exists";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		}else {
			Users newUser = new Users(email, fullName, password);
			userDAO.create(newUser);
			listUser("new user created successfully");
		}
	}
}
