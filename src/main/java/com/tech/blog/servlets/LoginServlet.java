package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		UserDao ud=new UserDao(ConnectionProvider.getConnection());
	    User u= ud.GetUser(userEmail, userPassword);
	    if(u==null) {
	    	
//	    	out.print("Enter valid Details");
	    	Message msg=new Message(" Invalid Details! Enter Correct Details","error", "alert-danger");
	    	HttpSession s=request.getSession();
	    	s.setAttribute("msg",msg);
	    	response.sendRedirect("Login_page.jsp");
	    	
	    }else {
	     HttpSession session=request.getSession();
	     session.setAttribute("CurrentUser", u);
	     response.sendRedirect("profile.jsp");
	    }
	}

}
