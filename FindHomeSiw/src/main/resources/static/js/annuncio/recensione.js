
window.addEventListener("load", function() {

	dammiRecensione();
	
	recensioneControllaAggiungi();
});


function recensioneControllaAggiungi() {
	var btnScrivi = document.querySelector('#scriviRecensione');

	btnScrivi.addEventListener("click", function() {
		var idAcquirente = document.querySelector("#idUtente").value;
		var idAnnuncio = document.querySelector("#idae").value;
		if (idAcquirente != 0) {
			var test = 0;
			$.ajax({
				type: "GET",
				url: "/dammiVisite",
				contentType: "application/json",
				//data: JSON.stringify(),
				success: function(risposta) {
					
					if (risposta.length == 0 || risposta.isEmpty || risposta == null) {
						document.querySelector("#recensione3").innerHTML = "<h2> Nessuna Recensione </h2>";
					} else {
						
						for(var i=0; i < risposta.length; i++) {
							
							if(risposta[i].idAcquirente == idAcquirente && idAnnuncio == risposta[i].idAnnuncio && risposta[i].effettuata == true) {
								test = 1;
								
								
							}
						}
					}
					if(test == 1) {
					
						scrivi();
					} else {
						alert("effettua la richiesta o aspetta che sia accettata");
					}


				}

			});


		} else {
			alert("Devi Essere Loggato");

		}

	});
}

function scrivi() {
	
	var cmessaggio = document.querySelector("#areaTesto").value;
	var idAcquirente = document.querySelector("#idUtente").value;
			var idAnnuncio = document.querySelector("#idae").value;

		$.ajax({
			type: "POST",
			url: "/findByKeyUtente",
			contentType: "application/json",
			data: JSON.stringify(idAcquirente),
			success: function(utente) {
				
				$.ajax({
							type: "GET",
							url: "/dammiId",
							contentType: "application/json",
							//data: JSON.stringify(),
							success: function(risposta) {
								var id = risposta;
								recensione = new Recensione(id, utente.id, idAnnuncio, "title", utente.username, cmessaggio);
								aggiungRecensione(recensione);
							}

						});
				
			 }
			});
}




function aggiungRecensione(recensione) {
	$.ajax({
		type: "POST",
		url: "/addRecensione",
		contentType: "application/json",
		data: JSON.stringify(recensione),
		success: function() {
			inserisciRecensione(recensione);
			alert("ok recensione aggiunta");
		}

	});
}

function dammiRecensione() {

	var idAnnuncio2 = document.querySelector("#idae").value;
	

	$.ajax({
		type: "GET",
		url: "/dammiRecensioni",
		contentType: "application/json",
		success: function(risposta) {
			if (risposta.length != 0) {
				for (var i = 0; i < risposta.length; i++) {
					if (risposta[i].idAnnuncio == idAnnuncio2) {

						inserisciRecensione(risposta[i]);

					}
				}
			}


		}
	});
}

function inserisciRecensione(recensione) {
	document.querySelector("#recensione3").innerHTML += "<br> <h4> recensione n. " + recensione.id + " </h4>  <strong>scritta da:" + recensione.autore + " </strong>  <p>" + recensione.messaggio + " </p> <hr>";
}



