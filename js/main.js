$(document).ready(function () {
	
	// INITIAL LOAD
	var page = getPageHash();
	loadPage(page || "main");
	
	smoothScroll.init({
    	speed: 1000, // Integer. How fast to complete the scroll in milliseconds
    	easing: 'easeInOutQuad', // Easing pattern to use
    	updateURL: true, // Boolean. Whether or not to update the URL with the anchor hash on scroll
    	offset: 50, // Integer. How far to offset the scrolling anchor location in pixels
	});
	
	$("#footer").load("inc/footer.html", function (){
		console.log("henta footer");	
		initMap();
	});
	
	// EVENT-BINDINGS
	$(".navbar-nav > li a, .navbar-brand").click(function (){
		
		var href = $(this).attr("href");
		var page = getPageHash(href);
		if (page == "kontakt"){
			console.log("vibeveger oss");
			smoothScroll.animateScroll( null, '#footer' );	
		} else {
			loadSpinner(function(){
				loadPage(page);	
			});
		}
		
		
		
	});

});