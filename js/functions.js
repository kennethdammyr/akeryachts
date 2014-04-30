function loadPage(page){
	console.log("Loading page: ", page);
	$("#content").load(page + ".html", function(response, status, xhr){
	if (page != "main"){$("#content").removeClass("main-bg");}
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

	apiCall("tjenester", false, 0,function(data){
		console.log(data);
		var i = 0;
		$(data).each(function(tjeneste){
			if(i<4){ // We segregate by 4
				$("#list-group1").append(template(data[tjeneste]));			
			} else if(i<8){
				$("#list-group2").append(template(data[tjeneste]));			
			} else {
				$("#list-group3").append(template(data[tjeneste]));			
			}
			i = i+1;
		});
		// Set height of images to match content
		var sheight1 = $("#list-group1").parent().height();
		//console.log("Høyde: ",sheight);
		$("#servicebg1").height(sheight1+70);
		
		var sheight2 = $("#list-group2").parent().height();
		//console.log("Høyde: ",sheight);
		$("#servicebg2").height(sheight2+70);
	});	
}

function createMain(){
	$("#content").addClass("main-bg");
	
	// Set height of content to be viewport
	var navbarHeight = $("#ay-navbar").height();
	var contentHeight = $(window).height() - navbarHeight;
	//var contentHeight = screen.height - navbarHeight;
	$("#content").css("min-height",contentHeight);
}

function giveError(error, xhr){
	$("#content").html("<div class='row firstrow bg-danger text-center'><div class='col-xs-10 col-xs-offset-1' id='error'><h3>Vi er veldig lei oss, men her gikk det galt. </h3></div></div><div id='push'></div>");
	console.warn(xhr);
	
	$.ajax({
		type: "POST",
		url: 'https://mandrillapp.com/api/1.0/messages/send.json',
		data: {
			'key': '-qbBXZsthNoZGX-MmRRSrA',
			'message': {
		  	'from_email': 'error@akeryachts.no',
		  	'to': [
					{
					'email': 'error@dammyr.net',
					'type': 'to'
					}
				],
		  	'autotext': 'true',
		  	'subject': 'Feil på AkerYachts.no',
		  	'html': xhr.responseText,
			}
	 	}
	 }).done(function(response) {
	 	console.log(response); // if you're into that sorta thing
		$("#error").append("<p>En e-post er sendt til administratoren av siden.</p>");
	 });
	 
}
	
function apiCall(src, random, limit, done){
	console.log("Gjør API-kall");

	// Random-function
	function pickRandomProperty(obj) {var result; var count = 0; for (var prop in obj) if (Math.random() < 1/++count)result = prop; return result;}

	// API-Kall henter data
	// Må kunne sende random-data til quote
	// Må kunne plukke spesifikk data til sider osv.
	// done("Aker yachts er det beste firmaet jeg har brukt noen gang!");

	var jqxhr = $.getJSON( "http://192.168.0.6:8888/akeryachts/pw/"+src, function( data, textStatus, jqXHR ) {
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
	apiCall("sitater",true,0,function(data){		
		$(blockquote).fadeOut('slow', function(){
			$(blockquote).html("<p>"+data.sitat+"</p><footer>"+data.forfatter+"</footer>");	
			$(blockquote).fadeIn('slow');
		});		
	});
}