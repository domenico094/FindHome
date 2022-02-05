window.addEventListener("load",function(){
	eventiContatti();
});

function eventiContatti() {
	$(document).ready(function() {
			var pos = {
				lat : 39.354158,
				lng : 16.2247025
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				center : pos,
				zoom : 14
			});

			var marker = new google.maps.Marker({
				position : {
					lat : 39.354158,
					lng : 16.2247025
				},
				map : map,
				title : 'ciao'
			});

		});
}