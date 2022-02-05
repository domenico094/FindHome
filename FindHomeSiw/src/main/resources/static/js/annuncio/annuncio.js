window.addEventListener("load", function() {
	eventiAnnuncio();

});

function eventiAnnuncio() {
	aggiungiInfoVenditore();
	aggiungiAlCarrello();
}

function aggiungiAlCarrello() {
	var btnAggiungiAlCarrello = document.querySelector("#addOnShoppingCart3");
	btnAggiungiAlCarrello.addEventListener("click", controllaEAggiungi);
}

function controllaEAggiungi() {
	var c = document.querySelector("#idUtente").value;

	if (c == 0) {
		alert("Devi fare la Login");
	} else {
		controllaVisite();
	}
}

function controllaVisite() {
	var e = document.querySelector("#idae").value;
	var c = document.querySelector("#idUtente").value;
	var x = document.querySelector("#idv").value;
	
	var test = 1;
	$.ajax({
		type: "GET",
		url: "/dammiVisite",
		contentType: "application/json",
		success: function(other) {

			for (var i = 0; i < other.length; i++) {
				if (other[i].idAnnuncio == e && c == other[i].idAcquirente && other[i].effettuata == true) {
					if (c != x) {
						aggiungiIdAdOrdine();
						test = 0;
					} else if (c == x) {
						alert("Non puoi comprare gili immobili che vendi tu stesso ");
					}


				}
			} if (test == 1) {
				alert("Devi richiedere/effettuare una visita prima di aggiungere al carrello");
			}
		}
	});


}

function aggiungiIdAdOrdine() {
	var e = document.querySelector("#idae").value;
	var c = document.querySelector("#idUtente").value;
	var flag = false;
	$.ajax({
		type: "POST",
		url: "/dammiOrdiniByIdUtente",
		contentType: "application/json",
		data: JSON.stringify(c),
		success: function(risposta) {
			if(risposta.length > 0) {
					for (var i = 0; i < risposta.length; i++) {
						if(risposta[i].idAnnuncio == e) {
							flag=true;
							alert("Immobile già presente nel carrello");
						}
					}
					if(flag == false) {
						funzioneDammiIdAdd();
					}
			} else {
				funzioneDammiIdAdd();
			}
		}
	});



	

}

function funzioneDammiIdAdd() {
	var e = document.querySelector("#idae").value;
	var c = document.querySelector("#idUtente").value;
	$.ajax({
		type: "GET",
		url: "/dammiId",
		contentType: "application/json",
		success: function(risposta) {
			var ordine = new Ordine(risposta, c, e);
			aggiungiOrdine(ordine);
		}

	});
}

function aggiungiOrdine(ordine) {

	$.ajax({
		type: "POST",
		url: "/addOrdine",
		contentType: "application/json",
		data: JSON.stringify(ordine),
		success: function() {
			alert("ordine aggiunto ne tuo carrello");

		}

	});

}

function aggiungiInfoVenditore() {
	var x = document.querySelector("#idv").value;
	$.ajax({
		type: "POST",
		url: "/findByKeyUtente",
		contentType: "application/json",
		data: JSON.stringify(x),
		success: function(risposta) {


			aggiungiVenditoreAdAnnuncio(risposta);


		}


	});
}


function aggiungiVenditoreAdAnnuncio(risposta) {

	var nomeCognome = risposta.nome + " " + risposta.cognome;
	var a = risposta.accesso;
	var e = risposta.email;
	document.querySelector("#NomeCognome").innerHTML += nomeCognome;
	document.querySelector("#Accesso").innerHTML += a;
	document.querySelector("#Email").innerHTML += e;
	document.querySelector("#venditoreFoto").innerHTML += "<img src='" + risposta.img + "'  class='img-fluid'>";




}
