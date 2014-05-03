var pages = {
	"tjenester": createServices,
	"meglere": createBrokers,
	"bater": createBoats
};

function getPageHash(hash) {
	hash = hash || location.hash;
	var index = hash.indexOf("#");
	
	if(index > -1) {
		return hash.substr(index+1);
	}	
}

function loadPage(page){
	console.log("Loading page: ", page);
	//loadSpinner();
	$("#content").load("inc/" + page + ".html", function(response, status, xhr){
	if (page != "main"){$("#content").removeClass("main-bg");}
		if (status == "error"){
			giveError(status, xhr);
		}

		// run init script for given page
		(pages[page] || createMain)();
		
		// See if there should be any quotes
		initQuoteLoop();
		//removeSpinner();
	});
}

function createServices($page){
	$page = $page || $(document);
	var source   = $("#list-template").html();
	var template = Handlebars.compile(source);

	apiCall("tjenester", false, 0,function(data){
		console.log(data);
		var group1 = $page.find("#list-group1");
		var group2 = $page.find("#list-group2");
		var group3 = $page.find("#list-group3");
			
		$(data).each(function(index, tjeneste){
			var html = template(tjeneste);
			if(index<4){ // We segregate by 4
				group1.append(html);			
			} else if(index<8){
				group2.append(html);			
			} else {
				group3.append(html);			
			}
		});

	});	
}

function createBrokers(){
	var source   = $("#broker-template").html();
	var template = Handlebars.compile(source);
	
	apiCall("meglere", false, 0, function(data){
		
		var middle = Math.round(data.length / 2);
		var i = 0;
		console.log("MIdten: ",middle);
		
		$(data).each(function(megler){
			if (i == middle){
				$("#meglere").append("<section class='row megler' id='brokerbg1'><div class='col-xs-10 col-xs-offset-1 firstrow'><blockquote></blockquote></div</section>");
				$("#meglere").append(template(data[megler]));
				initQuoteLoop();
			} else {
				$("#meglere").append(template(data[megler])).addClass("firstrow");;
			}
		 i = i+1;
		});
	});
}

function createMain(){
	$("#content").addClass("main-bg");
	
	// Set height of content to be viewport
	var navbarHeight = $("#ay-navbar").height();
	var contentHeight = window.innerHeight;
	//alert(window.innerHeight)
	//var contentHeight = screen.height - navbarHeight;
	$("#content").css("min-height",contentHeight);
	
}

function createBoats() {

}

function giveError(error, xhr){
	$("#content").html("<div class='row firstrow bg-danger text-center'><div class='col-xs-10 col-xs-offset-1' id='error'><h3>Vi er veldig lei oss, men her gikk det galt. </h3></div></div><div id='push'></div>");
	console.warn("XHR: ",xhr);
	
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

	var jqxhr = $.getJSON( "/akeryachts/pw/"+src, function( data, textStatus, jqXHR ) {
		if(random){
			var int = pickRandomProperty(data);
			done(data[int]);
		} else {
			done(data);
		}
	}).fail(function(jqxhr, textStatus, error){
		giveError(error, jqxhr);
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
	console.log("Changing blockquote...", blockquote);
	apiCall("sitater",true,0,function(data){		
		$(blockquote).fadeOut('slow', function(){
			$(blockquote).html("<p>"+data.sitat+"</p><footer>"+data.forfatter+"</footer>");	
			$(blockquote).fadeIn('slow');
		});		
	});
}