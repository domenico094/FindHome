/* 
	js di base per tutte le pagine
*/


/*
	  Modelli Dati
*/

function Utente(id, email, username, password, nome, cognome, accesso, img, bannato) {
	this.id = id;
	this.email = email;
	this.username = username;
	this.password = password;
	this.nome = nome;
	this.cognome = cognome;
	this.accesso = accesso;
	this.img = img;
	this.bannato = bannato;

}

function Recensione(id, idAcquirente, idAnnuncio, titolo, autore, messaggio) {
	this.id = id;
	this.idAcquirente = idAcquirente;
	this.idAnnuncio = idAnnuncio;
	this.titolo = titolo;
	this.autore = autore;
	this.messaggio = messaggio;
}

function Annuncio(id, idVenditore, descrizione, vendita, prezzo,  metriQuadri, tipologia, luogo, posizione,  img0, img1, img2, img3, img4, img5,latitudine,longitudine) {
	this.id = id;
	this.idVenditore = idVenditore;
	this.descrizione = descrizione;
	this.vendita = vendita;
	this.prezzo = prezzo;
	this.metriQuadri = metriQuadri;
	this.tipologia = tipologia;
	this.luogo = luogo;
	this.posizione = posizione;

	this.img0 = img0;
	this.img1 = img1;
	this.img2 = img2;
	this.img3 = img3;
	this.img4 = img4;
	this.img5 = img5;
	
	this.latitudine = latitudine;
	this.longitudine = longitudine;
}

function Visita(id, idAcquirente, idVenditore, idAnnuncio, effettuata) {
	this.id = id;
	this.idAcquirente = idAcquirente;
	this.idVenditore = idVenditore;
	this.idAnnuncio = idAnnuncio;
	this.effettuata = effettuata;
}

function Ordine(id,idUtente,idAnnuncio) {
	this.id = id;
	this.idUtente = idUtente;
	this.idAnnuncio = idAnnuncio;
}

function CartaDiCredito(id,idUtente,numeroSeriale,cvv,annoScadenza,meseScadenza,credito) {
	this.id=id;
	this.idUtente = idUtente;
	this.numeroSeriale = numeroSeriale;
	this.cvv = cvv;
	this.annoScadenza = annoScadenza;
	this.meseScadenza = meseScadenza;
	this.credito = credito;
}

window.addEventListener("load", function() {

	eventiMain();

});

function eventiMain() {
	// Ricerca
	var btnFiltraCerca = document.querySelector("#searching");
	if(btnFiltraCerca != null) {
	btnFiltraCerca.addEventListener("click", ricerca);
}
	// Contatori
	aggiungiConteggio();


	// Registrazione
	var btnRegistrazione = document.querySelector("#navBtnRegistrazione");
	if (btnRegistrazione != null) {
		btnRegistrazione.addEventListener("click", registrazione);
	}

	// Login 
	var checkShowPassword = document.querySelector("#showPass");
	if (checkShowPassword != null) {
		checkShowPassword.addEventListener("click", mostraLoginPass);
	}
	
	// NewsLetter 
	var btnNewsLetter = document.querySelector("#newsletter");
	btnNewsLetter.addEventListener("click", aggiungiNewsLetter);
}

