package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("user_email");
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");

		Part part = request.getPart("user_pic");
		String PicName = part.getSubmittedFileName();

		HttpSession s = request.getSession();
		User u = (User) s.getAttribute("CurrentUser");
		String oldpic = u.getProfile();

		u.setName(name);
		u.setEmail(email);
		u.setAbout(about);
		u.setPassword(password);
		u.setProfile(PicName);

		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean flag = dao.UpdateUser(u);
		PrintWriter out = response.getWriter();

		if (flag) {
			s.setAttribute("CurrentUser", u);
			String oldPath = request.getRealPath("/") + "image" + File.separator + oldpic;
			String newPath = request.getRealPath("/") + "image" + File.separator + u.getProfile();
//			here firstly we will delete the old pic then add the new pic

			Helper h = new Helper();
			if (oldpic != "default.png") {
				h.DeleteFile(oldPath);
			}

			InputStream is = part.getInputStream();

			System.out.println(oldPath);
			System.out.println(newPath);

			if (h.SaveFile(is, newPath)) {

				out.print("updated successfully");
				Message msg = new Message("Profile Details is Updated", "success", "alert-success");
				s.setAttribute("msg", msg);
			} else {
				Message msg = new Message("Something Went! Wrong", "error", "alert-danger");
				s.setAttribute("msg", msg);
			}

			is.close();

		} else {
			Message msg = new Message("Something Went! Wrong", "error", "alert-danger");
			s.setAttribute("msg", msg);
			out.print("not updated ");
		}
		response.sendRedirect("profile.jsp");

	}

}
