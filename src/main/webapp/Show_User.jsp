<%@page import="com.tech.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User u = (User) session.getAttribute("CurrentUser");
if (u == null) {
	response.sendRedirect("Login_page.jsp");
}

   User postUser=(User)session.getAttribute("PostUser");
   
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
 background: url(image/bg.jpg);
 background-size: cover;
 background-attachment: fixed;
}
</style>
</head>
<body>
	<div class="container text-center">
		<div class="card">
		  <div class="card-header">
		  <img src="image/<%=postUser.getProfile()%>" class="img-fluid"
			style="border-radius: 50%; max-width: 120px; max-height: 100px">
		
		
		<h5 class="mt-3"><%=postUser.getName()%></h5>
		</div>
		<div id="profile-details" class="card-body">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">ID:</th>
						<td><%=postUser.getId()%></td>

					</tr>
					<tr>
						<th scope="row">Email:</th>
						<td><%=postUser.getEmail()%></td>

					</tr>
					<tr>
						<th scope="row">Gender:</th>
						<td><%=postUser.getGender()%></td>

					</tr>
					<tr>
						<th scope="row">About:</th>
						<td><%=postUser.getAbout()%></td>

					</tr>
					<tr>
						<th scope="row">Registration Date:</th>
						<td><%=postUser.getRtime().toString()%></td>

					</tr>
				</tbody>
			</table>
		</div>
		</div>

	</div>
</body>
</html>