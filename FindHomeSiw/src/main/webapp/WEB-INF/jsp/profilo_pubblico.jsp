<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<li><a class="nav-link "href="/"><i class="fas fa-house-user"></i> Home </a></li>
							<li><a class="nav-link "href="/elencoAnnunci"> <i class="fas fa-building"></i> Annunci</a></li>
							<li><a class="nav-link  "href="/elencoVenditori"> <i class="fas fa-user-tie"></i> Venditori</a></li>
							<li><a  class="nav-link" href="/contatti"><i class="fas fa-address-card"></i>  Contatti</a></li>

						</ul>

						<div class="d-flex ">

							<c:if test="${username==null }">

							<a href="/" class="btn myButton"> Torna Alla Home</a>
							</c:if>


						
							<c:if test="${username!=null }">
								<c:if test="${accesso!= 'Venditore' }">
									<a class="btn myButton " href="/ilMioCarrello/${id}">
										Carrello<i class="fas fa-shopping-cart"></i>
									</a>
								</c:if>
								<div class="btn-group">
									<button type="button" class="btn myButton dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false">Ciao
										${nome}</button>
									<ul class="dropdown-menu"
										style="min-width: 100%; margin-top: 10%;">


										<li><a class="dropdown-item" href="/"> <i
												class="fas fa-user"></i> Torna Alla Home
										</a></li>


										

										<li id="userIdLog" class="dropdown-item text-muted "
											value="${id}">ID: ${id}</li>



									</ul>
								</div>

							</c:if>
						






						</div>
					</div>

				</div>
			</nav>
		</div>
	</header>

	

	<section id="copertina">

		<div class="container text-center">

<button id="filtraCerca"></button>
			
		</div>
	</section>

	<section class="contatori">
		<div class="container">

			<div class="row ">

				<div class="col-lg-4 col-4 text-center">
					<span id="numUtenti"></span>
					<p>Utenti</p>

				</div>

				<div class="col-lg-4 col-4 text-center">
					<span id="numAnnunci"></span>
					<p>Annunci</p>
				</div>

				<div class="col-lg-4 col-4 text-center">
					<span id="numVenditori"></span>
					<p>Venditori</p>
				</div>


			</div>

		</div>
</section>
	<section style="background-color: #eee;">
		<div class="container py-5">


			<div class="row">
				<div class="col-lg-4" style="margin-top: 2px;">
					<div class="card mb-5" style="margin-top: 2px;">
						<div class="card-body text-center">
							<img
								src="${utente.img}";
								alt="avatar" class="rounded-circle img-fluid"
								style="width: 150px;">

							<h5 id="nomeUtenteInfo0" class="my-4">${utente.nome }</h5>
							<h5 id="cognomeUtenteInfo0" class="my-4">${utente.cognome }</h5>
							<a href="mailto:"+ ${utente.email} +">Scrivi una mail</a>
							<p class="text-muted mb-1">${utente.accesso}</p>



						</div>
					</div>

				</div>
				<div class="col-lg-8">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Nome</p>
								</div>

								<div id="nomeUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${utente.nome }</p>



								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Cognome</p>
								</div>

								<div id="cognomeUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${utente.cognome }</p>

								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">ID</p>
								</div>

								<div class="col-sm-9">
									<li id="user" class="list-group text-muted mb-0" value="${utente.id}">${utente.id}</li>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div id="emailUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${utente.email }</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Username</p>
								</div>
								<div id="usernameUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${utente.username }</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Tipologia</p>
								</div>
								<div class="col-sm-9">

									<p class="text-muted mb-0">${utente.accesso}</p>


								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section  class="contenuti">
      <div class="container">
	  <div class="row">
          <div class="col-lg-4">
            <div class="section-title ">
              <h2>Annunci</h2>
              <p>Annunci publicati da questo venditore <a href="/elencoAnnunci">vedi tutti >></a></p>
            </div>
          </div>
          <div class="col-lg-8">
            <div id ="row1"class="row">

     

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
							<li><a href="/elencoAnnunci">Annunci</a></li>
							<li><a href="/elencoVenditori">Venditori</a></li>
							<li><a href="/contatti"> Contatti</a></li>

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
		
	<script type="text/javascript" src="../js/main.js"></script>	
	<script type="text/javascript" src="../js/profiloPubblico/profilo_pubblico.js"></script>
	
	
</body>
</html>