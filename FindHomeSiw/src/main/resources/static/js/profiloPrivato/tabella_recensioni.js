
window.addEventListener("load", function() {
	eventiTabellaRecensioni();
});

function eventiTabellaRecensioni() {

	dammiRecensioni();
cancellaRecensione();
}

function dammiRecensioni() {
	var idUser = document.querySelector("#user").value;
	var access = document.querySelector("#accesso").textContent;
	$.ajax({
		type: "GET",
		url: "/dammiRecensioni",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				if (access === 'Amministratore') {
					aggiungiRecensioneInTabella(risposta[i]);
				} else if (access === 'Venditore') {
					controllaAnnunci(risposta[i]);

				} else if (risposta[i].idAcquirente == idUser) {
					aggiungiRecensioneInTabella(risposta[i]);
				}
			}

		}

	});
}

function controllaAnnunci(recensione) {
	var idUser = document.querySelector("#user").value;
	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				if (recensione.idAnnuncio == risposta[i].id && idUser == risposta[i].idVenditore) {
				
						aggiungiRecensioneInTabella(recensione);
					
				}

			}

		}
	});





}

function aggiungiRecensioneInTabella(risposta) {
	var tableElement = document.querySelector("#tabellaRecensioni tbody");
	var riga = tableElement.insertRow(-1);
	//riga.innerHTML = "<td>" + studente.matricola + "</td>"
	//				+ "<td>" + studente.nome + "</td>"
	//				+ "<td>" + studente.cognome + "</td>";

	riga.setAttribute("id", "riga_" + risposta.id);
	
	
	
	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + risposta.id + "\" type=\"checkbox\" /> " + risposta.id;
	
	
	
	var cellaq = riga.insertCell(1);
	cellaq.textContent = risposta.idAcquirente;
	
	

	var cellaCognome = riga.insertCell(2);
	cellaCognome.textContent = risposta.idAnnuncio;

	var cellaNome = riga.insertCell(3);
	cellaNome.textContent = risposta.messaggio;

	


}

function cancellaRecensione() {
		var btnRimuoviRecensione = document.querySelector("#btnCancellaRecensione");
	btnRimuoviRecensione.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				$.ajax({
					type: "GET",
					url: "/dammiRecensioni",
					contentType: "application/json",
					success: function(risposta) {
						for (var i = 0; i < risposta.length; i++) {
							if (risposta[i].id == id) {
								cancellaRecensioneDaDB(risposta[i]);
							}
						}
						
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});
}

function cancellaRecensioneDaDB(recensione) {
	
	$.ajax({
		type: "POST",
		url: "/deleteRecensione",
		contentType: "application/json",
		data: JSON.stringify(recensione),
		success: function() {
			eliminaRecensioneDaTabella(recensione);
		}
	});


}

function eliminaRecensioneDaTabella(risposta) {
	var rigaDaCancellare = document.querySelector("#riga_" + risposta.id);
	rigaDaCancellare.remove();
}





