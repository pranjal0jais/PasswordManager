<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KeyVault</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
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

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top"
		style="box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">KeyVault</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><button class="nav-link"
						data-bs-toggle="modal" data-bs-target="#aboutUsModal">About Us</button >
					</li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-bs-toggle="modal" data-bs-target="#contactUsModal">Contact
							Us</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Explore </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#features">Features</a></li>
							<li><a class="dropdown-item" href="#testimonials">Testimonials</a></li>
						</ul></li>
				</ul>
				<div>
					<a class="btn btn-outline-success" href="#" data-bs-toggle="modal"
						data-bs-target="#loginModal">Login</a> <a
						class="btn btn-outline-success" href="#" data-bs-toggle="modal"
						data-bs-target="#signupModal">Sign Up</a>
				</div>
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

	<!-- ContactUsModal -->
	<div class="modal fade" id="contactUsModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Contact
						Us</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>We’d love to hear from you! Whether you have a question,
						feedback, or need support, our team at KeyVault is here to help.</p>
					<h3>How to Reach Us:</h3>
					<p>
					<ul>
						<li>Email: For general inquiries, please email us at <strong>contact@keyvault.com</strong>.
						</li>
						<li>Support: For technical assistance or support, reach out
							to <strong>support@keyvault.com</strong>.
						</li>
						<li>Phone: Call us at <strong></strong>+1 (800) 123-4567</strong> (Mon
							- Fri, 9 AM - 6 PM EST).
						</li>
					</ul>
					</p>
					<h3>Our Office:</h3>
					<p>KeyVault Inc. 1234 Hingewadi, Pune - 124156 Maharstra, India
					</p>
					<h3>Our Socials:</h3>
					<p>Stay Connected on Social Media:
					<ul>
						<li><a href="">facebook</a></li>
						<li><a href="">Instagram</a></li>
						<li><a href="">Linkedin</a></li>
					</ul>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<!-- AboutUsModal -->
	<div class="modal fade modal-xl modal-fullscreen-xl-down"
		id="aboutUsModal" data-bs-backdrop="static" data-bs-keyboard="false"
		tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">
						<strong>About Us</strong>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Welcome to KeyVault – your ultimate solution for securing
						and managing your passwords. At KeyVault, our mission is simple:
						to provide you with a safe, convenient, and reliable way to
						protect your online identity and sensitive information. Founded in
						[Year], we understand the importance of online security in today’s
						digital world. With countless accounts, passwords, and personal
						details to manage, it’s easy to feel overwhelmed. That's why we’ve
						created a password manager that combines cutting-edge security
						with ease of use. Whether you’re an individual, a small business,
						or a large enterprise, KeyVault has a solution for everyone. At
						KeyVault, we believe that privacy is a right, not a privilege.
						That's why we use the latest encryption technology to ensure that
						all your passwords and sensitive data are protected, while giving
						you the peace of mind that only you have access to them. Our
						user-friendly platform makes managing passwords, generating strong
						credentials, and syncing across devices simple and secure.</p>
					<h3>Why Choose KeyVault?</h3>
					<p>
					<ul>
						<li>Top-tier Security: We utilize AES-256 encryption and
							other advanced security protocols to keep your data safe.</li>
						<li>Seamless Sync: Your passwords are accessible across all
							your devices – whether you’re on your phone, tablet, or computer.</li>
						<li>Easy to Use: Designed with simplicity in mind, KeyVault
							is intuitive and straightforward for users of all tech levels.</li>
						<li>Dedicated Support: Our customer support team is always
							ready to assist you with any questions or issues, 24/7.</li>
					</ul>
					Thank you for trusting KeyVault to protect your digital life. We
					are committed to keeping your data secure, so you can focus on what
					matters most.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Modal -->
	<div class="modal fade" data-bs-backdrop="static" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Login to
						an Existing Account</h1>
				</div>
				<form method="post" action="Login">
					<div class="modal-body">
						<div class="mb-3">
							<label for="email" class="col-form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="johnDoe@gmail.com" required>
						</div>

						<div class="mb-3">
							<label for="password" class="col-form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-primary">Login</button>
						<button type="reset" class="btn btn-outline-danger"
							data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- SignUp Modal -->
	<div class="modal fade" data-bs-backdrop="static" id="signupModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Create a
						KeyVault Account</h1>
				</div>
				<form method="post" action="Register">
					<div class="modal-body">

						<div class="mb-3">
							<label for="email" class="col-form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="johnDoe@gmail.com" required>
						</div>

						<div class="mb-3">
							<label for="username" class="col-form-label">Username</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="John Doe" required>
						</div>

						<div class="mb-3">
							<label for="password" class="col-form-label">Password</label> <input
								type="password" class="form-control" id="password"
								name="password required">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-primary">Create
							Account</button>
						<button type="reset" class="btn btn-outline-danger"
							data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- carousel -->
	<div id="carouselExampleCaptions" class="carousel slide mb-5">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner carousel-fade">
			<div class="carousel-item active ">
				<img src="images/home1.jpg" class="d-block w-100" width="1400px"
					height="400px" alt="..."
					style="object-fit: cover; object-position: center;">
				<div class="carousel-caption d-none d-md-block">
					<h5>Welcome to KeyVault</h5>
					<p>Your one place to manage your Passwords</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="images/home2.jpg" class="d-block w-100" width="1400px"
					height="400px" alt="..."
					style="object-fit: cover; object-position: center;">
				<div class="carousel-caption d-none d-md-block">
					<h5>Encrytion technology</h5>
					<p>Keeps your data safe from Intrutions</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="images/home3.jpg" class="d-block w-100" width="1400px"
					height="400px" alt="..."
					style="object-fit: cover; object-position: center;">
				<div class="carousel-caption d-none d-md-block">
					<h2>Create your Account Now...</h2>
					<a class="btn btn-light" href="#" data-bs-toggle="modal"
						data-bs-target="#signupModal">Create an Account Now!</a>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- features -->
	<div class="container px-4 py-5 border-top" id="features">
		<div
			class="row row-cols-1 row-cols-md-2 align-items-md-center g-5 py-5">
			<div class="col d-flex flex-column align-items-start gap-2">
				<h2 class="fw-bold text-body-emphasis">Top Features for an
					Advanced and Secure Password Manager</h2>
				<p class="text-body-secondary">A secure password manager should
					include encrypted storage, a strong password generator,
					multi-device sync, ensuring safety and convenience for managing
					credentials.</p>
			</div>

			<div class="col">
				<div class="row row-cols-1 row-cols-sm-2 g-4">
					<div class="col d-flex flex-column gap-2 border-start">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-4 rounded-3">
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis">Secure
							Password Storage</h4>
						<p class="text-body-secondary">Protect with a master password.</p>
					</div>

					<div class="col d-flex flex-column gap-2 border-start">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-4 rounded-3">
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis">Password
							Generator</h4>
						<p class="text-body-secondary">Generate secure, random
							passwords with customizable length and complexity (e.g.,
							including special characters, numbers, etc.).</p>
					</div>

					<div class="col d-flex flex-column gap-2 border-start">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-4 rounded-3">
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis">Editable
							Entries</h4>
						<p class="text-body-secondary">Update or modify saved
							passwords and details anytime.</p>
					</div>

					<div class="col d-flex flex-column gap-2 border-start">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-4 rounded-3">
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis">Unlimited
							Entries</h4>
						<p class="text-body-secondary">Store as many passwords as you
							need without limitations.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- testimonials -->
	<div
		class="row p-3 d-flex flex-wrap justify-content-center align-items-start text-center border-top border-bottom py-5"
		id="testimonials">
		<h3>Testimonials</h3>
		<div
			class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
			<img class="bd-placeholder-img rounded-circle" src="images/pp1.jpg"
				alt="pp" width="140" height="140"
				style="object-position: top; object-fit: cover;">
			<h2 class="fw-small fs-4">John D. - Business Owner</h2>
			<p>"This password manager has completely transformed how I manage
				my business accounts. It's easy to use, secure, and I love the
				auto-fill feature. I no longer worry about forgetting my passwords!"</p>

		</div>
		<div
			class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
			<img class="bd-placeholder-img rounded-circle" src="images/pp2.jpg"
				alt="pp" width="140" height="140"
				style="object-position: top; object-fit: cover;">
			<h2 class="fw-small fs-4">Emily R. - Freelancer</h2>
			<p>"As a freelancer, I work across many platforms, and this tool
				keeps my login details organized and safe. The password generator is
				a lifesaver, and the sync across devices is seamless."</p>
		</div>
		<!-- /.col-lg-4 -->
		<div
			class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
			<img class="bd-placeholder-img rounded-circle" src="images/pp3.jpg"
				alt="pp" width="140" height="140"
				style="object-position: center; object-fit: cover;">
			<h2 class="fw-small fs-4">Michael T. - Software Developer</h2>
			<p>"Security is a top priority for me, and this password manager
				gives me peace of mind. The encrypted storage and two-factor
				authentication make it a reliable solution for my daily needs."</p>
		</div>
		<!-- /.col-lg-4 -->
		<div
			class="col-sm-3 d-flex flex-column justify-content-center align-items-center">
			<img class="bd-placeholder-img rounded-circle" src="images/pp4.jpg"
				alt="pp" width="140" height="140"
				style="object-position: top; object-fit: cover;">
			<h2 class="fw-small fs-4">David H. - Entrepreneur</h2>
			<p>"I'm always on the go, and this password manager works
				flawlessly on both my phone and laptop. It's fast, secure, and has
				saved me countless hours of password recovery."</p>
		</div>
	</div>

	<!-- footer -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#carouselExampleCaptions"
					class="nav-link px-2 text-body-secondary">Home</a></li>
				<li class="nav-item"><a href="#features"
					class="nav-link px-2 text-body-secondary">Features</a></li>
				<li class="nav-item"><a href="#" data-bs-toggle="modal"
					data-bs-target="#contactUsModal"
					class="nav-link px-2 text-body-secondary">Contact Us</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-body-secondary" data-bs-toggle="modal"
					data-bs-target="#aboutUsModal">About</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-body-secondary">FAQs</a></li>
			</ul>
			<p class="text-center text-body-secondary">© 2024 KeyVault, Inc</p>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>