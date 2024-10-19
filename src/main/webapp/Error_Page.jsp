<%@page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
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
	<div class="container text-center mt-5">
	  <img  src="image/Error.png" class="img-fluid ">
	  <h3 class="display-3 mt-5">Sorry Something Went Wrong!.....</h3>
	  <a class="btn primary-background mt-5 text-white btn-lg" href="index.jsp">Home</a>
	</div>
</body>
</html>