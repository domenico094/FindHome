
window.addEventListener("load", function() {
	eventiIndex();
});


function eventiIndex() {

	// Ultimi Annunci
	aggiungiUltimiAnnunci();

	// Ultimi Venditori 
	aggiungiUltimiVenditori();
}

/*
	Ultimi Annunci
*/

function aggiungiUltimiAnnunci() {
	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		success: function(risposta) {
			for (var i = risposta.length - 4; i < risposta.length; i++) {
				aggiungiAnnunciAllaPagina(risposta[i]);
			}
		}
	});
}

function aggiungiAnnunciAllaPagina(risposta) {
	document.querySelector("#ultimiAnnunci").innerHTML += '<div id="startItem" class="col-lg-6"><div class="annuncioCard"> <div class="pic1"> <img src="'+ risposta.img0 +' " class="img-fluid"></div> <div> <br><h4>Annunci n°'+ risposta.id + ' </h4> <span>'+ risposta.metriQuadri + " mq, " + risposta.prezzo + ' € </span><p> '+ risposta.descrizione + ' </p><br> <a href="/annuncioPage/'+ risposta.id +' " class="myButton"> vedi </a></div></div></div>';
}


/*
	UltimiVenditori
*/

function aggiungiUltimiVenditori() {

	$.ajax({
		type: "GET",
		url: "/findAllUtenti",
		contentType: "application/json",
		success: function(risposta) {
			for (var i = 0 ; i <= 5; i++) {
				if(risposta[i].accesso === "Venditore") {
				aggiungiVenditoriAllaPagina(risposta[i]);
				}
			}
		}
	});
}

function aggiungiVenditoriAllaPagina(risposta) {
	document.querySelector("#ultimiVenditori").innerHTML += '<div id="startItem" class="col-lg-6"> <div class="annuncioCard">	<div class="pic"> <img src="' + risposta.img + '" class="img-fluid" alt=""> </div> <div><h4>' + risposta.nome + " " + risposta.cognome + '</h4> <span>' + risposta.accesso + '</span> <p> ' + risposta.email + '</p> <br> <a  href="/venditorePage/' + risposta.id + '" class="btn myButton"> vedi</a> </div></div></div></div>';
}