


window.addEventListener("load", function() {
	eventiElencoVenditori();
});

function eventiElencoVenditori() {
	// Aggiungi Ventitori
	aggiungiVenditoriAllaPagina();
	
	// Ordinamento
	var btnOrdinaVenditore = document.querySelector("#btnOrdinaVenditore");
	btnOrdinaVenditore.addEventListener("click", ordinaVenditore);
}

/*
	AggiungiVenditori
 */
function aggiungiVenditoriAllaPagina() {
	$.ajax({
		type: "GET",
		url: "/findAllUtenti",
		contentType: "application/json",
		success: function(risposta) {

			for (var i = 0; i < risposta.length; i++) {
				if(risposta[i].accesso === "Venditore") {
				aggiungiVenditoriElenco(risposta[i]);
				}
			}
		}
	});

}

function aggiungiVenditoriElenco(risposta) {
	document.querySelector("#elenco").innerHTML += '<div id="startItem"class="col-lg-6"> <div class="annuncioCard" data-aos="zoom-in" data-aos-delay="100">	<div class="pic"> <img src="' + risposta.img + '" class="img-fluid" alt=""> </div> <div ><h4>' + risposta.nome + " " + risposta.cognome + '</h4> <span>' + risposta.accesso + '</span> <p>' + risposta.email + '</p> 	<br>		<a  href="/venditorePage/' + risposta.id + '" class="btn myButton"> vedi</a></div></div></div></div>';
}



/* 
	Ordinamento
*/

function ordinaVenditore() {
	var sort = document.querySelector("#campoSortVenditore").value;
	if (sort === "nomeCrescente") {
		ordinaNomiCrescente();
	} else if (sort === "nomeDecrescente") {
		ordinaNomiDecrescente();
	} else if (sort === "cognomeCrescente") {
		ordinaCognomeCrescente();

	} else if (sort === "cognomeDecrescente") {
		ordinaCognomeDecrescente();
	} else if (sort === "usernameCrescente") {
		ordinaUsernameCrescente();

	} else if (sort === "usernameDecrescente") {
		ordinaUsernameDecrescente();
	} else if (sort === "idCrescente") {
		ordinaIdCrescente();

	} else if (sort === "idDecrescente") {
		ordinaIdDecrescente();
	}
}




function ordinaNomiCrescente() {
	$.ajax({
		type: "GET",
		url: "/nomeCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}

function ordinaNomiDecrescente() {
	$.ajax({
		type: "GET",
		url: "/nomeDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}

function ordinaCognomeCrescente() {
	$.ajax({
		type: "GET",
		url: "/cognomeCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}

function ordinaCognomeDecrescente() {
	$.ajax({
		type: "GET",
		url: "/cognomeDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}


function ordinaUsernameCrescente() {
	$.ajax({
		type: "GET",
		url: "/usernameCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}

function ordinaUsernameDecrescente() {
	$.ajax({
		type: "GET",
		url: "/usernameDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}

		}

	});
}

function ordinaIdCrescente() {
	$.ajax({
		type: "GET",
		url: "/idCrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}
		}

	});
}

function ordinaIdDecrescente() {
	$.ajax({
		type: "GET",
		url: "/idDecrescente",
		contentType: "application/json",
		success: function(risposta) {
			cancellaDaElenco();
			for (var i = 0; i < risposta.length; i++) {
				if (risposta[i].accesso === "Venditore") {
					aggiungiVenditoriElenco(risposta[i]);
				}
			}
		}

	});
}



/* 
	Cancella dalla pagina
*/

function cancellaDaElenco() {
	var rigaDaCancellare = document.querySelector("#elenco");
	rigaDaCancellare.innerHTML = "";
}



