


$(document).ready(function () {
    "use strict";
	
	var navbarHeight = $("#ay-navbar").height();
	var contentHeight = $(window).height() - navbarHeight;
	$("#content").css("min-height",contentHeight);
	
	
	function loadPage(page){
		$("#content").load(page + ".html", function(response, status, xhr){
			
			if (status == "error"){
				giveError(status, xhr);
			}
			
			switch(page){
			case "services":
				createServices();
				break;
			case "brokers":
				createBrokers();
				break;
			case "boats":
				createBoats();
				break;
			default:
				createMain();
			}
			
			// See if there should be any quotes
			initQuoteLoop();
		});
	}

	function createServices(){
		var source   = $("#list-template").html();
		var template = Handlebars.compile(source);
			
		apiCall("tjenester", false, function(data){
			console.log(data);
			$(data).each(function(tjeneste){
				//console.log(data[tjeneste]);
				$("#list-group").append(template(data[tjeneste]));			
			})

		});	
	}
	
	function createMain(){
		
	}
	
	$(".navbar-nav > li, .navbar-brand").click(function(){
		var page = $(this).prop('id');
		loadPage(page);
	});

	/*
	$("#content").load("main.html", function(){
		console.log("Henta main");

		initQuoteLoop();
	});
	*/
	loadPage("main");
	
	$("#footer").load("footer.html", function(){
		console.log("henta footer");	
	});
	
	function giveError(error, xhr){
		$("#content").html("<div class='row firstrow'><div class='col-xs-10 col-xs-offset-1'><h3>Vi er veldig lei oss, men her er det noe galt</h3></div></div><div id='push'></div>");
		console.warn(error);
	}
	
	function apiCall(src, random, done){
		console.log("Gjør API-kall");
		
		// Random-function
		function pickRandomProperty(obj) {var result; var count = 0; for (var prop in obj) if (Math.random() < 1/++count)result = prop; return result;}
		
		// API-Kall henter data
		// Må kunne sende random-data til quote
		// Må kunne plukke spesifikk data til sider osv.
		// done("Aker yachts er det beste firmaet jeg har brukt noen gang!");
		
		var jqxhr = $.getJSON( "http://localhost:8888/akeryachts/pw/"+src, function( data, textStatus, jqXHR ) {
			if(random){
				var int = pickRandomProperty(data);
				done(data[int]);
			} else {
				done(data);
			}
		}).fail(function(jqxhr, textStatus, error){
			giveError(jqxhr, textStatus, error);
		});
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
		apiCall("sitater",true,function(data){		
			$(blockquote).fadeOut('slow', function(){
				$(blockquote).html("<p>"+data.sitat+"</p><footer>"+data.forfatter+"</footer>");	
				$(blockquote).fadeIn('slow');
			});		
		});
	}

   
});