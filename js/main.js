$(document).ready(function () {

	// INITIAL LOAD
	var page = getPageHash();
	loadPage(page || "main");
	
	$("#footer").load("inc/footer.html", function (){
		console.log("henta footer");	
	});
	
	// EVENT-BINDINGS
	$(".navbar-nav > li a, .navbar-brand").click(function (){
		loadSpinner(function(){
			var href = $(this).attr("href");
			var page = getPageHash(href);
			loadPage(page);	
		});
	});
	

	
	

});