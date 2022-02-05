

window.addEventListener("load", function() {
	dammiUtente();
	eventiUtenti();
});

function eventiUtenti() {

	var btnAggiungiUtente = document.querySelector("#btnAggiungiUtente");
	btnAggiungiUtente.addEventListener("click", controllaCampi2);

	var btnRimuoviUtente = document.querySelector("#btnCancellaUtente");
	btnRimuoviUtente.addEventListener("click", cancellaUtente);


	var btnOrdinaUtente = document.querySelector("#btnOrdinaUtente");
	btnOrdinaUtente.addEventListener("click", ordinaUtente);

	var s = document.getElementById("show1");
	s.addEventListener("click", mostraPassword);
	var s2 = document.getElementById("show2");
	s2.addEventListener("click", mostraPassword2);

	var bannaSblocca = document.querySelector("#bannaUtente");
	bannaSblocca.addEventListener("click", function() {

		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				

				$.ajax({
					type: "POST",
					url: "/findByKeyUtente",
					data: JSON.stringify(id),
					contentType: "application/json",
					success: function(risposta) {
						if (risposta.bannato == false) {
							cancellaInTaballaUtente(risposta);
							risposta.bannato = true;
							$.ajax({
								type: "POST",
								url: "/aggiornaUtente",
								data: JSON.stringify(risposta),
								contentType: "application/json",
								success: function() {
									aggiungiInTabellaUtente(risposta);
								}
							});


						} else {
							cancellaInTaballaUtente(risposta);
							risposta.bannato = false;
						
							$.ajax({
								type: "POST",
								url: "/aggiornaUtente",
								data: JSON.stringify(risposta),
								contentType: "application/json",
								success: function() {
									aggiungiInTabellaUtente(risposta);
								}
							});

						}
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});

	var btnModifica = document.querySelector("#bottoneModifica");
	btnModifica.addEventListener("click", function() {

		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length == 1) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");
				document.querySelector("#idUtenteDaModificare").innerHTML = "Utente Da Modificare ID: " + id;
				var utente;
				$.ajax({
					type: "POST",
					url: "/findByKeyUtente",
					data: JSON.stringify(id),
					contentType: "application/json",
					success: function(risposta) {
						addVecchiDati(risposta);
					}
				});


				var btnAggiungiModifica = document.querySelector("#btnAggiungiModifica");
				btnAggiungiModifica.addEventListener("click", function() {
					var id = checkBox.getAttribute("id");

					var nome = document.querySelector("#campoNome2").value;
					var cognome = document.querySelector("#campoCognome2").value;
					var email = document.querySelector("#campoEmail2").value;
					var username = document.querySelector("#campoUsername2").value;
					var password = document.querySelector("#campoPassword12").value;
					var cPassword22 = document.querySelector("#campoPassword22").value;
					var tipologia = document.querySelector("#campoTipo2").value;
					var img = document.querySelector("#campoImgProfilo2").value;

					if (img.length < 10) {
						img = "http://localhost:8080/img/noImage0.png";
					}
					var bannato = false;
					var utente2 = new Utente(id, email, username, password, nome, cognome, tipologia, img, bannato);

					$.ajax({
						type: "POST",
						url: "/findByKeyUtente",
						data: JSON.stringify(id),
						contentType: "application/json",
						success: function(risposta) {
							risposta.id = id;
							risposta.email = email;
							risposta.username = username;
							risposta.password = password;
							risposta.nome = nome;
							risposta.cognome = cognome;
							risposta.accesso = tipologia;
							risposta.img = img;
							cancellaInTaballaUtente(risposta);

							$.ajax({
								type: "POST",
								url: "/aggiornaUtente",
								data: JSON.stringify(risposta),
								contentType: "application/json",

							});


							aggiungiInTabellaUtente(risposta);
						}
					});




				});



			});
		}

	});
}



function addVecchiDati(utente) {
	document.querySelector("#vecchioNome").innerHTML = utente.nome;
	document.querySelector("#vecchioCognome").innerHTML = utente.cognome;
	document.querySelector("#vecchiaEmail").innerHTML = utente.email;
	document.querySelector("#vecchioUsername").innerHTML = utente.username;
	document.querySelector("#vecchiaPassword").innerHTML = utente.password;
	document.querySelector("#vecchiaPassword2").innerHTML = utente.password;
	document.querySelector("#vecchioLinkImmagine").innerHTML = utente.img;
	document.querySelector("#vecchioTipoUtente").innerHTML = utente.accesso;
}

function mostraPassword() {
	var x = document.getElementById("campoPassword1");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}
function mostraPassword2() {
	var x = document.getElementById("campoPassword2");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}

function dammiUtente() {
	$.ajax({
		type: "GET",
		url: "/findAllUtenti",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				if (risposta[i].accesso != "Amministratore") {
					aggiungiInTabellaUtente(utente);
				}

			}
		}

	});
}

