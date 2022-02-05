/**
 * 
 */


window.addEventListener("load", function() {
	dammiAnnunciUtente();
});


function dammiAnnunciUtente() {
	var idVenditore = document.querySelector("#user").value;

	$.ajax({
		type: "POST",
		url: "/dammiAnnunciVenditore",
		contentType: "application/json",
		data: JSON.stringify(idVenditore),
		success: function(risposta) {
			for (var i = 0; i < risposta.length; i++) {
				

				
					
					aggiungiInTabellaAnnuncioUtente(risposta[i]);
				}
			
		}

	});
}


function aggiungiInTabellaAnnuncioUtente(risposta) {
			document.querySelector("#row1").innerHTML += " <div id='startItem' class='col-lg-6'> <div class='annuncioCard ' data-aos='zoom-in' data-aos-delay='100'> <div class='pic1'><img src='"+risposta.img0+"' class='img-fluid'></div> <div class='member-info'> <br> <h4>Annunci n° "+ risposta.id +  " </h4>  <span>"+ risposta.metriQuadri + " mq, "+ risposta.prezzo +" € </span>   <p> "+risposta.descrizione+" </p> <br>  <a  href='/annuncioPage/"+risposta.id+"' class='btn myButton'> vedi</a>  </div>  </div>  </div>   ";

			
			}