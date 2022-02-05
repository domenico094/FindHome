/**
 * 
 */

window.addEventListener("load", function() {
	eventiTabellaAnnunci();
	dammiAnnunci();
});

function eventiTabellaAnnunci() {
	var btnAggiungiAnnuncio = document.querySelector("#btnAggiungiAnnuncio");
	btnAggiungiAnnuncio.addEventListener("click", aggiungiAnnuncio);

	var btnOrdinaAnnuncio = document.querySelector("#btnOrdinaAnnuncio");
	btnOrdinaAnnuncio.addEventListener("click", ordinaAnnunci);

	cancellaAnnuncio();

	var btnModificaAnnucio = document.querySelector("#modificaAnnuncio");
	btnModificaAnnucio.addEventListener("click", function() {
		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				$.ajax({
					type: "POST",
					url: "/dammiAnnuncio",
					data: JSON.stringify(id),
					contentType: "application/json",
					success: function(risposta) {
					
						addVecchiDatiAnnuncio(risposta);
					}
				});



				var btnAggiungiModificaAnnuncio = document.querySelector("#btnAggiungiModificaAnnuncio");
				btnAggiungiModificaAnnuncio.addEventListener("click", function() {
					var id = checkBox.getAttribute("id");
					var descrizione = document.querySelector("#descrizione2").value;
					var prezzo = document.querySelector("#prezzo2").value;
					var tipologia = document.querySelector("#tipologia2").value;
					var metri_quadri = document.querySelector("#m12").value;
					var tipo = document.querySelector("#vendita2").value; // vendita affitto
					var vendita;
					if (tipo === "affitto") {
						vendita = false;
					} else if(tipo ==="vendita"){
						vendita = true;
					}
					var luogo = document.querySelector("#luogo2").value;
					var posizione = document.querySelector("#posizione2").value;

					var img0 = document.querySelector("#img02").value;
					var img1 = document.querySelector("#img12").value;

					var img2 = document.querySelector("#img22").value;
					var img3 = document.querySelector("#img32").value;
					var img4 = document.querySelector("#img42").value;
					var img5 = document.querySelector("#img52").value;
					if (img5.length < 10) {
						img5 = "http://localhost:8080/img/noImage1.png";
					}
					if (img4.length < 10) {
						img4 = "http://localhost:8080/img/noImage1.png";
					} if (img3.length < 10) {
						img3 = "http://localhost:8080/img/noImage1.png";
					} if (img2.length < 10) {
						img2 = "http://localhost:8080/img/noImage1.png";
					} if (img1.length < 10) {
						img1 = "http://localhost:8080/img/noImage1.png";
					} if (img0.length < 10) {
						img0 = "http://localhost:8080/img/noImage1.png";
					}

					var latitudine = document.querySelector("#latitudine2").value;

					var longitudine = document.querySelector("#longitudine2").value;


					$.ajax({
						type: "POST",
						url: "/dammiAnnuncio",
						data: JSON.stringify(id),
						contentType: "application/json",
						success: function(risposta) {
							risposta.descrizione = descrizione;
							risposta.prezzo = prezzo;
							risposta.metriQuadri = metri_quadri;
							risposta.vendita = vendita;
							risposta.tipologia = tipologia;
							risposta.luogo = luogo;
							risposta.posizione = posizione;
							risposta.img0 = img0;
							risposta.img1 = img1;
							risposta.img2 = img2;
							risposta.img3 = img3;
							risposta.img4 = img4;
							risposta.img5 = img5;
							risposta.latitudine = latitudine;
							risposta.longitudine = longitudine;

							cancellaAnnuncioDaTabella(risposta);

							$.ajax({
								type: "POST",
								url: "/aggiornaAnnuncio",
								data: JSON.stringify(risposta),
								contentType: "application/json",

							});


							aggiungiInTabellaAnnuncio(risposta);
						}
					});




				});



			});
		}

	});

}