function aggiungiInTabellaUtente(utente) {
	var tableElement = document.querySelector("#tabellaUtenti tbody");
	var riga = tableElement.insertRow(-1);


	riga.setAttribute("id", "riga_" + utente.id);

	var cellaCheckbox = riga.insertCell(0);
	cellaCheckbox.innerHTML = "<input id=\"" + utente.id + "\" type=\"checkbox\" /> " + utente.id;


	var cellaUsername = riga.insertCell(1);
	cellaUsername.textContent = utente.username;

	var cellaNome = riga.insertCell(2);
	cellaNome.textContent = utente.nome;

	var cellaCognome = riga.insertCell(3);
	cellaCognome.textContent = utente.cognome;

	var cellaEmail = riga.insertCell(4);
	cellaEmail.textContent = utente.email;

	var cellaAccesso = riga.insertCell(5);
	cellaAccesso.textContent = utente.accesso;

	var cellaBan = riga.insertCell(6);
	if (utente.bannato == true) {
		cellaBan.textContent = "SI";
	} else {
		cellaBan.textContent = "NO";
	}



}

function controllaCampi2() {

	var cNome = document.querySelector("#campoNome").value;
	var cCognome = document.querySelector("#campoCognome").value;
	var cEmail = document.querySelector("#campoEmail").value;
	var cUsername = document.querySelector("#campoUsername").value;
	var cPassword1 = document.querySelector("#campoPassword1").value;
	var cPassword2 = document.querySelector("#campoPassword2").value;
	var cTipo = document.querySelector("#campoTipo").value;
	var cImg = document.querySelector("#campoImgProfilo").value;
	if (cImg.length < 10) {
		cImg = "http://localhost:8080/img/noImage0.png";
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

		dammiIdUtente(utente);

	}

}




function dammiIdUtente(utente) {

	$.ajax({
		type: "GET",
		url: "/dammiId",
		contentType: "application/json",
		success: function(risposta) {
			utente.id = risposta;

			aggiungiUtente2(utente);
		}
	});
}

function aggiungiUtente2(utente) {

	$.ajax({
		type: "POST",
		url: "/addUtente",
		contentType: "application/json",
		data: JSON.stringify(utente),
		success: function() {

			aggiungiInTabellaUtente(utente);

		}

	});

}


function ordinaUtente() {
	var sort = document.querySelector("#campoSortUtente").value;
	if (sort === "nomeCrescente") {
		ordinaNomiCrescente();
	} else if (sort === "nomeDecrescente") {
		ordinaNomiDecrescente();
	} else if (sort === "cognomeCrescente") {
		ordinaCognomeCrescente();

	} else if (sort === "cognomeDecrescente") {
		ordinaCognomeDecrescente();
	} else if (sort === "usernameCrescente") {
		ordinaUsernameCrescente();

	} else if (sort === "usernameDecrescente") {
		ordinaUsernameDecrescente();
	} else if (sort === "idCrescente") {
		ordinaIdCrescente();

	} else if (sort === "idDecrescente") {
		ordinaIdDecrescente();
	}
}

function ordinaNomiCrescente() {
	$.ajax({
		type: "GET",
		url: "/nomeCrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);
			}
		}

	});
}

function ordinaNomiDecrescente() {
	$.ajax({
		type: "GET",
		url: "/nomeDecrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}

function ordinaCognomeCrescente() {
	$.ajax({
		type: "GET",
		url: "/cognomeCrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}

function ordinaCognomeDecrescente() {
	$.ajax({
		type: "GET",
		url: "/cognomeDecrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);
			}
		}

	});
}


function ordinaUsernameCrescente() {
	$.ajax({
		type: "GET",
		url: "/usernameCrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}

function ordinaUsernameDecrescente() {
	$.ajax({
		type: "GET",
		url: "/usernameDecrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}

function ordinaIdCrescente() {
	$.ajax({
		type: "GET",
		url: "/idCrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}

function ordinaIdDecrescente() {
	$.ajax({
		type: "GET",
		url: "/idDecrescente",
		contentType: "application/json",
		//data: JSON.stringify(),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				var utente = new Utente(risposta[i].id, risposta[i].email, risposta[i].username, risposta[i].password, risposta[i].nome, risposta[i].cognome, risposta[i].accesso, risposta[i].img, risposta[i].bannato);
				cancellaInTaballaUtente(utente);
				aggiungiInTabellaUtente(utente);

			}
		}

	});
}


function cancellaUtente() {
	btnCancellaUtente.addEventListener("click", function() {


		var selectedCheckBoxes = document.querySelectorAll("input:checked");
		if (selectedCheckBoxes.length > 0) {
			selectedCheckBoxes.forEach(function(checkBox, indice) {

				var id = checkBox.getAttribute("id");

				$.ajax({
					type: "POST",
					url: "/findByKeyUtente",
					data: JSON.stringify(id),
					contentType: "application/json",
					success: function(risposta) {

						cancallaUtenteDalDB(risposta);
					}
				});
			});
		} else {
			alert("Si prega di selezionare almeno un elemento");
		}

	});
}

function cancallaUtenteDalDB(utente) {
	$.ajax({
		type: "POST",
		url: "/deleteUtente",
		contentType: "application/json",
		data: JSON.stringify(utente),
		success: function() {
			cancellaInTaballaUtente(utente);
		}
	});


}

function cancellaInTaballaUtente(utente) {
	var rigaDaCancellare = document.querySelector("#riga_" + utente.id);
	rigaDaCancellare.remove();
}


