$(document).ready(function () {
    "use strict";
	
	var navbarHeight = $("#ay-navbar").height();
	var contentHeight = $(window).height() - navbarHeight;
	$("#content").css("min-height",contentHeight);
	
	
	

	
	$(".navbar-nav > li, .navbar-brand").click(function(){
		
		var status = "";
		var page = $(this).prop('id'); // Hvor skal vi
		
		$("#content").load(page + ".html", function(response, status, xhr){
			
			if(status == "error"){
				$("#content").html("<div class='row firstrow'><div class='col-xs-10 col-xs-offset-1'><h3>Vi er veldig lei oss, men her er det noe galt</h3></div></div><div id='push'></div>");
			}
			initQuoteLoop();
		});

	});

	
	$("#content").load("main.html", function(){
		console.log("Henta main");
		initQuoteLoop();
	});
	
	
	$("#footer").load("footer.html", function(){
		console.log("henta footer");	
	});
	
	function apiCall(done){
		// API-Kall henter data
		// Må kunne sende random-data til quote
		// Må kunne plukke spesifikk data til sider osv.
		done("Aker yachts er det beste firmaet jeg har brukt noen gang!");
	}
	
	function initQuoteLoop(){
		console.log("Starting Quote-loop on all blockquote-tags");	
		
		$("blockquote").each(function(index){
			console.log("Found Blockquote with id:", index);
			var blockquote = this;
			changeQuote(this);
			setInterval(function(){changeQuote(blockquote);},25000);
		});
	}
	
	function changeQuote(blockquote) {
		console.log("Changing blockquote...");
		apiCall(function(data){		
			$(blockquote).fadeOut('slow', function(){
				$(blockquote).html("<p>"+data+"</p><footer>Lars</footer>");	
				$(blockquote).fadeIn('slow');
			});		
		});
	}

   
});