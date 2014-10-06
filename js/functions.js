var pages = {
	"tjenester": createServices,
	"meglere": createBrokers,
	"bater": createBoats
};

function getPageHash(hash) {
	hash = hash || location.hash;
	var index	= hash.indexOf("#");
	var page	= "";
	if(index > -1) {
		page = hash.substr(index+1);
	}
	
	// Remove ! used for SEO
	return page.split('!')[1];
}

function loadSpinner(done){
	$("#content").fadeTo(100,0,function(){
		done();	
	});
	$("#footer").fadeTo(100,0);
}

function removeSpinner(){
	$("#content").fadeTo(500,1);
	$("#footer").fadeTo(500,1);
	window.scrollTo(0, 0);
}

function isElementInViewport (el) {

    //special bonus for those using jQuery
    if (el instanceof jQuery) {
        el = el[0];
    }

    var rect = el.getBoundingClientRect();

    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
    );
}

function makeBoat(data, source, template){
	Handlebars.registerHelper('short_title', function() {
		
		//var title = data[0].title.replace(/vårkupp|selges|skal|:|gi|bud/gi, "");
		
		return new Handlebars.SafeString(data[0].title)
	});

	Handlebars.registerHelper('short_desc', function() {
		return new Handlebars.SafeString(
			data[0].description.substring(0,350).replace(/[<]br[^>]*[>]/gi,"") + "..."

		);
	});


	Handlebars.registerHelper('formatted_price', function() {
		var price = accounting.formatMoney(data[0].price, "kr", 0, " ", ",","%v %s");

		return new Handlebars.SafeString(price);
	});
	$("#bater").append(template(data[0]));
}

function initMap(){
	var styleArray = [
					  {
						"stylers": [
						  { "saturation": -100 }
						]
					  },{
						"elementType": "labels.text",
						"stylers": [
						  { "color": "#FF4216" },
							{ "weight": 0.1 },
						]
					  },{
    "featureType": "water",
    "stylers": [
      { "color": "#0A5B81" }
    ]
  }
					]
		  	
	var sandviksveien = new google.maps.LatLng(59.89181,10.54717);  
	var mapOptions = {
		center: sandviksveien,
		zoom: 14,
		styles: styleArray,
		disableDefaultUI: true,
		scrollwheel: false
	};  

	var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

	var marker = new google.maps.Marker({
		position: sandviksveien,
		map: map,
		title: 'Aker Yachts AS'
	});
	
	$('#map-canvas').on('shown', function () {
    	google.maps.event.trigger(map, "resize");
	});
}

function loadPage(page){
	console.log("Loading page: ", page);
	
	if(page == "kontakt"){
		page = "main";	
	}
	
	
	
	$("#content").load("inc/" + page + ".html", function(response, status, xhr){
        if (page != "main"){$("#content").removeClass("main-bg");}
		if (status == "error"){
			giveError(status, xhr);
		}

		// run init script for given page
		(pages[page] || createMain)();

		// See if there should be any quotes
		initQuoteLoop();
		//
	});
}

function createServices($page){
	$page = $page || $(document);
	//Bugfix has been done
	var source   = $("#list-template").html();
	var template = Handlebars.compile(source);

	apiCall("tjenester", false, 0,function(data){
		console.log("kom tilbake fra kall");
		// Vi sorterer etter vekting 
		data.sort(function(a,b){
			return b.vekting - a. vekting; 
		});
		
		console.log(data);
		var arr = new Array();
		//console.log(arr)
		var group1 = $page.find("#list-group1");
		var group2 = $page.find("#list-group2");
		var group3 = $page.find("#list-group3");
		//var output;		
		$(data).each(function(index, tjeneste){
			arr.push(tjeneste);	
			var item  = template(tjeneste);

			if(index<3){ // We segregate by 4
				group1.append(item);
			} else if(index<8){
				group2.append(item);			
			} else {
				group3.append(item);			
			}
			
			//output += item;
		});
		group1.find(".highlight-list").first().addClass("firstrow");
		group2.find(".highlight-list").first().addClass("firstrow");
		console.log(group1.find(".highlight-list").first());
		//$(".highlight-list").first().addClass("firstrow");
		
		removeSpinner();
	});	
}

function createBrokers(){
	var source   = $("#broker-template").html();
	var template = Handlebars.compile(source);
	
	apiCall("meglere", false, 0, function(data){
		// Vi sorterer etter vekting 
		data.sort(function(a,b){
			return b.vekting - a. vekting; 
		});
		var middle = Math.round(data.length / 2);
		var i = 0;
		console.log("Midten: ",middle);
		
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
		removeSpinner();
	});
}

