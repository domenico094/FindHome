
window.addEventListener("load", function() {
	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});


	var btnOrdinaAnnuncio = document.querySelector("#btnOrdinaAnnuncio");
	btnOrdinaAnnuncio.addEventListener("click", ordinaAnnunci);


});

function ordinaAnnunci() {
	var sort = document.querySelector("#campoSortAnnuncio").value;
	 if (sort === "prezzoCrescente") {
		ordinaPrezzoCrescente();

	} else if (sort === "prezzoDecrescente") {
		ordinaPrezzoDecrescente();
	} else if (sort === "mqCrescente") {
		ordinaMqCrescente();

	} else if (sort === "mqDecrescente") {
		ordinaMqDecrescente();
	} else if (sort === "idCrescenteAnnuncio") {
		ordinaIdCrescenteAnnuncio();

	} else if (sort === "idDecrescenteAnnuncio") {
		ordinaIdDecrescenteAnnuncio();
	}
}


function ordinaPrezzoCrescente() {
	
	$.ajax({
		type: "GET",
		url: "/prezzoCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}

function ordinaPrezzoDecrescente() {
	
	$.ajax({
		type: "GET",
		url: "/prezzoDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}

function ordinaMqCrescente() {
	
	$.ajax({
		type: "GET",
		url: "/mqCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}

function ordinaMqDecrescente() {
	
	$.ajax({
		type: "GET",
		url: "/mqDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}


function ordinaIdCrescenteAnnuncio() {
	
	$.ajax({
		type: "GET",
		url: "/idCrescenteAnnuncio",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}

function ordinaIdDecrescenteAnnuncio() {
	
	$.ajax({
		type: "GET",
		url: "/idDecrescenteAnnuncio",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
					aggiungiAnnunciElenco(risposta[i]);
			}
		}

	});
}

function cancellaDaElenco() {
	document.querySelector("#elenco").innerHTML ="";
}

function aggiungiAnnunciElenco(risposta) {
	document.querySelector("#elenco").innerHTML += " <div id='startItem' class='col-lg-6'> <div class='annuncioCard' data-aos='zoom-in' data-aos-delay='100'> <div class='pic1'><img src="+risposta.img0+" class='img-fluid'></div> <div> <br> <h4>Annunci n° "+ risposta.id +  " </h4>  <span>"+ risposta.metriQuadri + " mq, "+ risposta.prezzo +" € </span>   <p>"+risposta.descrizione+"</p> <br>  <a  href='/annuncioPage/"+risposta.id+"' class='btn myButton'> vedi</a>  </div>  </div>  </div>   ";
}