/*
		Ricerca  
*/
function ricerca() {
	cancellaAnnuncioDaTabellaRicerca();
	var maxMq = document.querySelector("#mqMax").value;
	var minMq = document.querySelector("#mqMin").value;
	var maxPrezzo = document.querySelector("#prezzoMax").value;
	var minPrezzo = document.querySelector("#prezzoMin").value;

	var tipologia = document.querySelector("#Tipologia").value;


	var luogo = document.querySelector("#myInputLuogo").value;
	var venduto = document.querySelector("#Valore").value;
	var a;
	if(venduto ==="Affitto") {
		a = false;
	} else {
		a = true;
	}
	console.log("fine");

	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				
				if(tipologia ==="Nullo" && luogo ==="") {
					if (risposta[i].metriQuadri <= maxMq && risposta[i].metriQuadri >= minMq && risposta[i].prezzo >= minPrezzo && risposta[i].prezzo <= maxPrezzo && risposta[i].vendita==a) {
						aggiungiAnnunciAllaTabellaRicerca(risposta[i]);
					}
				} else if (luogo === "" && tipologia != "Nullo") {
					if (risposta[i].metriQuadri <= maxMq && risposta[i].metriQuadri >= minMq && risposta[i].prezzo >= minPrezzo && risposta[i].prezzo <= maxPrezzo && tipologia == risposta[i].tipologia && risposta[i].vendita==a) {
						aggiungiAnnunciAllaTabellaRicerca(risposta[i]);
					}
				}
				
				else if (luogo != "" && tipologia != "Nullo") {
					if (risposta[i].metriQuadri <= maxMq && risposta[i].metriQuadri >= minMq && risposta[i].prezzo >= minPrezzo && risposta[i].prezzo <= maxPrezzo && tipologia == risposta[i].tipologia && luogo == risposta[i].luogo && risposta[i].vendita==a) {
						aggiungiAnnunciAllaTabellaRicerca(risposta[i]);
					}
				}  else if (luogo != "" && tipologia === "Nullo") {
					if (risposta[i].metriQuadri <= maxMq && risposta[i].metriQuadri >= minMq && risposta[i].prezzo >= minPrezzo && risposta[i].prezzo <= maxPrezzo && luogo == risposta[i].luogo && risposta[i].vendita==a) {
						aggiungiAnnunciAllaTabellaRicerca(risposta[i]);
					}
				}

			}
		}
	});

}
function aggiungiAnnunciAllaTabellaRicerca(risposta) {


	console.log(risposta);


	var tableElement = document.querySelector("#risultati_ricerca tbody");
	var riga = tableElement.insertRow(0);


	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<img src=' " + risposta.img0 + "' >";


	var cellaId = riga.insertCell(1);
	cellaId.textContent = risposta.id;

	var cellaMq = riga.insertCell(2);
	cellaMq.textContent = risposta.metriQuadri + " mq";

	var cellaPrezzo = riga.insertCell(3);
	cellaPrezzo.textContent = risposta.prezzo + " €";

	var cellaTipologia = riga.insertCell(4);
	cellaTipologia.textContent = risposta.tipologia;

	var cellaLuogo = riga.insertCell(5);
	cellaLuogo.textContent = risposta.luogo;



	var cellaButton = riga.insertCell(6);
	cellaButton.innerHTML = "<a  href='annuncioPage/" + risposta.id + "' >vedi> </a>";

}



function cancellaAnnuncioDaTabellaRicerca() {
	var rigaDaCancellare = document.querySelector("#risultati_ricerca tbody");
	rigaDaCancellare.innerHTML = "";
}

/*
	Fine Ricerca
*/


/*
	Contatori

*/

function aggiungiConteggio() {
	$.ajax({
		type: "GET",
		url: "/dammiAnnunci",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			addCountA(risposta.length);
		}

	});
	$.ajax({
		type: "GET",
		url: "/findAllUtenti",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			var cont = 0;
			for(var i = 0; i< risposta.length;i++) {
				if(risposta[i].accesso ==="Venditore") {
					cont ++;
				}
			}
			
			addCountV(cont);
		}

	});
	$.ajax({
		type: "GET",
		url: "/findAllUtenti",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			addCountU(risposta.length);
		}

	});
}

function addCountU(a) {
	document.querySelector("#numUtenti").innerHTML = a;
}

function addCountA(a) {
	document.querySelector("#numAnnunci").innerHTML = a;
}

function addCountV(a) {
	document.querySelector("#numVenditori").innerHTML = a;
}

/*
	Fine Contatori

*/

/*
	Registrazione


*/


