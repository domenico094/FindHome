window.addEventListener("click",function() {
	
	var btn = document.querySelector("#inviaEmail");
	btn.addEventListener("click",invia);
	
	var btnVenditori = document.querySelector("#inviaEmailVenditori");
	btnVenditori.addEventListener("click",scriviVenditori);
	
	var btnVenditori = document.querySelector("#inviaEmailUtenti");
	btnVenditori.addEventListener("click",scriviUtenti);
	
});

function invia() {
	var messaggio = document.querySelector("#formEmail").value;
	
	$.ajax({
		type: "POST",
		url: "/inviaEmail",
		contentType: "application/json",
		data: JSON.stringify(messaggio),
		

	});
}
function scriviUtenti() {
	var messaggio = document.querySelector("#formEmailUtenti").value;
	
	$.ajax({
		type: "POST",
		url: "/inviaEmailUtenti",
		contentType: "application/json",
		data: JSON.stringify(messaggio),
		

	});
}
function scriviVenditori() {
	var messaggio = document.querySelector("#formEmailVenditori").value;
	
	$.ajax({
		type: "POST",
		url: "/inviaEmailVenditori",
		contentType: "application/json",
		data: JSON.stringify(messaggio),
		

	});
}