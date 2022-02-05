/**
 * 
 */



window.addEventListener("load", function() {

	var visita = document.querySelector("#idUtente");
	visita.addEventListener("click", creaVisita);
});

function creaVisita() {

	var idVenditore = document.querySelector("#idv").value;
	var idAnnuncio = document.querySelector("#idae").value;
	var idAcquirente = document.querySelector("#idUtente").value;
	if (idAcquirente == 0) { alert("Devi fare la login per richiedere una visita"); } else {

		$.ajax({
			type: "GET",
			url: "/dammiId",
			contentType: "application/json",

			success: function(risposta) {

				var visita = new Visita(risposta, idAcquirente, idVenditore, idAnnuncio, false);
				aggiungiVisitaAlDb(visita);
			}


		});
	}

}


function aggiungiVisitaAlDb(visita) {
	$.ajax({
		type: "POST",
		url: "/addVisita",
		contentType: "application/json",
		data: JSON.stringify(visita),
		success: function() {


			alert("OK");


		}

	});
}