function registrazione() {

	var btnRegistraUtente = document.querySelector("#btnRegistra");
	btnRegistraUtente.addEventListener("click", controllaCampiRegistrazione);

	var s = document.getElementById("show1");
	s.addEventListener("click", mostraPassword1Registrazione);

	var s2 = document.getElementById("show2");
	s2.addEventListener("click", mostraPassword2Registrazione);
}

function mostraPassword1Registrazione() {
	var x = document.getElementById("campoPassword1");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}
function mostraPassword2Registrazione() {
	var x = document.getElementById("campoPassword2");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}

function controllaCampiRegistrazione() {

	var cNome = document.querySelector("#campoNome").value;
	var cCognome = document.querySelector("#campoCognome").value;
	var cEmail = document.querySelector("#campoEmail").value;
	var cUsername = document.querySelector("#campoUsername").value;
	var cPassword1 = document.querySelector("#campoPassword1").value;
	var cPassword2 = document.querySelector("#campoPassword2").value;
	var cTipo = document.querySelector("#campoTipo").value;
	var cImg = document.querySelector("#campoImgProfilo").value;
if(cImg.length < 10) {
	cImg=	"http://localhost:8080/img/noImage0.png";
	}

	if ((cNome == "") || (cNome == "undefined") || (cNome.length < 3)) {
		alert("Il campo: NOME è obbligatorio oppure troppo corto.");
		document.form.cNome.focus();
		return false;
	}
	else if ((cCognome == "") || (cCognome == "undefined") || (cCognome.length < 3)) {
		alert("Il campo: COGNOME è obbligatorio oppure troppo corto.");
		document.form.cCognome.focus();
		return false;
	}

	else if ((cUsername == "") || (cUsername == "undefined") || (cUsername.length < 3)) {
		alert("Il campo: nome utente è obbligatorio oppure troppo corto.");
		document.form1.cUsername.focus();
		return false;
	}

	if ((cPassword1 == "") || (cPassword1 == "undefined")) {
		alert("Il campo: PASSWORD è obbligatorio.");
		document.form1.cPassword1.focus();
		return false;
	}
	else if (cPassword1.length < 8) {
		alert("Il campo: PASSWORD deve contenere almeno 8 caratteri.");
		document.form1.cPassword1.focus();
		return false;
	}
	else if ((cPassword2 == "") || (cPassword2 == "undefined")) {
		alert("Il campo: CONFERMA PASSWORD è obbligatorio.");
		document.form1.cPassword2.focus();
		return false;
	}
	else if (cPassword1 != cPassword2) {
		alert("ATTENZIONE! LE 2 PASSWORD NON COINCIDONO");
		document.form1.cPassword2.focus();
		return false;
	}


	else {
		var utente = new Utente(0, cEmail, cUsername, cPassword1, cNome, cCognome, cTipo, cImg, false);

		dammiId(utente);
	}

}

function dammiId(utente) {

	$.ajax({
		type: "GET",
		url: "/dammiId",
		contentType: "application/json",
		success: function(risposta) {
			utente.id = risposta;
			aggiungiUtente(utente);
		}
	});
}

function aggiungiUtente(utente) {

	$.ajax({
		type: "POST",
		url: "/addUtente",
		contentType: "application/json",
		data: JSON.stringify(utente),
		success: function() {
			alert("Registrazione effettuata con successo ora puoi fare accedere con le tue credenziali");


		}

	});
}

/* 
	Fine Registrazione

*/

/*
		Login
*/

function mostraLoginPass() {
	var x = document.getElementById("MyPassword");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}


/*
	NewsLetter 
	
*/

function aggiungiNewsLetter() {
	var email = document.querySelector("#newsletterEmail").textContent;
	$.ajax({
		type: "POST",
		url: "/addNeswLetter",
		contentType: "application/json",
		data: JSON.stringify(email),
		success: function() {
			alert("Iscrizione effettuata con sucesso , EMAIL aggiunta");
		}

	});
	
}
