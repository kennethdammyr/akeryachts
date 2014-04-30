$(document).ready(function () {
    "use strict";

	
	// INITIAL LOAD
	loadPage("main");
	
	$("#footer").load("footer.html", function(){
		console.log("henta footer");	
	});
	
	// EVENT-BINDINGS
	$(".navbar-nav > li, .navbar-brand").click(function(){
		var page = $(this).prop('id');
		loadPage(page);
	});
	

});