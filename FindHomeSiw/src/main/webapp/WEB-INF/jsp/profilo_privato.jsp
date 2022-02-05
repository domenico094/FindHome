<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profilo privat</title>
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
<script src="https://kit.fontawesome.com/ffee47c1d4.js"
	crossorigin="anonymous"></script>

</head>
<body>

	<header>
		<div class="container">
			<nav class="navbar navbar-expand-lg ">
				<div class="container ">
					<div class="logo">

						<h1>
							<a href="/">FindHome</a>
						</h1>

					</div>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
						aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"> <i class="fas fa-bars"></i></span>
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


	<section style="background-color: #eee;">
		<div class="container py-5">


			<div class="row">
				<div class="col-lg-4" style="margin-top: 2px;">
					<div class="card mb-5" style="margin-top: 2px;">
						<div class="card-body text-center">
							<img src="${img}" alt="" class="rounded-circle img-fluid"
								style="width: 150px;">

							<h5 id="nomeUtenteInfo0" class="my-4">${nome }</h5>
							<h5 id="cognomeUtenteInfo0" class="my-4">${cognome }</h5>

							<li id="accesso" class="list-group text-muted mb-0"
								value="${accesso}">${accesso}</li>


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
									<p class="text-muted mb-0">${nome }</p>



								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Cognome</p>
								</div>

								<div id="cognomeUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${cognome }</p>

								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">ID</p>
								</div>

								<div class="col-sm-9">
									<li id="user" class="list-group text-muted mb-0" value="${id}">${id}</li>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Email</p>
								</div>
								<div id="emailUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${email }</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Username</p>
								</div>
								<div id="usernameUtenteInfo" class="col-sm-9">
									<p class="text-muted mb-0">${username }</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">Tipologia</p>
								</div>
								<div class="col-sm-9">

									<p class="text-muted mb-0">${accesso}</p>


								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<c:if test="${accesso == 'Amministratore' || accesso == 'Acquirente' }">
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">
					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Metodo di pagamento</h2>
							<p>aggiungi o rimuovi i tuoi metodi di pagamento</p>
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleMetodoPagamento"
								aria-expanded="false"
								aria-controls="#collapseExampleMetodoPagamento">Vedi >>
							</button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleMetodoPagamento">
							<div class="card card-body">
								<div class="tbodyDiv">
									<form method="GET" action="/provaaa">
										<table id="carteDiCredito" class="table table-striped ">
											<thead class="sticky-top bg-light">
												<tr>
													<th># id
													<th>
													<th>Numero Seriale</th>
													<th>Mese Scadenza</th>
													<th>Anno Scadenza</th>
													<th>cvv</th>
													<th>credito</th>

												</tr>
											</thead>
											<tbody>
												<tr>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
								<!-- fine "tbodyDiv" -->
								<br>
								<div class="conteiner">
									<div class="row">

										<div class="col-lg-8">
											<button class="btn btn-danger" id="btnCancellaCarta">
												Cancella</button>
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal"
												data-bs-target="#exampleModalAddCarta">
												aggiungi <i class="fas fa-credit-card"></i>
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalAddCarta"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Aggiungi
																Metodo Di Pagamento</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<form id="form1" action="">
																<div class="row mb-12">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="campoNumeroCarta"
																				class="form-control" /> <label class="form-label"
																				for="campoNumeroCarta">NumeroCarta</label>
																		</div>
																	</div>

																</div>
																<div class="row mb-4">
																	<div class="col">
																		<div class="form-outline">

																			<select id="campoMeseScadenza" class="form-control">
																				<option value="1">1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																				<option value="6">6</option>
																				<option value="7">7</option>
																				<option value="8">8</option>
																				<option value="9">9</option>
																				<option value="10">10</option>
																				<option value="11">11</option>
																				<option value="12">12</option>

																			</select> <label class="form-label" for="campoMeseScadenza">Mese
																				Scadenza</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">

																			<select id="campoAnnoScadenza" class="form-control">
																				<option value="2022">2022</option>
																				<option value="2023">2023</option>
																				<option value="2024">2024</option>
																				<option value="2025">2025</option>
																				<option value="2026">2026</option>
																				<option value="2027">2027</option>
																				<option value="2028">2028</option>


																			</select> <label class="form-label" for="campoAnnoScadenza">Anno
																				Scadenza</label>

																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="campoCvv" class="form-control" />
																			<label class="form-label" for="campoCvv">Cvv</label>
																		</div>
																	</div>
																</div>






															</form>

														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-danger"
																data-bs-dismiss="modal">Close</button>
															<div class="col">
																<button id="btnAggiungiMetodoPagamento"
																	class="btn btn-primary">
																	Aggiungi <i class="fas fa-credit-card"></i>
																</button>
															</div>
														</div>
													</div>
												</div>

											</div>






										</div>
									</div>
								</div>
							</div>
							<!-- fine card card-body -->
						</div>
					</div>
				</div>
				<!-- ROW FINE -->
			</div>
			<!-- CONTEINER FINE -->
		</section>


	</c:if>

	<c:if test="${accesso == 'Amministratore'}">
		<!-- Tutti gli utenti -->
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">

					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Elenco Utenti</h2>
							<p>tutti gli utenti</p>
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleTuttiGliUtenti"
								aria-expanded="false"
								aria-controls="#collapseExampleTuttiGliUtenti">Vedi >>
							</button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleTuttiGliUtenti">
							<div class="card card-body">
								<div class="tbodyDiv">
									<form method="GET" action="/provaaa">
										<table id="tabellaUtenti" class="table table-striped ">
											<thead class="sticky-top bg-light">
												<tr>
													<th># Id</th>
													<th>Username</th>
													<th>Nome</th>
													<th>Cognome</th>
													<th>Email</th>
													<th>Accesso</th>
													<th>Bannato
													<th>
												</tr>
											</thead>
											<tbody>
												<tr>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
								<!-- fine "tbodyDiv" -->
								<br>
								<div class="conteiner">
									<div class="row">
										<div class="col-lg-4">
											<select name='tipo ordine' id="campoSortUtente">
												<option value='nomeCrescente'>nome crescente</option>
												<option value='nomeDecrescente'>nome decrescente</option>
												<option value='cognomeCrescente'>cognome crescente</option>
												<option value='cognomeDecrescente'>cognome
													Decrescente</option>
												<option value='usernameCrescente'>username
													crescente</option>
												<option value='usernameDecrescente'>username
													Decrescente</option>
												<option value='idCrescente'>id crescente</option>
												<option value='idDecrescente'>id Decrescente</option>

											</select>



											<button class="btn btn-info" id="btnOrdinaUtente">ordine</button>
										</div>
										<div class="col-lg-8">
											<button id="bannaUtente" class="btn btn-warning">
												Banna/Sbocca</button>
											<button class="btn btn-danger" id="btnCancellaUtente">
												Cancella</button>
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModalAddUser">
												aggiungi <i class="fas fa-user-plus"></i>
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalAddUser"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Aggiungi
																Venditore</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<form id="form1" action="">
																<div class="row mb-4">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="campoNome"
																				class="form-control" /> <label class="form-label"
																				for="campoNome">Nome</label>
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
																			<input type="text" id="campoEmail"
																				class="form-control" /> <label class="form-label"
																				for="campoEmail">Email</label>
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
																			<option value='Amministratore'>Admin</option>

																		</select> <br>Tipo Utente
																	</div>

																</div>

















															</form>


															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	data-bs-dismiss="modal">Close</button>
																<div class="col">
																	<button id="btnAggiungiUtente" class="btn btn-primary">
																		Aggiungi</button>
																</div>
															</div>
														</div>
													</div>

												</div>






											</div>
											<!-- fine modal aggiungi utente -->

											<button id="bottoneModifica" type="button"
												class="btn btn-warning" data-bs-toggle="modal"
												data-bs-target="#exampleModalModifica">
												Modifica <i class="fas fa-user-plus"></i>
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalModifica"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 id="idUtenteDaModificare"></h5>

															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<form id="form1" action="">
																<div class="row mb-4">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchioNome"></small> <input type="text"
																				id="campoNome2" class="form-control" /> <label
																				class="form-label" for="campoNome">Nome</label>

																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchioCognome"></small> <input
																				type="text" id="campoCognome2" class="form-control" />
																			<label class="form-label" for="campoCognome">Cognome</label>

																		</div>
																	</div>
																</div>
																<div class="row mb-4">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaEmail"></small> <input type="text"
																				id="campoEmail2" class="form-control" /> <label
																				class="form-label" for="campoEmail">Email</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchioUsername"></small> <input
																				type="text" id="campoUsername2" class="form-control" />
																			<label class="form-label" for="campoUsername">Username</label>
																		</div>
																	</div>
																</div>

																<div class="row mb-4">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaPassword"></small> <input
																				type="password" id="campoPassword12"
																				class="form-control" /> <label class="form-label"
																				for="campoPassword1">Password</label> <br> <input
																				type="checkbox" id="show1"> <a>Mostra
																				Password</a>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaPassword2"></small> <input
																				type="password" id="campoPassword22"
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
																			<small id="vecchioLinkImmagine"></small> <input
																				type="text" id="campoImgProfilo2"
																				class="form-control" /> <label class="form-label"
																				for="campoImgProfilo">Link Immagine Profilo</label>
																		</div>
																	</div>
																	<div class="col">
																		<small id="vecchioTipoUtente"></small> <select
																			name='tipoUtente' id="campoTipo2"
																			style="margin-top: 5px; max-width: 350px;">
																			<option value='Acquirente'>Acquirente</option>
																			<option value='Venditore'>Venditore</option>
																			<option value='Amministratore'>Admin</option>

																		</select> <br>Tipo Utente
																	</div>

																</div>



															</form>


															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	data-bs-dismiss="modal">Close</button>
																<div class="col">
																	<button id="btnAggiungiModifica"
																		class="btn btn-warning">Aggiungi Modifica</button>
																</div>
															</div>
														</div>
													</div>

												</div>



















											</div>
										</div>
									</div>
									<!-- fine card card-body -->
								</div>
							</div>

						</div>
						<!-- ROW FINE -->
					</div>
					<!-- CONTEINER FINE -->
		</section>
	</c:if>
	<c:if test="${accesso == 'Amministratore' || accesso == 'Venditore'}">
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">

					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Elenco Annunci</h2>
							<c:if test="${accesso == 'Amministratore' }">
								<p>tutti gli annunci</p>
							</c:if>
							<c:if test="${accesso == 'Venditore' }">
								<p>tutti i tuoi annunci</p>
							</c:if>
							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleAnnunci" aria-expanded="false"
								aria-controls="#collapseExampleAnnunci">Vedi >></button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleAnnunci">
							<div class="card card-body">
								<div class="tbodyDiv">
									<form method="GET" action="/provaaa">
										<table id="tabellaAnnunci" class="table table-striped ">
											<thead class="sticky-top bg-light">
												<tr>
													<th># Id</th>
													<th>Id Venditore</th>
													<th>Metri Quadri</th>
													<th>Prezzo</th>
													<th>Tipologia</th>
													<th>Luogo</th>
													<th>Posizione</th>
													<th>Affitto/Vendita</th>

												</tr>
											</thead>
											<tbody>
												<tr>
												</tr>


											</tbody>
										</table>
									</form>
								</div>
								<!-- fine "tbodyDiv" -->
								<br>
								<div class="conteiner">
									<div class="row">
										<div class="col-lg-4">
											<select class="selectOption" name='tipo ordine'
												id="campoSortAnnuncio">
												<option value='prezzoCrescente'>prezzo crescente</option>
												<option value='prezzoDecrescente'>prezzo
													Decrescente</option>
												<option value='mqCrescente'>mq Crescente</option>
												<option value='mqDecrescente'>mq Decrescente</option>
												<option value='idCrescenteAnnuncio'>id crescente</option>
												<option value='idDecrescenteAnnuncio'>id
													Decrescente</option>

											</select> <a id="btnOrdinaAnnuncio" class="btn btn-info">ordina</a>
										</div>
										<div class="col-lg-8">
											<button class="btn btn-danger" id="btnCancellaAnnuncio">
												Cancella</button>

											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal"
												data-bs-target="#exampleModalAddAnnuncio">
												aggiungi <i class="far fa-building"></i>
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalAddAnnuncio"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Aggiungi
																Annuncio</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<form id="form1" action="">

																<div class="row mb-2">
																	<div class="col">
																		<select name='tipologia' id="tipologia"
																			style="margin-top: 5px; max-width: 350px;">
																			<option value="Appartamento">Appartamento</option>
																			<option value="Villa">Villa</option>
																			<option value="Villetta">Villetta</option>
																			<option value="Ufficio">Ufficio</option>
																			<option value="Terreno">Terreno</option>
																			<option value="Garage">Garage</option>
																			<option value="Magazzino">Magazzino</option>
																		</select> <br>Tipologia
																	</div>
																	<div class="col">
																		<select name='vendtita' id="vendita"
																			style="margin-top: 5px; max-width: 350px;">
																			<option value='affitto'>affitto</option>
																			<option value='vendita'>vendita</option>

																		</select> <br> affitto/vendita
																	</div>
																</div>
																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="descrizione"
																				class="form-control" /> <label class="form-label"
																				for="descrizione">Descrizione</label>
																		</div>
																	</div>

																</div>
																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="m1" class="form-control" /> <label
																				class="form-label" for="m1">metriQuadri</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="prezzo" class="form-control" />
																			<label class="form-label" for="prezzo">Prezzo</label>
																		</div>
																	</div>
																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="luogo" class="form-control" />
																			<label class="form-label" for="luogo">città</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="posizione"
																				class="form-control" /> <label class="form-label"
																				for="posizione">via</label>
																		</div>
																	</div>

																</div>


																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img0" class="form-control" />
																			<label class="form-label" for="img0">Link
																				immagine Copertina</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img1" class="form-control" />
																			<label class="form-label" for="img1">Link
																				immagine 1</label>
																		</div>
																	</div>
																</div>


																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img2" class="form-control" />
																			<label class="form-label" for="img2">Link
																				immagine 2</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img3" class="form-control" />
																			<label class="form-label" for="img3">Link
																				immagine 3</label>
																		</div>
																	</div>
																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img4" class="form-control" />
																			<label class="form-label" for="img4">Link
																				immagine 4</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="img5" class="form-control" />
																			<label class="form-label" for="img5">Link
																				immagine 5</label>
																		</div>
																	</div>

																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="latitudine"
																				class="form-control" /> <label class="form-label"
																				for="latitudine">latitudine</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<input type="text" id="longitudine"
																				class="form-control" /> <label class="form-label"
																				for="longitudine">longitudine</label>
																		</div>
																	</div>


																</div>
															</form>


															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	data-bs-dismiss="modal">Close</button>
																<div class="col">
																	<button id="btnAggiungiAnnuncio"
																		class="btn btn-primary">
																		Aggiungi <i class="far fa-building"></i>
																	</button>
																</div>
															</div>
														</div>
													</div>

												</div>


											</div>








											<button id="modificaAnnuncio" type="button"
												class="btn btn-warning" data-bs-toggle="modal"
												data-bs-target="#exampleModalAddModificaAnnuncio">
												Aggiungi Modifica <i class="far fa-building"></i>
											</button>

											<!-- Modal -->
											<div class="modal fade" id="exampleModalAddModificaAnnuncio"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
														<div id="idModificaAnnuncioTitoLo">
														
														</div>
															
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">

															<form id="form1" action="">

																<div class="row mb-2">
																	<div class="col">
																		<small id="vecchiaTipologia"></small> <br> <select
																			name='tipologia' id="tipologia2"
																			style="margin-top: 5px; max-width: 350px;">
																			<option value="Appartamento">Appartamento</option>
																			<option value="Villa">Villa</option>
																			<option value="Villetta">Villetta</option>
																			<option value="Ufficio">Ufficio</option>
																			<option value="Terreno">Terreno</option>
																			<option value="Garage">Garage</option>
																			<option value="Magazzino">Magazzino</option>
																		</select> <br>Tipologia
																	</div>
																	<div class="col">
																		<small id=vecchioBuyRent></small> <select
																			name='vendtita' id="vendita2"
																			style="margin-top: 5px; max-width: 350px;">
																			<option value='affitto'>affitto</option>
																			<option value='vendita'>vendita</option>

																		</select> <br> affitto/vendita
																	</div>
																</div>
																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaDescrizione"></small> <input
																				type="text" id="descrizione2" class="form-control" />
																			<label class="form-label" for="descrizione">Descrizione</label>
																		</div>
																	</div>

																</div>
																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id=vecchiMq></small> <input type="text"
																				id="m12" class="form-control" /> <label
																				class="form-label" for="m1">metriQuadri</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchioPrezzo"></small> <input type="text"
																				id="prezzo2" class="form-control" /> <label
																				class="form-label" for="prezzo">Prezzo</label>
																		</div>
																	</div>
																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchioLuogo"></small> <input type="text"
																				id="luogo2" class="form-control" /> <label
																				class="form-label" for="luogo">città</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaPosizione"></small> <input
																				type="text" id="posizione2" class="form-control" />
																			<label class="form-label" for="posizione">via</label>
																		</div>
																	</div>

																</div>


																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg0"></small> <input type="text"
																				id="img02" class="form-control" /> <label
																				class="form-label" for="img0">Link immagine
																				Copertina</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg1"></small> <input type="text"
																				id="img12" class="form-control" /> <label
																				class="form-label" for="img1">Link immagine
																				1</label>
																		</div>
																	</div>
																</div>


																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg2"></small> <input type="text"
																				id="img22" class="form-control" /> <label
																				class="form-label" for="img2">Link immagine
																				2</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg3"></small> <input type="text"
																				id="img32" class="form-control" /> <label
																				class="form-label" for="img3">Link immagine
																				3</label>
																		</div>
																	</div>
																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg4"></small> <input type="text"
																				id="img42" class="form-control" /> <label
																				class="form-label" for="img4">Link immagine
																				4</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaImg5"></small> <input type="text"
																				id="img52" class="form-control" /> <label
																				class="form-label" for="img5">Link immagine
																				5</label>
																		</div>
																	</div>

																</div>

																<div class="row mb-2">
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaLatitudine"></small> <input
																				type="text" id="latitudine2" class="form-control" />
																			<label class="form-label" for="latitudine">latitudine</label>
																		</div>
																	</div>
																	<div class="col">
																		<div class="form-outline">
																			<small id="vecchiaLongitudine"></small> <input
																				type="text" id="longitudine2" class="form-control" />
																			<label class="form-label" for="longitudine">longitudine</label>
																		</div>
																	</div>


																</div>
															</form>


															<div class="modal-footer">
																<button type="button" class="btn btn-danger"
																	data-bs-dismiss="modal">Close</button>
																<div class="col">
																	<button id="btnAggiungiModificaAnnuncio"
																		class="btn btn-primary">
																		Aggiungi Modifica <i class="far fa-building"></i>
																	</button>
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
							<!-- fine card card-body -->
						</div>
					</div>

				</div>
				<!-- ROW FINE -->
			</div>
			<!-- CONTEINER FINE -->
		</section>
	</c:if>

	<section class="contenuti">
		<div class="container" style="background-color: #eee;">
			<div class="row">

				<div class="col-lg-3">
					<div class="section-title " data-aos="fade-right">
						<h2>Elenco Visite</h2>
						<p>tutti le visite</p>
						<button class="btn btn-primary" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseExampleVisite"
							aria-expanded="false" aria-controls="#collapseExampleVisite">Vedi
							>></button>

					</div>
				</div>


				<div class="col-lg-9">
					<div class="collapse" id="collapseExampleVisite">
						<div class="card card-body">
							<div class="tbodyDiv">
								<form method="GET" action="/provaaa">
									<table id="tabellaVisite" class="table table-striped ">
										<thead class="sticky-top bg-light">
											<tr>
												<th># Id</th>
												<th>il tuo id</th>
												<th>id Vendiore</th>
												<th>id annuncio</th>
												<th>effettuata</th>


											</tr>
										</thead>
										<tbody>
											<tr>
											</tr>


										</tbody>
									</table>

								</form>
							</div>
							<!-- fine "tbodyDiv" -->
							<br>
							<div class="conteiner">
								<div class="row">
									<div class="col-lg-8">
										<button class="btn btn-danger" id="btnCancellaVisita">
											Cancella</button>
										<c:if
											test="${accesso == 'Amministratore'  || accesso == 'Venditore'}">
											<button class="btn btn-primary" id="btnAbilitaVisita">
												Abilita <i class="fas fa-check"></i>
											</button>

										</c:if>
									</div>


								</div>
							</div>
						</div>
						<!-- fine card card-body -->
					</div>
				</div>

			</div>
			<!-- ROW FINE -->
		</div>
		<!-- CONTEINER FINE -->
	</section>


	<section class="contenuti">
		<div class="container" style="background-color: #eee;">
			<div class="row">

				<div class="col-lg-3">
					<div class="section-title " data-aos="fade-right">
						<h2>Elenco Recensioni</h2>
						<p>tutti le visite</p>
						<button class="btn btn-primary" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#collapseExampleRecensioni" aria-expanded="false"
							aria-controls="#collapseExampleRecensioni">Vedi >></button>

					</div>
				</div>


				<div class="col-lg-9">
					<div class="collapse" id="collapseExampleRecensioni">
						<div class="card card-body">
							<div class="tbodyDiv">
								<form method="GET" action="/provaaa">
									<table id="tabellaRecensioni" class="table table-striped ">
										<thead class="sticky-top bg-light">
											<tr>
												<th># Id</th>
												<th>il tuo id</th>
												<th>id annuncio</th>
												<th>messaggio</th>


											</tr>
										</thead>
										<tbody>
											<tr>
											</tr>


										</tbody>
									</table>

								</form>
							</div>
							<!-- fine "tbodyDiv" -->
							<br>
							<div class="conteiner">
								<div class="row">
									<div class="col-lg-8">
										<button class="btn btn-danger" id="btnCancellaRecensione">
											Cancella</button>



									</div>


								</div>
							</div>
						</div>
						<!-- fine card card-body -->
					</div>
				</div>

			</div>
			<!-- ROW FINE -->
		</div>
		<!-- CONTEINER FINE -->
	</section>
	<c:if test="${accesso == 'Amministratore'}">
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">

					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Invia News Letter</h2>

							<p>invia a tutti gli iscritti alla news letter</p>

							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleNewsLetter"
								aria-expanded="false" aria-controls="#collapseExampleNewsLetter">Vedi
								></button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleNewsLetter">
							<div class="card card-body">

							<div  class="row" style="margin-left: 25px;">
			
					<textarea class='form-control' placeholder='Scrivi il contenuto dell'iemail'
						id="formEmail" style='height: 100px'></textarea>
					
					<div class="col" style="margin-top:2px;">
									<button id="inviaEmail" class="btn btn-primary"> Invia</button>
					
					</div>
				
				</div>


							</div>

						</div>
					</div>
				</div>
				<!-- fine card card-body -->
			</div>
			</div>

			</div>
			<!-- ROW FINE -->
			</div>
			<!-- CONTEINER FINE -->
		</section>
	</c:if>
