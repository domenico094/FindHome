

window.addEventListener("load", function() {
	eventiTabellaMetodoPagamento();
});

function eventiTabellaMetodoPagamento() {
	dammiMetodiPagamento();

	var btnAggiuniCarta = document.querySelector("#btnAggiungiMetodoPagamento");
	btnAggiuniCarta.addEventListener("click", aggiungiCarta);

	rimuoviCarta();

}

function rimuoviCarta() {
	var cancellaCarta = document.querySelector("#btnCancellaCarta");
	cancellaCarta.addEventListener("click", function() {

		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				var cartaDiCredito = new CartaDiCredito(id, 0, "", "", "", "", 0);
				$.ajax({
					type: "POST",
					url: "/deleteCarta",
					contentType: "application/json",
					data: JSON.stringify(cartaDiCredito),
					success: function() {
						cancellaCartaDaTabella(cartaDiCredito);
					}
				});


			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}
	});
}



function cancellaCartaDaTabella(carta) {
	var rigaDaCancellare = document.querySelector("#riga_" + carta.id);
	rigaDaCancellare.remove();
}

function aggiungiCarta() {

	var idUtente = document.querySelector("#userIdLog").value;
	var numeroSeriale = document.querySelector("#campoNumeroCarta").value;
	var cvv = document.querySelector("#campoCvv").value;
	var annoScadenza = document.querySelector("#campoAnnoScadenza").value;
	var meseScadenza = document.querySelector("#campoMeseScadenza").value;

	$.ajax({
		type: "GET",
		url: "/dammiId",
		contentType: "application/json",
		success: function(risposta) {
			var cartaDiCredito = new CartaDiCredito(risposta, idUtente, numeroSeriale, cvv, annoScadenza, meseScadenza, 10000000);
			aggiungiCartaAlDb(cartaDiCredito);





		}

	});

}

function aggiungiCartaAlDb(carta) {
	$.ajax({
		type: "POST",
		url: "/addCarta",
		contentType: "application/json",
		data: JSON.stringify(carta),
		success: function() {
			aggiungiInTabellaCarte(carta);

			alert("OK");


		}

	});
}

function dammiMetodiPagamento() {

	var userId = document.querySelector("#userIdLog").value;

	$.ajax({
		type: "POST",
		url: "/findCartaById",
		contentType: "application/json",
		data: JSON.stringify(userId),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {

				aggiungiInTabellaCarte(risposta[i]);

			}
		}

	});
}

function aggiungiInTabellaCarte(risposta) {
	var tableElement = document.querySelector("#carteDiCredito tbody");
	var riga = tableElement.insertRow(-1);

	riga.setAttribute("id", "riga_" + risposta.id);

	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + risposta.id + "\" type=\"checkbox\" /> " + risposta.id;
	
	var a = riga.insertCell(1);
	a.textContent ="";

	var cellaNumero = riga.insertCell(2);
	cellaNumero.textContent = risposta.numeroSeriale;



	var cellaMese = riga.insertCell(3);
	cellaMese.textContent = risposta.meseScadenza;

	var cellaAnno = riga.insertCell(4);
	cellaAnno.textContent = risposta.annoScadenza;

	var cellaCvv = riga.insertCell(5);
	cellaCvv.textContent = risposta.cvv

	var cellaCredito = riga.insertCell(6);
	cellaCredito.textContent = risposta.credito;

}