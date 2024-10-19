<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<!-- css links -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 92%, 58% 100%, 27% 93%, 0 100%, 0%
		30%);
}
</style>
</head>
<body>
	<%@ include file="normal_navbar.jsp"%>
	<main class="primary-background banner-background pb-5">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header  text-center text-white primary-background">
						<span class="fa-solid fa-user fa-2x"></span> <br> Register
						Here
					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input
									type="text" name="user_name" class="form-control"
									id="user_name" aria-describedby="emailHelp"
									placeholder="Enter Name" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control"
									id="exampleInputPassword1" placeholder="Password" required >
							</div>

							<div class="form-group">
								<label for="user_gender" > Select Gender</label> <br> <input
									type="radio" name="user_gender" value="Male" required>Male <input
									type="radio" name="user_gender" value="Female" required>Female
							</div>
							<div class="form-group">
								<textarea name="user_about" class="form-control" rows="5"
									placeholder="Enter Something About yourself" required></textarea>
							</div>
							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Condition</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none">
								<span class="fa fa-refresh fa-spin fa-3x"></span>
								<h4>Please Wait.......</h4>
							</div>

							<button id="submit-btn" type="submit" class="btn btn-primary container">Submit</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</main>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			console.log("loaded........");
			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				/* taking form data */
				let form = new FormData(this);
				$('#submit-btn').hide();
				$('#loader').show();
				$.ajax({
					url : "RegisterServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						setTimeout(function() {
							$('#submit-btn').show();
							$('#loader').hide();
						}, 100);
						
			            if(data.trim()==='done'){	
					 	swal("Registered Successfully we are redirecting to login page")
						.then((value) => {
						   window.location="Login_page.jsp";
						}); 
						
						}else{
							swal(data);
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown);
						swal({
							icon:"warning",
							text:"SomeThing Went Wrong! Please Try again"
						});
						
						setTimeout(function() {
							$('#submit-btn').show();
							$('#loader').hide();
						}, 100);
						
					},
					processData : false,
					contentType : false
				});
			})

		});
	</script>
</body>
</html>