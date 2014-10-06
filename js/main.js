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
        createContact();
		initMap();
	});
	
	// Vi ønsker at menyelementer skal lukke seg i mobilvisning
		$('.menubutton').on('click', function(e){
				$('.in').collapse('hide');
		});
		
		// Vi ønsker å lukke menyen om man trykker på innholdet
		$('#content').on('click', function(){
			if($("#header").find(".navbar-collapse").hasClass("in")){
				$('.navbar-collapse').collapse('hide');
			}
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
	
	$("#content").on('click', 'button',function(e){
		var button = this;
		e.preventDefault();

		processVerdiVurdering(button, function(){
			//console.log("Got bakc! ", $(button));
			
			
			setTimeout(function(){$("#verdivurdering").fadeOut(1000);},2000);	
		});
	});

});