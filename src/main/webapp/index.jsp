<%@page errorPage="Error_page.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.helper.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<!-- css code -->
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
</style>
</head>
<body>

	<!-- using  navbar -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- banner -->
	<div class="container-fluid m-0 p-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>A blog dedicated to sharing in-depth programming tutorials,
					best practices, and problem-solving techniques for developers of
					all levels. Whether you’re a beginner learning your first language
					or an experienced coder, you’ll find valuable insights on
					everything from algorithms to web development frameworks.</p>
				<p>A hub for developers seeking the latest trends, tools, and
					technologies in the programming world. Explore hands-on guides,
					code snippets, and expert advice across various programming
					languages like Python, Java, C++, and JavaScript, aimed at keeping
					you ahead in the ever-evolving tech landscape.</p>
				<button class="btn btn-outline-light btn-lg">
					<span class="	fa fa-user-plus"></span> Starts! It's Free
				</button>
				<a href="Login_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa-solid fa-right-to-bracket all-margin"></span>Login
				</a>
			</div>
		</div>
	</div>
	<!-- cards  -->

	<div class="container">
		<div class="row mb-3">
			<!-- in 1 row 12 col -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- in 1 row 12 col -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
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



</body>
</html>