<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.Annotation.AnnotationTargetAllowed"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page errorPage="Error_Page.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User u = (User) session.getAttribute("CurrentUser");
if (u == null) {
	response.sendRedirect("Login_page.jsp");
}
%>

	<%
       LikeDao ldao=new LikeDao(ConnectionProvider.getConnection()); 
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(0 0, 100% 0, 100% 0, 100% 100%, 69% 89%, 28% 100%, 0 90%, 0 0);
}
body{
 background: url(image/bg.jpg);
 background-size: cover;
 background-attachment: fixed;
}
</style>
</head>
<body>
	<!-- navabar started -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-blog all-margin"></i>TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa-solid fa-house all-margin"></span>Home</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fa-solid fa-list all-margin"></i>
						Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure and Algorithm</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book-o	all-margin"></span> Contacts</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#postModal"><span
						class="fa-solid fa-pen-to-square"></span> Do Post</a></li>

			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item" id="profile" data-toggle="modal"
					data-target="#profile-modal"><a class="nav-link" href="#!"><i
						class="fa-solid fa-user-circle all-margin"></i> <%=u.getName()%> </a></li>

				<li class="nav-item"><a class="nav-link" href="LogOutServlet"><i
						class="fa-solid fa-user all-margin" id="logout"></i>LogOut</a></li>
			</ul>
		</div>
	</nav>
	<!-- navbar ended     -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
	
	<main>
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active c-links" onclick="getAllPosts(0,this)" id="all-link-start">
							All Posts </a>
						<%
						PostDao dao = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> posts = dao.GetCategory();
						for (Category c : posts) {
							
							%>
							<a href="#"
								class="list-group-item list-group-item-action c-links" onclick="getAllPosts('<%= c.getCId() %>',this)"><%=c.getCName() %> </a>
							<%
						}
						%>
						
					</div>
				</div>
				<div class="col-md-8">
				    <div id="loader" class="container text-center">
				     <i class="fa fa-refresh fa-3x fa-spin"></i>
				     <h3 class="mt-3">Loading...</h3>
				    </div>
				    <div id="post-container">
				     
				    </div>
				</div>
			</div>
		</div>
	</main>

	<!-- modal start  -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close text-white" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="image/<%=u.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 120px; max-height: 100px">
						<br>
						<h5 class="mt-3"><%=u.getName()%></h5>
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=u.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=u.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=u.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">About:</th>
										<td><%=u.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registration Date:</th>
										<td><%=u.getRtime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<div id="profile-edit" style="display: none">
							<h3 class="mt-3">Please Edit your details</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th>Id</th>
										<td><%=u.getId()%></td>
									</tr>
									<tr>
										<th>Email:</th>
										<td><input class="form-control" name="user_email"
											type="email" value="<%=u.getEmail()%>"></td>
									</tr>
									<tr>
										<th>Name:</th>
										<td><input class="form-control" name="user_name"
											type="text" value="<%=u.getName()%>"></td>
									</tr>
									<tr>
										<th>Password:</th>
										<td><input class="form-control" name="user_password"
											type="password" value="<%=u.getPassword()%>"></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=u.getGender().toUpperCase()%></td> 
									</tr>
									<tr>
										<th>About:</th>
										<td><textarea rows="3" class="form-control"
												name="user_about" type="text"><%=u.getAbout()%></textarea>
										<td>
									</tr>
									<tr>
										<th>Profile Pic:</th>
										<td><input type="file" name="user_pic"
											class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="profile-edit-btn" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- profile modal end  -->

	<!-- Adding post modal -->

	<!-- Modal -->
	<div class="modal fade" id="postModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="DoPostServlet" method="post" id="doPost"
						enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" name="pCat">
								<option selected disabled>Select Your Category..</option>
								<%
								ArrayList<Category> ls = new ArrayList<Category>();
								PostDao pd = new PostDao(ConnectionProvider.getConnection());
								ls = pd.GetCategory();
								for (Category c : ls) {
								%>
								<option value="<%=c.getCId()%>"><%=c.getCName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter the Post Title" name="pTitle">
						</div>
						<div class="form-group">
							<textarea rows="6" cols="" class="form-control"
								placeholder="Enter the post content" name="pContent"></textarea>
						</div>

						<div class="form-group">
							<textarea rows="6" cols="" class="form-control"
								placeholder="Enter the post code(if any)" name="pCode"></textarea>
						</div>
						<div class="form-group">
							<label>Select Image for your post</label> <input type="file"
								class="form-control" name="pPic">
						</div>

						<button
							class="btn btn-outline-primary container primary-background text-white"
							type="submit" id="Post-btn">Do Post</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- JavaScript code -->

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!-- icon script -->
	<script src="https://kit.fontawesome.com/f144491e85.js"
		crossorigin="anonymous"></script>
		
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;
			$("#profile-edit-btn").click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					$(this).text("Back");
					editStatus = true;
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					$(this).text("Edit");
					editStatus = false;
				}

			})
		})
	</script>
	<script>
	      
	
		 $(document).ready(function() {
			/* alert("hi the documeent is loadded"); *//*  */
			$("#doPost").on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);
				console.log("you have clickded the dopost bttn");
				
				$.ajax({
					url : "DoPostServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						if(data.trim()=="done"){
							swal("Good job!", "You have posted a post Successfully!", "success");

						}else{
							swal("Error!", "Something Went Wrong!", "error");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal("Error!", "Something Went Wrong!", "error");

					},
					processData : false,
					contentType : false
				});
			})
		}) 
	</script>
	<script>
	    
	     function getAllPosts(cid,temp){
	    	 $(".c-links").removeClass('active');
	    	 
	    	 $("#loader").show();
				/* console.log(data); */
				$("#post-container").hide();
	    	 $.ajax({
					url : "Load_post.jsp",
					type : "GET",
					data : {id: cid},
					success : function(data) {
						$("#loader").hide();
						/* console.log(data); */
						$("#post-container").show();
						$("#post-container").html(data);
					     $(temp).addClass('active');
						
					},
					error : function(jqXHR, textStatus, error) {
						console.log(error)
					},
				});
	     }
		$(document).ready(function() {
		  let ref=$("#all-link-start");
			getAllPosts(0,ref);
			
		})
	</script>
</body>
</html>