<c:if test="${accesso == 'Amministratore'}">
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">

					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Invia Email a Venditori</h2>

							<p>invia a tutti i Venditori</p>

							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleEmailVenditori"
								aria-expanded="false" aria-controls="#collapseExampleEmailVenditori">Vedi
								></button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleEmailVenditori">
							<div class="card card-body">

							<div  class="row" style="margin-left: 25px;">
			
					<textarea class='form-control' placeholder='Scrivi il contenuto dell'iemail'
						id="formEmailVenditori" style='height: 100px'></textarea>
					
					<div class="col" style="margin-top:2px;">
									<button id="inviaEmailVenditori" class="btn btn-primary"> Invia</button>
					
					</div>
				
				</div>


							</div>

						</div>
					</div>
				</div>
				<!-- fine card card-body -->
			</div>
			</div>

			</div>
			<!-- ROW FINE -->
			</div>
			<!-- CONTEINER FINE -->
		</section>
	</c:if>

<c:if test="${accesso == 'Amministratore'}">
		<section class="contenuti">
			<div class="container" style="background-color: #eee;">
				<div class="row">

					<div class="col-lg-3">
						<div class="section-title " data-aos="fade-right">
							<h2>Invia Email ad Utenti</h2>

							<p>invia a tutti gli Utenti</p>

							<button class="btn btn-primary" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#collapseExampleEmailUtenti"
								aria-expanded="false" aria-controls="#collapseExampleEmailUtenti">Vedi
								></button>

						</div>
					</div>


					<div class="col-lg-9">
						<div class="collapse" id="collapseExampleEmailUtenti">
							<div class="card card-body">

							<div  class="row" style="margin-left: 25px;">
			
					<textarea class='form-control' placeholder='Scrivi il contenuto dell'iemail'
						id="formEmailUtenti" style='height: 100px'></textarea>
					
					<div class="col" style="margin-top:2px;">
									<button id="inviaEmailUtenti" class="btn btn-primary"> Invia</button>
					
					</div>
				
				</div>


							</div>

						</div>
					</div>
				</div>
				<!-- fine card card-body -->
			</div>
			</div>

			</div>
			<!-- ROW FINE -->
			</div>
			<!-- CONTEINER FINE -->
		</section>
	</c:if>


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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript" src="../js/main.js"></script>

	<script type="text/javascript"
		src="../js/profiloPrivato/tabella_visite.js"></script>

	<script type="text/javascript"
		src="../js/profiloPrivato/tabella_recensioni.js"></script>
	<c:if test="${accesso == 'Amministratore' || accesso == 'Venditore'}">
		<script type="text/javascript"
			src="../js/profiloPrivato/tabella_annunci.js"></script>

	</c:if>
	<c:if test="${accesso == 'Amministratore' }">
		<script type="text/javascript"
			src="../js/profiloPrivato/tabella_utenti.js"></script>
	</c:if>

	<c:if test="${accesso == 'Amministratore' || accesso == 'Acquirente' }">
		<script type="text/javascript"
			src="../js/profiloPrivato/tabella_metodo_pagamento.js"></script>
			<script type="text/javascript"
			src="../js/profiloPrivato/inviaNewsLetter.js"></script>
	</c:if>



</body>
</html>