function createMain(){
	$("#content").addClass("main-bg");
	
	// Set height of content to be viewport
	var navbarHeight = $("#ay-navbar").height();
	var contentHeight = window.innerHeight;
	
	//alert(window.innerHeight)
	contentHeight = contentHeight - navbarHeight;
	console.log(contentHeight);
	$("#content").css("min-height",contentHeight);
	removeSpinner();
	
	// Remove verdivurdering on click
	$(".glyphicon-remove").on('click', function($el){
		$(this).parent().fadeOut(300);
	});
}

function createContact(){
    apiCall('kontakt', false, 0, function(kontakt){
        $('#visit_adress').append("<h3>Besøksadresse</h3>", kontakt.besoksadresse);
        $('#postal_adress').append("<h3>Postadresse</h3>", kontakt.postadresse);
        $('#contact').append("<h3>Kontaktinfo</h3>E-post: <a href='mailto:"+kontakt.email+"'>"+kontakt.email+"</a><br />Telefon: <a href='tel:"+kontakt.tlf+"'>"+kontakt.tlf+"</a>")
    });
}

function createBoats() {
	var source   = $("#boat-template").html();
	var template = Handlebars.compile(source);
	
	var row = 0;
	var killLoad = false;
	if(killLoad == false){
		while (row < 9){
			killLoad = false;
			row = row +1;

			getOneFinn(row, function(data){
				makeBoat(data, source, template);
				//$("#bater").append("<p>"+data[0].title+"</p>");
				console.log("callback", data);		
				killLoad = true;
			});
		}
	}
	var killScroll = false;

		
	
	// Vi laster mer hvis det scrolles
	$(window).scroll(function () {
        if ($("#content").height() <= $(window).scrollTop() + $(window).height()) {			
			
			if (killScroll == false){
				killScroll = true;
				row++;
				getOneFinn(row, function(data){
					makeBoat(data, source, template);
					console.log("callback", data);
					killScroll = false;
				});
				
			}
        }
    });
	
	removeSpinner();
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
	console.log("Gjør API-kall på: ", src);

	// Random-function
	function pickRandomProperty(obj) {var result; var count = 0; for (var prop in obj) if (Math.random() < 1/++count)result = prop; return result;}

	// API-Kall henter data
	// Må kunne sende random-data til quote
	// Må kunne plukke spesifikk data til sider osv.
	// done("Aker yachts er det beste firmaet jeg har brukt noen gang!");

	var jqxhr = $.getJSON( "pw/"+src, function( data, textStatus, jqXHR ) {
		if(random){
			var int = pickRandomProperty(data);
			done(data[int]);
		} else {
			
			done(data);
		}
	}).fail(function(jqxhr, textStatus, error){
		console.log("nei nei nei nei", textStatus);
		giveError(error, jqxhr);
	});
}

function getOneFinn(page, done){
	var data = {
		'page': page, 
		'rows': 1
	}
	$.getJSON( "finn.php", data, function( data, textStatus, jqXHR ) {
		done(data);
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
		//setInterval(function(){changeQuote(blockquote);},25000);
	});
}

function changeQuote(blockquote) {
	console.log("Changing blockquote...", blockquote);
	apiCall("sitater/",true,0,function(data){		
		$(blockquote).fadeOut('slow', function(){
			$(blockquote).html("<p>"+data.sitat+"</p><footer>"+data.forfatter+"</footer>");	
			$(blockquote).fadeIn('slow');
		});		
	});
}

function processVerdiVurdering(data, callback){
	// Create interactive button
	var l = Ladda.create(data);
	l.start();
	
	
	// Prepare data
	var inputs	= $(data).parent().find("input");
	var name	= inputs[0].value;
	var tlf		= inputs[1].value;
	var quisquiliae = inputs[2].value;
	var html	= "<h1>Ny verdivurdering</h1><p>Hei, følgende person har fyllt ut skjema på akeryachts.no:</p><p>Navn: "+name+"</p><p>Tlf: "+tlf+"</p>";
	
	if (quisquiliae != ""){
		return;
	} else if (name == "" || tlf == "") {
		$(data).parent().append("<p class=\"red\">Du må nok fylle ut feltene...</p>");
		l.stop();
	} else {
	
		// Send e-mail with data
		$.ajax({
			type: "POST",
			url: 'https://mandrillapp.com/api/1.0/messages/send.json',
			data: {
				'key': '-qbBXZsthNoZGX-MmRRSrA',
				'message': {
				'from_email': 'verdivurdering@akeryachts.no',
				'to': [
						{
						'email': 'verdivurdering@akeryachts.no',
						'type': 'to'
						}
					],
				'autotext': 'true',
				'subject': 'Ønske om verdivurdering fra AkerYachts.no',
				'html': html,
				}
			}
		 }).done(function(response) {
			console.log(response); // if you're into that sorta thing
			//$("#verdivurdering").html("<h3>Tusen takk, vi tar kontakt!</h3>");
			$(data).replaceWith("<p class=\"red\">Tusen takk, vi tar kontakt!</p>");
			callback();
		 });
	}
	
}