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

<!-- AJAX -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- API google maps -->
	<script src="https://maps.googleapis.com/maps/api/js?libraries=place&key=AIzaSyD5aErkDGRMDOsbQbSDUXIv9khY8TBxeB4"></script>

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
						
								<a class="btn myButton" href="/">Torna Alla Home <i
									class="fas fa-sign-in-alt"></i></a>
								
								
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

	<section class="slidesAnnuncio" >
		<div id="annuncioImmagini" class="container" >
  <div class="mySlides">
    <div class="numbertext">1 / 6</div>
    <img src="${annuncio.img0}" >
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 6</div>
    <img src="${annuncio.img1}" >
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 6</div>
    <img src="${annuncio.img2}" >
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 6</div>
    <img src="${annuncio.img3}" >
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 6</div>
    <img src="${annuncio.img4}" >
  </div>
    
  <div class="mySlides">
    <div class="numbertext">6 / 6</div>
    <img src="${annuncio.img5}" >
  </div>
    
  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>

  <div class="caption-container" >
    <p id="caption"></p>
  </div>

  <div class="row">
    <div class="column" >
      <img class="demo cursor" src="${annuncio.img0}" style="width:100%" onclick="currentSlide(1)" alt="Annuncio ${annuncio.id} immagine 1">
    </div>
    <div class="column">
      <img class="demo cursor" src="${annuncio.img1}" style="width:100%" onclick="currentSlide(2)" alt="Annuncio ${annuncio.id} immagine 2">
    </div>
    <div class="column">
      <img class="demo cursor" src="${annuncio.img2}" style="width:100%" onclick="currentSlide(3)" alt="Annuncio ${annuncio.id} immagine 3">
    </div>
    <div class="column">
      <img class="demo cursor" src="${annuncio.img3}" style="width:100%" onclick="currentSlide(4)" alt="Annuncio ${annuncio.id} immagine 4">
    </div>
    <div class="column">
      <img class="demo cursor" src="${annuncio.img4}" style="width:100%" onclick="currentSlide(5)" alt="Annuncio ${annuncio.id} immagine 5">
    </div>    
    <div class="column">
      <img class="demo cursor" src="${annuncio.img5}" style="width:100%" onclick="currentSlide(6)" alt="Annuncio ${annuncio.id} immagine 6">
    </div>
  </div>
</div>
	</section>


	<section  class="contenuti">
		<div class="container">


			<div class="col-lg-12">
				<div class="row">

					<div class="col-lg-4">
						<div class="annuncioCard " data-aos="zoom-in"
							data-aos-delay="100">
							<div id="venditoreFoto" class="pic">
								
							</div>
							<div >
								<h4 id="NomeCognome"></h4>
								<span id="Accesso"></span>
								<p id="Email"></p>
								
								
								<li id="idv" class=" btn " value="${annuncio.idVenditore}" > <a class="btn myButton" href="/venditorePage/${annuncio.idVenditore} ">vedi profilo</a></li>
							</div>
						</div>
					</div>

					<div class="col-lg-8 ">
						<div class="annuncioCard">

							<div class="section-title">
								<li id="idae" class=" btn " value="${annuncio.id}" ><h4>Annuncio n° ${annuncio.id}</h4></li> <br>
								<span>Descrizione</span>
								<p>${annuncio.descrizione}</p>
								 <span>info</span> 
								 
								<div class="row">
									<div class="col">
										<strong>metri quadri:</strong> <a>${annuncio.metriQuadri}
											mq</a>
									</div>
									<div class="col">
										<strong>tipologia:</strong> <a>${annuncio.tipologia}</a>
									</div>
									<div class="col">
										<strong>prezzo:</strong> <a>${annuncio.prezzo} €</a>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col">
										<strong>citta</strong> <a>${annuncio.luogo}</a>
									</div>
									<div class="col">
										<strong>via:</strong> <a>${annuncio.posizione}</a>
									</div>
									<div class="col">
										<strong>affitto/vendita:</strong> <a> <c:if
												test="${annuncio.vendita == true}">
								in Vendita
								</c:if> <c:if test="${annuncio.vendita == false}">
								in Affitto
								</c:if>
										</a>
									</div>

								</div>
								<br>
							
								<li id="idUtente" value='${id}' class="btn myButton ">
									
										<a>richiedi visita</a>
									
									
									</li> 
								
									<a id="addOnShoppingCart3" class="btn myButton"> Aggiungi Al Carrello</a>
							</div>
						</div>


					</div>

				</div>
			</div>
			<br>

			<div class="col-lg-12">
				<div class="row">



					

						<div id="map" class="mapAnnuncio"
							></div>



					

				</div>

			</div>
		</div>
		<br>
<div class="container">
		<div class="row">
			<div id="recensione3" class="tbodyDiv"
				style="background-color: #eee; border-radius: 10px 10px 10px 10px; margin-left: 25px;"> </div>




		</div>
	</div>
	<br>
	
	<div class="container">
		<div id="formCommento" class="row" style="margin-left: 25px;">
				<div class='form-floating'>
					<textarea class='form-control' placeholder='Leave a comment here'
						id='areaTesto' style='height: 100px'></textarea>
					<label for='floatingTextarea2'>Comments</label>
					<p></p>
					
				
				</div>
				


			</div>
		
	<button id='scriviRecensione' class='btn myButton'>scrivi</button>
	</div>
	
	</section>
	<br>
	
	<br>
	

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

	
	<!-- Footer -->
	
	<script>
		$(document).ready(function() {
			var pos = {
				lat : ${annuncio.latitudine } ,
				lng : ${annuncio.longitudine }
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				center : pos,
				zoom : 14
			});

			var marker = new google.maps.Marker({
				position : {
					lat : ${annuncio.latitudine },
					lng : ${annuncio.longitudine }
				},
				map : map,
				title : 'ciao'
			});

		});
	</script>
	<!-- W3 School -->
	<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>



		
	<script type="text/javascript" src="../js/main.js"></script>	



	
	<script type="text/javascript" src="../js/annuncio/recensione.js"></script>

	<script type="text/javascript" src="../js/annuncio/annuncio.js"></script>
	
		<script type="text/javascript" src="../js/annuncio/visita.js"></script>
	
</body>
</html>