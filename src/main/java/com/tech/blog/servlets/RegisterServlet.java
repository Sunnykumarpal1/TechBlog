package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String check=request.getParameter("check");
//		String name=request.getParameter("user_name");
//		response.getWriter().println(name);
		PrintWriter out=response.getWriter();
		if(check==null) {
			out.print("Hi Please Agree to the Terms & Condition");
		}else {
			
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String about=request.getParameter("user_about");
			String gender=request.getParameter("user_gender");
			
			User user=new User();
			user.setName(name);
			user.setAbout(about);
			user.setEmail(email);
			user.setPassword(password);
		    user.setGender(gender);
		    
		    
//		    here we are database object and then inserting the user value in the database;
		    UserDao ud=new UserDao(ConnectionProvider.getConnection());
		    
		    if(ud.SaveUser(user)) {
		    	out.println("done");
		    }else {
		    	out.print("error");
		    }
		}
		System.out.println(check);
	}

}
