<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.Entity.User"%>
<%@ page import="com.Entity.LoginDetail"%>
<%@ page import="com.dao.LoginDao"%>
<%@ page import="com.db.HibernateUtils"%>
<%@ page import="java.util.List"%>
<%@ page import="com.Entity.SimpleEncryption" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #e7ffd7;
}

.welcome-container {
	margin-top: 50px;
}

.card {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#alertBox {
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 1055;
	min-width: 300px;
}
</style>

</head>
<body>
	<c:if test="${empty user}">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary border">
		<div class="container">
			<a class="navbar-brand" href="#">KeyVault</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<form action="Logout" method="post">
							<button type="submit" class="btn btn-outline-danger">Log
								Out</button>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- JSP -->
	<c:if test="${not empty successMsg}">
		<div class="alert alert-success alert-dismissible fade show"
			role="alert" id="alertBox">
			${successMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<c:remove var="successMsg" />
	</c:if>
	<c:if test="${not empty failMsg}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert" id="alertBox">
			${failMsg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<c:remove var="failMsg" />
	</c:if>

	<!-- Add Login -->
	<div class="modal fade bg-dark bg-opacity-50" id="addModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Add
						Login</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="addLogin" method="post">
					<div class="modal-body">
						<label class="form-label">Name</label> <input type="text"
							class="form-control" name="name" required /> <label
							class="form-label">Email address</label> <input type="email"
							class="form-control" name="email1" required />
						<div class="row">
							<div class="col-md-6">
								<label class="form-label">Username</label> <input type="text"
									class="form-control" name="username" required />
							</div>
							<div class="col-md-6">
								<label class="form-label">Password</label> <input
									type="password" class="form-control" required name="password" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="form-label">Alternate Email</label> <input
									type="email" class="form-control" name="email2" />
							</div>
							<div class="col-md-6">
								<label class="form-label">Website/Url</label> <input type="text"
									class="form-control" name="website" />
							</div>
						</div>
						<label class="form-label">Note</label>
						<div class="row mx-1">
							<textarea class="form-contol col-md-12" name="note"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success">Add</button>
						<button type="reset" class="btn btn-outline-danger"
							data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Edit Modal -->
	<div class="modal fade bg-dark bg-opacity-50" id="editModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="editModalLabel">Edit Login</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="editLogin" method="post">
						<input type="hidden" id="edit-id" name="id" /> <label
							class="form-label">Name</label> <input type="text"
							class="form-control" id="edit-name" name="name" required /> <label
							class="form-label">Email address</label> <input type="email"
							class="form-control" id="edit-email1" name="email1" required />
						<div class="row">
							<div class="col-md-6">
								<label class="form-label">Username</label> <input type="text"
									class="form-control" id="edit-username" name="username"
									required />
							</div>
							<div class="col-md-6">
								<label class="form-label">Password</label> <input
									type="text" class="form-control" id="edit-password"
									name="password" required />
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label class="form-label">Alternate Email</label> <input
									type="email" class="form-control" id="edit-email2"
									name="email2" />
							</div>
							<div class="col-md-6">
								<label class="form-label">Website/Url</label> <input type="text"
									class="form-control" id="edit-website" name="website" />
							</div>
						</div>
						<label class="form-label">Note</label>
						<textarea class="form-control" id="edit-note" name="note"></textarea>
						<div class="mt-2">
							<button type="submit" class="btn btn-outline-success">Save
								Changes</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- View Login -->
	<div class="modal fade bg-dark bg-opacity-50" id="viewModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">View All
						Logins</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<%
				LoginDao loginDao = new LoginDao(HibernateUtils.getSessionFactory());
				User user = (User) session.getAttribute("user");
				List<LoginDetail> list = loginDao.getAllLogins(user);
				%>
				<div class="modal-body">
					<div class="container fluid">
						<%
						if (list.size() == 0) {
						%>
						<div>
							<p class="text-secondary fw-normal">No Logins</p>
						</div>
						<%
						}
						%>
						<div class="accordion" id="accordionExample">
							<%
							for (LoginDetail login : list) {

								login = login.decrypt(login);
							%>
							<div class="accordion-item">
								<h2 class="accordion-header">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse" data-bs-target="#<%=login.getId()%>"
										aria-expanded="true" aria-controls="collapseOne"><%=login.getName()%></button>
								</h2>
								<div id="<%=login.getId()%>" class="accordion-collapse collapse"
									data-bs-parent="#accordionExample">
									<div class="accordion-body">
										<form action="addLogin" method="post">
											<label class="form-label">Email address</label> <input
												class="form-control" type="text" name="email"
												value=<%=login.getEmail1()%> readonly />
											<div class="row">
												<div class="col-md-4">
													<label class="form-label">Username</label> <input
														class="form-control" type="text" name="username"
														value=<%=login.getUsername()%> readonly />
												</div>
												<div class="col-md-6">
													<label class="form-label">Password</label> <input
														class="form-control" id="<%=login.getId()%>pass"
														type="password" name="password"
														value="<%=login.getPassword()%>" readonly />
												</div>
												<div class="col-md-1">
													<label class="form-label">Copy</label>
													<button type="button"
														onClick="myFunction('<%=login.getId()%>pass')"
														class="btn btn-outline-dark">
														<img alt=""
															src="https://img.icons8.com/?size=24&id=86206&format=png">
													</button>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label class="form-label">Alternate Email</label> <input
														class="form-control" type="email" name="email2"
														value="<%=login.getEmail2()%>" readonly />
												</div>
												<div class="col-md-6">
													<label class="form-label">Website/Url</label> <input
														class="form-control" type="text" name="website"
														value="<%=login.getWebsite()%>" readonly />
												</div>
											</div>
											<label class="form-label">Note</label>
											<div class="row mx-1">
												<textarea class="form-contol col-md-12" name="note" readonly><%=login.getNote()%></textarea>
											</div>
											<div></div>
										</form>
										<div class="mt-2 container-md row">
											<div class="col-3">
												<a href="deleteLogin?id=<%=login.getId()%>">
													<button class="btn btn-outline-danger">Delete</button>
												</a>
											</div>
											<div class="col-3">
												<button class="btn btn-outline-primary"
													data-bs-toggle="modal" data-bs-target="#editModal"
													onclick="populateEditModal('<%=login.getId()%>', '<%=login.getName()%>', '<%=login.getEmail1()%>', '<%=login.getUsername()%>', '<%=login.getPassword()%>', '<%=login.getEmail2()%>', '<%=login.getWebsite()%>', '<%=login.getNote()%>')">Edit</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Generate Password -->
	<div class="modal fade bg-dark bg-opacity-50" id="generatorModal"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Password
						Generator</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-md row g-lg-3">
						<label class="form-label">Password Length</label> <input
							class="form-control" type="number" id="password-length" min="4"
							max="50" value="12">

						<div class="container ">
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="include-numbers"> <label class="form-check-label">Include
									Numbers</label>
							</div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="include-special"> <label class="form-check-label">Include
									Special Characters</label>
							</div>
						</div>
						<div class="col-md-3">
							<button class="btn btn-outline-success"
								onclick="generatePassword()">Generate</button>
						</div>
						<div class="col-md-7">
							<input class="form-control" id="password-output" readonly />
						</div>
						<div class="col-md-1">
							<button type="button"
								onClick="myFunction('password-output')"
								class="btn btn-outline-dark">
								<img alt=""
									src="https://img.icons8.com/?size=24&id=86206&format=png">
							</button>
						</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Welcome Section -->
	<div class="container welcome-container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-body text-center">
						<h2 class="card-title">
						<%
						try{
								user.setUsername(SimpleEncryption.decrypt(user.getUsername()));
							} catch(Exception ex){
								ex.printStackTrace();
							}
							%>
							Welcome, <%=user.getUsername() %>!
						</h2>
						<p class="card-text">You have successfully logged in. Explore
							your dashboard and manage your activities efficiently.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Features Section -->
	<div class="container mt-5">
		<h3 class="text-center mb-4">Features</h3>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Add Login</h5>
						<p class="card-text">Easily add and save login details for all
							your accounts in one secure place.</p>
						<a href="#" class="btn btn-outline-primary"
							class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#addModal">Add</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">View Logins</h5>
						<p class="card-text">View, edit, or delete your saved login
							details effortlessly, all in one place.</p>
						<a href="#" class="btn btn-outline-primary"
							class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#viewModal">View</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Password Generator</h5>
						<p class="card-text">Description of the third feature goes
							here. It enhances productivity.</p>
						<a href="#" class="btn btn-outline-primary"
							class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#generatorModal">Generate</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3 mt-5">
		<p>&copy; 2024 KeyVault. All rights reserved.</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		function myFunction(inputid) {
			console.log("clicked");
			var copyText = document.getElementById(inputid);

			// Select the text in the input field
			copyText.select();
			copyText.setSelectionRange(0, 99999); // For mobile compatibility

			// Copy the text to clipboard
			navigator.clipboard.writeText(copyText.value)
		}

		function populateEditModal(id, name, email1, username, password,
				email2, website, note) {

			console.log("called");
			document.getElementById("edit-id").value = id;
			document.getElementById("edit-name").value = name;
			document.getElementById("edit-email1").value = email1;
			document.getElementById("edit-username").value = username;
			document.getElementById("edit-password").value = password;
			document.getElementById("edit-email2").value = email2;
			document.getElementById("edit-website").value = website;
			document.getElementById("edit-note").value = note;
		}

		function generatePassword() {
			const length = document.getElementById('password-length').value;
			const includeNumbers = document.getElementById('include-numbers').checked;
			const includeSpecial = document.getElementById('include-special').checked;

			const upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			const lowerCase = "abcdefghijklmnopqrstuvwxyz";
			const numbers = "0123456789";
			const specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?/";

			let characterPool = upperCase + lowerCase;

			if (includeNumbers) {
				characterPool += numbers;
			}

			if (includeSpecial) {
				characterPool += specialChars;
			}

			let password = "";
			for (let i = 0; i < length; i++) {
				const randomIndex = Math.floor(Math.random()
						* characterPool.length);
				password += characterPool[randomIndex];
			}

			const outputDiv = document.getElementById('password-output');
			outputDiv.value = password;
		}
	</script>
</body>
</html>