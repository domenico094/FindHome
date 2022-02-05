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

								<a class="btn myButton" data-bs-toggle="modal"
									data-bs-target="#exampleModalLogin">Login <i
									class="fas fa-sign-in-alt"></i></a>

								<!-- Modal -->
								<div class="modal fade" id="exampleModalLogin" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Login</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">


												<form method="post" action="loginServices">
													Username: <input type="text"
														class="form-control form-control" name="username" /> <br />
													Password: <input id="MyPassword" type="password"
														class="form-control form-control" name="pass" /> <input
														id="showPass" type="checkbox"><a> Mostra
														Password</a> <br /> <br />
													<button type="button" class="btn btn-danger"
														data-bs-dismiss="modal">Close</button>
													<input class="btn btn-primary" type="submit" />

												</form>



											</div>
										</div>
									</div>
								</div>

								<a id="navBtnRegistrazione" class="btn myButton"
									data-bs-toggle="modal" data-bs-target="#exampleModalAddUser">Registrati
									<i class="fas fa-user-plus"></i>
								</a>


								<!-- Modal -->
								<div class="modal fade" id="exampleModalAddUser" tabindex="-1"
									aria-labelledby="exampleModalLabelAddUser" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Registrazione</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<form id="form1" action="">
													<div class="row mb-4">
														<div class="col">
															<div class="form-outline">
																<input type="text" id="campoNome" class="form-control" />
																<label class="form-label" for="campoNome">Nome</label>
															</div>
														</div>
														<div class="col">
															<div class="form-outline">
																<input type="text" id="campoCognome"
																	class="form-control" /> <label class="form-label"
																	for="campoCognome">Cognome</label>
															</div>
														</div>
													</div>
													<div class="row mb-4">
														<div class="col">
															<div class="form-outline">
																<input type="text" id="campoEmail" class="form-control" />
																<label class="form-label" for="campoEmail">Email</label>
															</div>
														</div>
														<div class="col">
															<div class="form-outline">
																<input type="text" id="campoUsername"
																	class="form-control" /> <label class="form-label"
																	for="campoUsername">Username</label>
															</div>
														</div>
													</div>

													<div class="row mb-4">
														<div class="col">
															<div class="form-outline">
																<input type="password" id="campoPassword1"
																	class="form-control" /> <label class="form-label"
																	for="campoPassword1">Password</label> <br> <input
																	type="checkbox" id="show1"> <a>Mostra
																	Password</a>
															</div>
														</div>
														<div class="col">
															<div class="form-outline">
																<input type="password" id="campoPassword2"
																	class="form-control" /> <label class="form-label"
																	for="campoPassword2">Conferma Password</label> <br>
																<input type="checkbox" id="show2"> <a>Mostra
																	Password</a>
															</div>
														</div>
													</div>

													<div class="row mb-4">
														<div class="col">
															<div class="form-outline">
																<input type="text" id="campoImgProfilo"
																	class="form-control" /> <label class="form-label"
																	for="campoImgProfilo">Link Immagine Profilo</label>
															</div>
														</div>
														<div class="col">
															<select name='tipoUtente' id="campoTipo"
																style="margin-top: 5px; max-width: 350px;">
																<option value='Acquirente'>Acquirente</option>
																<option value='Venditore'>Venditore</option>

															</select> <br>Tipo Utente
														</div>

													</div>



												</form>


												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-bs-dismiss="modal">Close</button>
													<div class="col">
														<button id="btnRegistra" class="btn btn-primary">
															Registrati</button>
													</div>
												</div>
											</div>
										</div>

									</div>


								</div>


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


										<li><a class="dropdown-item" href="profiloUtente"> <i
												class="fas fa-user"></i> profilo
										</a></li>


										<li><a class="dropdown-item" href="faiLogout"> <i
												class="fas fa-sign-out-alt"></i> Log out

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


			<!-- Button trigger modal -->
			<button id="filtraCerca" type="button" class="btn myButton"
				data-bs-toggle="modal" data-bs-target="#exampleModalRicerca">
				Filtra e Cerca <i class="fas fa-search"> </i>
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModalRicerca" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Filtra Cerca</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="container-fluid ">
								<div class="row">
									<div class="col-6">
										<select class="selectOption" id="mqMin">

											<option value="0" selected>mq min:</option>

											<option id="idOption" value="100">50 mq</option>
											<option value="200">100 mq</option>
											<option value="300">150 mq</option>
											<option value="400">200 mq</option>
											<option value="500">250 mq</option>
											<option value="600">300 mq</option>
											<option value="800">400 mq</option>
											<option value="1000">500 mq</option>
											<option value="5000">2500 mq</option>
											<option value="6000">3000 mq</option>
											<option value="8000">4000 mq</option>
										</select>
									</div>
									<div class="col-6">
										<select class="selectOption" id="mqMax">
											<option value="10000000" selected>mq max:</option>

											<option value="100">100 mq</option>
											<option value="200">200 mq</option>
											<option value="300">300 mq</option>
											<option value="400">400 mq</option>
											<option value="500">500 mq</option>
											<option value="600">600 mq</option>
											<option value="800">800 mq</option>
											<option value="1000">1000 mq</option>
											<option value="5000">5000 mq</option>
											<option value="6000">6000 mq</option>
											<option value="8000">8000 mq</option>


										</select>
									</div>
								</div>

								<div class="row">
									<div class="col-6">
										<select class="selectOption" id="prezzoMin">
											<option value="0.0" selected>prezzo min:</option>

											<option value="500">500,00 €</option>
											<option value="5000">5.000,00 €</option>
											<option value="20000">20.000,00 €</option>
											<option value="50000">50.000,00 €</option>
											<option value="65000">65.000,00 €</option>
											<option value="80000">80.000,00 €</option>
											<option value="100000">100.000,00 €</option>
											<option value="150000">150.000,00 €</option>
											<option value="300000">300.000,00 €</option>
											<option value="425000">425.000,00 €</option>
											<option value="800000">800.000,00 €</option>

										</select>
									</div>
									<div class=" col-6">
										<select class="selectOption" id="prezzoMax">
											<option value="10000000" selected>prezzo max:</option>

											<option value="1000">1.000,00 €</option>
											<option value="10000">10.000,00 €</option>
											<option value="40000">40.000,00 €</option>
											<option value="60000">60.000,00 €</option>
											<option value="75000">75.000,00 €</option>
											<option value="90000">90.000,00 €</option>
											<option value="150000">150.000,00 €</option>
											<option value="300000">300.000,00 €</option>
											<option value="600000">600.000,00 €</option>
											<option value="850000">850.000,00 €</option>
											<option value="1500000">1.500.000,00 €</option>


										</select>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<select class="selectOption" id="Valore">
											<option value="Vendita" selected>Vendita</option>

											<option value="Affitto">Affitto</option>

										</select>
									</div>
									<div class="col-6">
										<select class="selectOption" id="Tipologia">
											<option value="Nullo" selected>Tipologia</option>
											<option value="Appartamento">Appartamento</option>
											<option value="Villa">Villa</option>
											<option value="Villetta">Villetta</option>
											<option value="Ufficio">Ufficio</option>
											<option value="Terreno">Terreno</option>
											<option value="Garage">Garage</option>
											<option value="Magazzino">Magazzino</option>

										</select>
									</div>

									<div id="textButton" class="row">
										<!--Make sure the form has the autocomplete function switched off:-->
										<form autocomplete="off" action="">
											<div class="autocomplete" style="">
												<input id="myInputLuogo" type="text" style="width: 336px;"
													name="myCountry" placeholder="Città"> <a
													id="searching" class="btn btn-primary"
													data-bs-toggle="collapse" href="#collapseExample"> <i
													class="fas fa-search"> </i>
												</a>
											</div>
										</form>

									</div>

									<div class="collapse" id="collapseExample">
										<br>
										<div id="research">
											<div class="container">
												<div class="row">
													<div class="tbodyDiv">
														<form method="GET" action="/provaaa">
															<table id="risultati_ricerca"
																class="table table-striped ">

																<tbody>
																	<tr>
																	</tr>


																</tbody>
															</table>

														</form>
													</div>


												</div>
											</div>



										</div>
									</div>
								</div>



							</div>
						</div>





					</div>
				</div>
			</div>

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

	<section class="contenuti">
		<div class="container">

			<div class="row">
				<div class="col-lg-4">
					<div class="section-title">
				     <h2>Annunci</h2>
              
			
              <p> 	<select class="selectOption" name='tipo ordine' id="campoSortAnnuncio">
				<option  value='prezzoCrescente'>prezzo crescente</option>
				<option value='prezzoDecrescente'>prezzo Decrescente</option>
				<option  value='mqCrescente'>mq Crescente</option>
				<option value='mqDecrescente'>mq Decrescente</option>
				<option  value='idCrescenteAnnuncio'>id crescente</option>
				<option value='idDecrescenteAnnuncio'>id Decrescente</option>

			</select>	<a  id="btnOrdinaAnnuncio" class="btn myButton">ordina</a>
			</p>
					</div>
				</div>
				<div class="col-lg-8">
					<div id="elenco" class="row"></div>
					<br>
					<hr>
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
	<script type="text/javascript" src="../js/elenco_annunci.js"></script>
	
</body>
</html>