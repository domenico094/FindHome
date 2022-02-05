let totale = 0;
window.addEventListener("load", function() {

	eventiOrdini();

});

function eventiOrdini() {
	dammiOrdini();

	cancellaOrdini();
	
	var btnCheckOut = document.querySelector("#checkOut") ;
	btnCheckOut.addEventListener("click",funzioneCheckAddTotale); 
	
	var btnPaga = document.querySelector("#btnAggiungiPaga");
	btnPaga.addEventListener("click", pagamento);
}

function funzioneCheckAddTotale() {
	document.querySelector("#totaleDaPagare").innerHTML ='<strong> Totale Euro : ' + totale+ '</strong>' ;
}

function pagamento() {
	var numero = document.querySelector("#campoNumeroCarta").value;
	var mese = document.querySelector("#campoMeseScadenza").value;
	var anno = document.querySelector("#campoAnnoScadenza").value;
	var cvv = document.querySelector("#campoCvv").value;
	var idUtente = document.querySelector("#userIdLog").value;
	
	

	
	
	
	$.ajax({
		type: "POST",
		url: "/findCartaById",
		contentType: "application/json",
		data: JSON.stringify(idUtente),
		success: function(risposta) {
			
			if (risposta.length >0) { 
			for (var i = 0; i < risposta.length; i++) {
					if (risposta[i].numeroSeriale == numero && risposta[i].annoScadenza == anno && risposta[i].cvv == cvv && risposta[i].meseScadenza == mese ) {
						if( totale <= risposta[i].credito) {	
							sottraiCreditoDaCarta(risposta[i], risposta[i].credito - totale);
							eliminaAnnunciNellaTabellaDalDb();
							totale = 0;
							} else {
								alert("ATTENZIONE , non è possibie effettuare il pagamento, il credito nella tua carta è insufficente");
							}


					}
				}
			
			} else {
								alert("Nessun Metotdo di pagamento , aggiungi un carta di credito dal tuo profilo nella sezione metodo di pagamento"); 

			}

		}


	});


}

function eliminaAnnunciNellaTabellaDalDb() {
	// prendi gli ordini
	// elemini dalla tabella tramita id Ordide
	// prendi fli annunci tramite idAnnuncio di Ordine
	var idUtente = document.querySelector("#userIdLog").value;

	$.ajax({
		type: "POST",
		url: "/dammiOrdiniByIdUtente",
		contentType: "application/json",
		data: JSON.stringify(idUtente),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				
				cancellaOrdineDaTabella(risposta[i]);
				var annuncio = new Annuncio(risposta[i].idAnnuncio,0,"",false,0,0,0,"","","","","","","","","",0,0);
				eliminaAnnuncioDaDb(annuncio);
			}
		}


	});
}

function eliminaAnnuncioDaDb ( annuncio) {
	$.ajax({
		type: "POST",
		url: "/deleteAnnuncio",
		contentType: "application/json",
		data: JSON.stringify(annuncio),
		success: function() {
		}


	});
}

function sottraiCreditoDaCarta(risposta,credito) {
	
	var cartaNuova = new CartaDiCredito(risposta.id,risposta.idUtente,risposta.numeroSeriale,risposta.cvv,risposta.annoScadenza,risposta.meseScadenza,credito);
	
	$.ajax({
		type: "POST",
		url: "/updateCarta",
		contentType: "application/json",
		data: JSON.stringify(cartaNuova),
		success: function() {
					alert("pagamento a buon fine");
		}
		

	});
	
	
}

function cancellaOrdini() {
	var btnRimuoviAnnuncio = document.querySelector("#btnCancellaOrdine");
	btnRimuoviAnnuncio.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				var ordine = new Ordine(id, 0, 0);
				$.ajax({
					type: "POST",
					url: "/deleteOrdine",
					contentType: "application/json",
					data: JSON.stringify(ordine),
					success: function() {
						sottraiPrezzo(ordine);
						cancellaOrdineDaTabella(ordine);
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});
}

function sottraiPrezzo(ordine) {
	$.ajax({
		type: "POST",
		url: "/dammiAnnuncio",
		contentType: "application/json",
		data: JSON.stringify(ordine.idAnnuncio),
		success: function(risposta2) {
			cancellaTotale();

			totale = totale - risposta2.prezzo;
			aggiungiTotale();
		}


	});


}

function cancellaTotale() {
	document.querySelector("#totale").innertHTML = "";
}

function cancellaOrdineDaTabella(ordine) {
	cancellaOrdineDaDb(ordine);
	var rigaDaCancellare = document.querySelector("#riga_" + ordine.id);
	rigaDaCancellare.remove();
}

function cancellaOrdineDaDb(ordine) {
	$.ajax({
		type: "POST",
		url: "/deleteOrdine",
		contentType: "application/json",
		data: JSON.stringify(ordine),
		success: function() {
			
		}


	});
}

function dammiOrdini() {
	var idUtente = document.querySelector("#userIdLog").value;

	$.ajax({
		type: "POST",
		url: "/dammiOrdiniByIdUtente",
		contentType: "application/json",
		data: JSON.stringify(idUtente),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				dammiAnnuncio(risposta[i]);
			}
		}


	});
}

function dammiAnnuncio(risposta) {

	$.ajax({
		type: "POST",
		url: "/dammiAnnuncio",
		contentType: "application/json",
		data: JSON.stringify(risposta.idAnnuncio),
		success: function(risposta2) {

			aggiungiInTabellaOrdini(risposta, risposta2);
			totale = totale + risposta2.prezzo;
			aggiungiTotale();


		}


	});

}

function aggiungiInTabellaOrdini(ordine, annuncio) {
	var tableElement = document.querySelector("#ordini_tabella tbody");
	var riga = tableElement.insertRow(-1);

	riga.setAttribute("id", "riga_" + ordine.id);

	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + ordine.id + "\" type=\"checkbox\" /> " + ordine.id;
	
	var cella =riga.insertCell(1);
	cella.textContent = "";
	var cellaIdAnnuncio = riga.insertCell(2);
	cellaIdAnnuncio.textContent = annuncio.id;

	var cellaMetriQuadri = riga.insertCell(3);
	cellaMetriQuadri.textContent = annuncio.metriQuadri;




	var cellaLuogo = riga.insertCell(4);
	cellaLuogo.textContent = annuncio.luogo;
	var cellaPosizione = riga.insertCell(5);
	cellaPosizione.textContent = annuncio.posizione;
	var cellaPrezzo = riga.insertCell(5);
	cellaPrezzo.textContent = annuncio.prezzo;

}

function aggiungiTotale() {
	document.querySelector("#totale").innerHTML = "<strong> Totale : " + totale + " <strong> ";
}


