$(window).load(function () {

    "use strict";

    // Remove loader

    $('#progress-bar').width('100%');
    $('#loader').hide();

});

var loader = function(){
	this.count	= 1,
	this.n		= $( 'img' ).length,
	this.dwidth = $(window).width() / this.n,
	this.show	= function(){
		console.log("Vi har dwidth: ", this.dwidth);	
		
		
		$('img').load(function () {

        $('#progress-bar').css('width', this.count * this.dwidth);
		//$('#progress-bar').width( count * bredde, "%");
        this.count = this.count + 1;
		console.log("jobber...", this.count);
    });
		
	},
	this.remove	= function(){
		console.log("Takk for seg")	
	}
}


$(document).ready(function () {

    "use strict";
	
	$(".navbar-nav > li, .navbar-brand").click(function(){
		var status = "";
		var page = $(this).prop('id');
		$("#content").load(page + ".html", function(response, status, xhr){
			if(status == "error"){
				$("#content").html("<div class='row firstrow'><div class='col-xs-10 col-xs-offset-1'><h3>Vi er veldig lei oss, men her er det noe galt</h3></div></div><div id='push'></div>");
			}
		});
	});

	/*
	$("#content").load("main.html", function(){
		console.log("Henta main");

	});
	$("#footer").load("footer.html", function(){
		console.log("henta footer");	
	});
	*/
    
});