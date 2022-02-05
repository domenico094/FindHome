/**
 * 
 */function Visita(id, idAcquirente, idVenditore, idAnnuncio, effettuata) {
	this.id = id;
	this.idAcquirente = idAcquirente;
	this.idVenditore = idVenditore;
	this.idAnnuncio = idAnnuncio;
	this.effettuata = effettuata;
}



window.addEventListener("load", function() {
	var x = document.querySelector("#user").value;
	var a = document.querySelector("#accesso").textContent;
	
	$.ajax({
		type: "GET",
		url: "/dammiVisite",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				if (a == "Amministratore") {
					aggiungiInTabellaVisite(risposta[i]);
				} else if (a == "Venditore" || a == "Acquirente") {
					if (x == risposta[i].idVenditore || x == risposta[i].idAcquirente) {
						aggiungiInTabellaVisite(risposta[i]);
					}
				}
			}
		}

	});
	cancellaVisita();
	var a = document.querySelector("#accesso").textContent;
	if (a != "Acquirente") {
		abilitaVisita();
	}
});


function aggiungiInTabellaVisite(visita) {
	var tableElement = document.querySelector("#tabellaVisite tbody");
	var riga = tableElement.insertRow(-1);
	//riga.innerHTML = "<td>" + studente.matricola + "</td>"
	//				+ "<td>" + studente.nome + "</td>"
	//				+ "<td>" + studente.cognome + "</td>";

	riga.setAttribute("id", "riga_" + visita.id);

	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + visita.id + "\" type=\"checkbox\" /> " + visita.id;


	var cellaMatricola = riga.insertCell(1);
	cellaMatricola.textContent = visita.idAcquirente;

	var cellaCognome = riga.insertCell(2);
	cellaCognome.textContent = visita.idVenditore;

	var cellaNome = riga.insertCell(3);
	cellaNome.textContent = visita.idAnnuncio;
	cellaNome.innerHTML += "<a style='margin-left: 5px;' class='' href='/annuncioPage/" + visita.idAnnuncio + "' > vedi </a>";

	if (visita.effettuata == false) {
		var cellamq = riga.insertCell(4);
		cellamq.textContent = "NO";
	} else {
		var cellamq = riga.insertCell(4);
		cellamq.textContent = "SI";
	}


}
function abilitaVisita() {


	var btnAbilitaVisita = document.querySelector("#btnAbilitaVisita");
	btnAbilitaVisita.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {
				var test = 0;
				var id = checkBox.getAttribute("id");
				var visita;
				$.ajax({
					type: "GET",
					url: "/dammiVisite",
					contentType: "application/json",
					success: function(risposta) {
						for (var i = 0; i < risposta.length; i++) {
							if (risposta[i].id == id) {
								visita = new Visita(risposta[i].id, risposta[i].idAcquirente, risposta[i].idVenditore, risposta[i].idAnnuncio, risposta[i].effettuata);
								test = 1;
							}

						}
						if (test == 1) {
							abilitaNelDb(visita);
						}
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});
}

function abilitaNelDb(visita) {
	$.ajax({
		type: "POST",
		url: "/abilitaVisita",
		contentType: "application/json",
		data: JSON.stringify(visita),
		success: function() {
		}
	});

}



function cancellaVisita() {
	var btnRimuoviVisita = document.querySelector("#btnCancellaVisita");
	btnRimuoviVisita.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				var visita;
				$.ajax({
					type: "GET",
					url: "/dammiVisite",
					contentType: "application/json",
					success: function(risposta) {
						for (var i = 0; i < risposta.length; i++) {
							if (risposta[i].id == id) {
								visita = new Visita(risposta[i].id, risposta[i].idAcquirente, risposta[i].idVenditore, risposta[i].idAnnuncio, risposta[i].effettuata);
							}
						}
						cancallaVisitaDaDb(visita);
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});

}

function cancallaVisitaDaDb(visita) {
	
	$.ajax({
		type: "POST",
		url: "/deleteVisita",
		contentType: "application/json",
		data: JSON.stringify(visita),
		success: function() {
			cancellaVisitaDaTabella(visita);
		}
	});


}

function cancellaVisitaDaTabella(visita) {
	var rigaDaCancellare = document.querySelector("#riga_" + visita.id);
	rigaDaCancellare.remove();
}

