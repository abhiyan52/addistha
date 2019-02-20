// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

 
var countDownDate = new Date("Jan 5, 2021 15:37:25").getTime();


var x = setInterval(function() {

	var counters = document.getElementsByClassName("counter")
	for(i=0;i<counters.length ;i++){
		
		countDownDate = new Date(Number(counters[i].getAttribute("end-time")*1000));
		console.log(countDownDate)
		var now = new Date().getTime();
		w = new Date().getTime();
 		var distance = countDownDate - now ;
 		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
 		var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
 		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
 		var seconds = Math.floor((distance % (1000 * 60)) / 1000);
 		counters[i].innerHTML = days + "d " + hours + "h "
 		+ minutes + "m " + seconds + "s ";
 		if (distance < 0) {
    	counters[i].innerHTML = "EXPIRED";
	}
		console.log(counters[i])
  }		
	

 
}, 1000);