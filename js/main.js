
$(document).ready(function() {


//hides add function initially
	$(".addBox").hide();

//controls up top
	$('.addToggle').click (function () {
		$(".addBox").toggle("slow");
	});

//Sort Functions

	//left sort
	$('#sortLeft').click( function (){
		var mylist = $('.balistListLeft');
		var listitems = mylist.children('li').get();
		listitems.sort(function(a, b) {
		   var compA = $(a).text().toUpperCase();
		   var compB = $(b).text().toUpperCase();
		   return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;
		})
		$.each(listitems, function(idx, itm) { mylist.append(itm); });
	});

	//right sort
	$('#sortRight').click( function (){
		var mylist = $('.balistListRight');
		var listitems = mylist.children('li').get();
		listitems.sort(function(a, b) {
			var compA = $(a).text().toUpperCase();
			var compB = $(b).text().toUpperCase();
			return (compA < compB) ? -1 : (compA > compB) ? 1 : 0;
			})
			$.each(listitems, function(idx, itm) { mylist.append(itm); });
	});

//itemTitle popover function

	$(function (){ 
		$(".itemTitle").popover({
			placement: wheretoplace,
		}).click(function(evt) {
	    evt.stopPropagation();
	    $(this).popover('show');
	});

	$('html').click(function() {
	    $('.itemTitle').popover('hide');
	});

	});  

	function wheretoplace(){
	    var width = window.innerWidth;
	    if (width<500) return 'bottom';
	    return 'right';
	}


});
 //closes document ready