<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">



	<%
	Thread.sleep(800);

	PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
	int catId = Integer.parseInt(request.getParameter("id"));
	ArrayList<Post> allPost;
	if (catId == 0) {
		allPost = dao1.GetAllPost();
	} else {
		allPost = dao1.GetPostById(catId);
	}
	if (allPost.size() == 0) {
		out.println("<b class='display-3 text-center mt-4'> No Related Post is Present!...<b>");
		return;
	}
	for (Post p : allPost) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" src="blog_pics/<%=p.getpPic()%> "
				alt="Card image cap">
			<div class="card-body">
				<b><%=p.getpTitle()%> </b>
				<p>
					<%=p.getpContent()%>
				</p>
			</div>
			<div class="card-footer primary-background  text-center">

				<%
				  LikeDao likedao = new LikeDao(ConnectionProvider.getConnection());
				  User u1 = (User) session.getAttribute("CurrentUser");
				%>

				<a href="DetailedPost.jsp?post_id=<%=p.getpId()%>"
					class="btn btn-outline-light btn-sm ">Read More...</a>
				<button href="#!" class="btn btn-outline-light btn-sm"
					onclick="AddLike(<%=p.getpId()%> , <%=u1.getId()%>,this )">
					<i class="fa-regular fa-thumbs-up"></i><span class="like-counter">
						<%=likedao.CountLikeOnPost(p.getpId())%>
					</span>
				</button>
				<!-- <button href="#!" class="btn btn-outline-light btn-sm ">
					<i class="fa-regular fa-comment"></i> <span>10</span>
				</button> -->
			</div>
		</div>
	</div>
	<%
	}
	%>
</div>

<%
String path = "js/script.js";
%>
<script src="<%=path%>"></script>