function addVecchiDatiAnnuncio(annuncio) {
	document.querySelector("#idModificaAnnuncioTitoLo").innerHTML = "Modifica Annunvcio Id: " + annuncio.id + " Venduto da, id:" + annuncio.idVenditore;
	document.querySelector("#vecchiaTipologia").innerHTML = annuncio.tipologia;
	document.querySelector("#vecchioBuyRent").innerHTML = annuncio.vendita;
	document.querySelector("#vecchiaDescrizione").innerHTML = annuncio.descrizione;
	document.querySelector("#vecchiMq").innerHTML = annuncio.metriQuadri;
	document.querySelector("#vecchioPrezzo").innerHTML = annuncio.prezzo;
	document.querySelector("#vecchioLuogo").innerHTML = annuncio.luogo;
	document.querySelector("#vecchiaPosizione").innerHTML = annuncio.posizione;
	document.querySelector("#vecchiaImg0").innerHTML = annuncio.img0;
	document.querySelector("#vecchiaImg1").innerHTML = annuncio.img1;
	document.querySelector("#vecchiaImg2").innerHTML = annuncio.img2;
	document.querySelector("#vecchiaImg3").innerHTML = annuncio.img3;
	document.querySelector("#vecchiaImg4").innerHTML = annuncio.img4;
	document.querySelector("#vecchiaImg5").innerHTML = annuncio.img5;
	document.querySelector("#vecchiaLatitudine").innerHTML = annuncio.latitudine;
	document.querySelector("#vecchiaLongitudine").innerHTML = annuncio.longitudine;




}


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
			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);

				aggiungiInTabellaAnnuncio(risposta[i]);
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
			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);

				aggiungiInTabellaAnnuncio(risposta[i]);
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
			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);

				aggiungiInTabellaAnnuncio(risposta[i]);
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
			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);

				aggiungiInTabellaAnnuncio(risposta[i]);
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
			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);

				aggiungiInTabellaAnnuncio(risposta[i]);
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

			for (var i = 0; i < risposta.length; i++) {
				cancellaAnnuncioDaTabella(risposta[i]);
				aggiungiInTabellaAnnuncio(risposta[i]);
			}
		}

	});
}

function aggiungiAnnuncio() {
	var idVenditore = document.querySelector("#user").value;
	var descrizione = document.querySelector("#descrizione").value;
	var prezzo = document.querySelector("#prezzo").value;
	var tipologia = document.querySelector("#tipologia").value;
	var metri_quadri = document.querySelector("#m1").value;
	var tipo = document.querySelector("#vendita").value; // vendita affitto
	var tipoVendita = false;

	var luogo = document.querySelector("#luogo").value;
	var posizione = document.querySelector("#posizione").value;
	var venduto = false;
	var img0 = document.querySelector("#img0").value;
	var img1 = document.querySelector("#img1").value;

	var img2 = document.querySelector("#img2").value;
	var img3 = document.querySelector("#img3").value;
	var img4 = document.querySelector("#img4").value;
	var img5 = document.querySelector("#img5").value;

	if (img5.length < 10) {
		img5 = "http://localhost:8080/img/noImage1.png";
	}
	if (img4.length < 10) {
		img4 = "http://localhost:8080/img/noImage1.png";
	} if (img3.length < 10) {
		img3 = "http://localhost:8080/img/noImage1.png";
	} if (img2.length < 10) {
		img2 = "http://localhost:8080/img/noImage1.png";
	} if (img1.length < 10) {
		img1 = "http://localhost:8080/img/noImage1.png";
	} if (img0.length < 10) {
		img0 = "http://localhost:8080/img/noImage1.png";
	}

	var latitudine = document.querySelector("#latitudine").value;
	var longitudine = document.querySelector("#longitudine").value;

	if (tipo === "vendita") {
		tipoVendita = true;
	}

	var annuncio = new Annuncio(0, idVenditore, descrizione, tipoVendita, prezzo, metri_quadri, tipologia, luogo, posizione, img0, img1, img2, img3, img4, img5, 0, 0);
	$.ajax({
		type: "GET",
		url: "/dammiId",
		contentType: "application/json",
		//	data: JSON.stringify(annuncio),
		success: function(risposta) {
			annuncio.id = risposta;
			var other = new Annuncio(annuncio.id, idVenditore, descrizione, tipoVendita, prezzo, metri_quadri, tipologia, luogo, posizione, img0, img1, img2, img3, img4, img5, latitudine, longitudine);

			$.ajax({
				type: "POST",
				url: "/addAnnuncio",
				contentType: "application/json",
				data: JSON.stringify(other),
				success: function() {
					aggiungiInTabellaAnnuncio(other);

					alert("OK");


				}

			});




		}

	});



}

