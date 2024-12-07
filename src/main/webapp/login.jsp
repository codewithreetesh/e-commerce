<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page</title>
<%@ include file="Alldata/css_js.jsp"%>
</head>
<body>

	<%@ include file="Alldata/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-5 ">
					<div class="card-header  bg-color="blue" text-white" >
						<%@ include file="message.jsp"%>
						<h3>login here!!</h3>
					</div>
					<div class="card-body">
						<form action="AllServlet" method="Get">
							<div class="form-group">
								<label for="email">Email</label> <input type="text"
									class="form-control" id="email" name="email"
									placeholder="Enter User Email" required />
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Enter User Password" required />
							</div>

							<a href="register.jsp" class="text-center d-block mb-2">if
								not register click here</a>

							<div class="container text-center">
								<input type="hidden" name="page" value="login" />

								<button type="submit" class="btn btn-primary">Login</button>


							</div>
							<div class="text-center my-4">
								<hr>
								<h6>or login</h6>
								
							</div>

							<div class="container">

								<div class="mt-4">
									<a href="#" id="google-signin" class="btn btn-danger"> <i
										class="fab fa-google"></i> Sign in with Google
									</a>
								</div>

							</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<%@ include file="Alldata/common_model.jsp"%>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id"
		content="YOUR_CLIENT_ID.apps.googleusercontent.com">
	<script>
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId());
			console.log('Name: ' + profile.getName());
			console.log('Email: ' + profile.getEmail());
		}

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		}
	</script>
</body>
</html>