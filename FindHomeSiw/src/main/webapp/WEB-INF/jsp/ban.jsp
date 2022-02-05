<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- BOOTSTRAP 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- CSS  -->
<link rel="stylesheet" href="../css/style.css">

<!-- ICONE -->
<script src="https://kit.fontawesome.com/ffee47c1d4.js" crossorigin="anonymous"></script>

</head>
<body>

	<header>
		<div class="container">
			<nav class="navbar navbar-expand-lg " >
				<div class="container ">
					<div class="logo">

						<h1>
							<a href="/">FindHome</a>
						</h1>

					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
						aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation" >
						<span class="navbar-toggler-icon" > <i class="fas fa-bars"></i></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">


						<ul class="navbar-nav" id="myUl">
							<li><a class="nav-link  " href="/">Home</a></li>
							
						</ul>

						<div class="d-flex ">

							


<a href="/" class="btn myButton"> Torna Alla Home</a>




						</div>
					</div>

				</div>
			</nav>
		</div>
	</header>

	<section id="copertina">

		<div class="container text-center">
			
		
				<a id="filtraCerca" href="/" class="btn myButton"> Torna alla Home</a>
				
		
		</div>
	</section>



	<section class="contenuti">
		<div class="container">

			<div class="row">
				
					<div class="section-title">
						<h2>Sei Stato Bannato </h2>
						<p>
							Torna alla home e registrati con un altro account o manda una mail all'amministratore per riaccedere al sistema <a href="/">torna alla home >></a>
						</p>
						<p>
							<a href="mailto:forspotify759@gmail.com ">Scrivi una mail all'admin</a>
						</p>
					</div>
				</div>
				


			</div>

		</div>
	</section>

	

	<footer class="footer">

		<div class="footer-superiore">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-12 footer-contatti">
						<h3>FindHome</h3>
						<p>
							Unical<br> Rende, CS <br> Italia <br> <br> <strong>Phone:</strong>
							+39 333 33 33 333<br> <strong>Email:</strong>
							forspotify759@gmail.com<br>
						</p>
					</div>

					<div class="col-lg-4 col-md-12 footer-nav">
						<h4>Tutte le pagine</h4>
						<ul>
							<li><a href="/">Home</a></li>
							

						</ul>
					</div>



					<div class="col-lg-4 col-md-12 footer-newsletter">
						<h4>Iscriviti Alle Newsletter</h4>
						<p>Inserisci la tua email per rimanere aggiornato sulle ultime
							novità</p>

						<input id="newsletterEmail" type="email" name="email"><a
							id="newsletter" class=" btn myButton"> Iscriviti</a>

					</div>

				</div>
			</div>
		</div>
		<div class="container-fluid footer-inferiore">
			<div class="container d-md-flex py-4 ">

				<div class="me-md-auto text-center text-md-start ">
					<div>
						©Copyright <strong><span>FindHome</span></strong>. All Rights
						Reserved
					</div>
					<div class="credits">
						<a>Designed by Domenico Andrianò Siw project</a>
					</div>
				</div>
				<div class="social-links text-center text-md-right pt-3 pt-md-0">
					<a href="#" class="twitter"><i class="fab fa-twitter"></i></a> <a
						href="#" class="facebook"><i class="fab fa-facebook-f"></i> </a> <a
						href="#" class="instagram"><i class="fab fa-instagram"></i></a> <a
						href="#" class="google-plus"><i class="fab fa-google-plus-g"></i></a>
					<a href="#" class="linkedin"><i class="fab fa-linkedin-in"></i></a>
				</div>
			</div>
		</div>
	</footer>

	<!-- AJAX -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
	

</body>
</html>