function cancellaAnnuncio() {
	var btnRimuoviAnnuncio = document.querySelector("#btnCancellaAnnuncio");
	btnRimuoviAnnuncio.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				var annuncio;
				$.ajax({
					type: "GET",
					url: "/dammiAnnunci",
					contentType: "application/json",
					success: function(risposta) {
						for (var i = 0; i < risposta.length; i++) {
							if (risposta[i].id == id) {
								annuncio = new Annuncio(risposta[i].id, risposta[i].idVenditore, risposta[i].descrizione, risposta[i].vendita, risposta[i].prezzo, risposta[i].metriQuadri, risposta[i].tipologia, risposta[i].luogo, risposta[i].posizione, risposta[i].img0, risposta[i].img1, risposta[i].img2, risposta[i].img3, risposta[i].img4, risposta[i].img5, 0, 0);
							}
						}
						cancallaAnnuncioDaDb(annuncio);
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});

}

function cancallaAnnuncioDaDb(annuncio) {
	$.ajax({
		type: "POST",
		url: "/deleteAnnuncio",
		contentType: "application/json",
		data: JSON.stringify(annuncio),
		success: function() {
			cancellaAnnuncioDaTabella(annuncio);
		}
	});


}

function cancellaAnnuncioDaTabella(annuncio) {
	var rigaDaCancellare = document.querySelector("#riga_" + annuncio.id);
	rigaDaCancellare.remove();
}

function dammiAnnunci() {
	var access = document.querySelector("#accesso").textContent;
	var iduser = document.querySelector("#user").value;
	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		//data: JSON.stringify(ri),
		success: function(risposta) {
			if (access === "Amministratore") {
				for (var i = 0; i < risposta.length; i++) {

					var annuncio = new Annuncio(risposta[i].id, risposta[i].idVenditore, risposta[i].descrizione, risposta[i].vendita, risposta[i].prezzo, risposta[i].metriQuadri, risposta[i].tipologia, risposta[i].luogo, risposta[i].posizione, risposta[i].venduto, risposta[i].img0, risposta[i].img1, risposta[i].img2, risposta[i].img3, risposta[i].img4, risposta[i].img5);
					aggiungiInTabellaAnnuncio(annuncio);
				}

			}
			else if (access === "Venditore") {

				for (var i = 0; i < risposta.length; i++) {
					if (iduser == risposta[i].idVenditore) {
						var annuncio = new Annuncio(risposta[i].id, risposta[i].idVenditore, risposta[i].descrizione, risposta[i].vendita, risposta[i].prezzo, risposta[i].metriQuadri, risposta[i].tipologia, risposta[i].luogo, risposta[i].posizione, risposta[i].venduto, risposta[i].img0, risposta[i].img1, risposta[i].img2, risposta[i].img3, risposta[i].img4, risposta[i].img5);
						aggiungiInTabellaAnnuncio(annuncio);
					}
				}
			}
		}

	});
}


function aggiungiInTabellaAnnuncio(annuncio) {
	var tableElement = document.querySelector("#tabellaAnnunci tbody");
	var riga = tableElement.insertRow(-1);

	riga.setAttribute("id", "riga_" + annuncio.id);

	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + annuncio.id + "\" type=\"checkbox\" /> " + annuncio.id;


	var cellaIdVenditore = riga.insertCell(1);
	cellaIdVenditore.textContent = annuncio.idVenditore;

	var cellaMetriQuadri = riga.insertCell(2);
	cellaMetriQuadri.textContent = annuncio.metriQuadri;

	var cellaPrezzo = riga.insertCell(3);
	cellaPrezzo.textContent = annuncio.prezzo;

	var cellaTipologia = riga.insertCell(4);
	cellaTipologia.textContent = annuncio.tipologia;
	var cellaLuogo = riga.insertCell(5);
	cellaLuogo.textContent = annuncio.luogo;
	var cellaPosizione = riga.insertCell(6);
	cellaPosizione.textContent = annuncio.posizione;
	var cellaVendita = riga.insertCell(7);

	if (annuncio.vendita == false) {
		cellaVendita.textContent = "affitto";
	} else {
		cellaVendita.textContent = "vendita";
	}



}
