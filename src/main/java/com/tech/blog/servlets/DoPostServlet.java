package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class DoPostServlet
 */
@WebServlet("/DoPostServlet")
@MultipartConfig
public class DoPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoPostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		String Cat = request.getParameter("pCat");
		String Title = request.getParameter("pTitle");
		String content = request.getParameter("pContent");
		String code = request.getParameter("pCode");
		Part pic = request.getPart("pPic");
		String picName = pic.getSubmittedFileName();
		int catId = Integer.parseInt(Cat);

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("CurrentUser");
		int userId = u.getId();

		Post post = new Post(Title, content, code, picName, catId, userId);
		PostDao pDao = new PostDao(ConnectionProvider.getConnection());

		Helper h = new Helper();
		InputStream Is = pic.getInputStream();

		if (pDao.SavePost(post)) {
			String location = request.getRealPath("/") + "blog_pics" + File.separator + picName;
			h.SaveFile(Is, location);
			

			out.print("done");
		} else {
			out.print("error");
		}
		Is.close();

	}

}
