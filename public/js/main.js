 $(document).ready(function() {
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

	//inline edit for new lists
	$('.newList').click( function(e) {
		e.stopPropagation()
		$(e.currentTarget).replaceWith('<input type="text" class="newListInput" name="newList" value="Enter List Name" />')
		$(e.currentTarget).select()
	});

//	$('.newListInput').click( function(e) { 
//		e.stopPropagation() 
//		$(e.currentTarget).select()
//	});

	$('.dropdown-menu').find('input').click(function (e) {
	    e.stopPropagation();
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

	$(".addItemHeader").one('keypress', function() {
		$(this).parent().children('.addItemComment').fadeIn();
	});

	$(".listItem").hover( 
		function() { $(this).children('.deleteItem').show(); },
		function() { $(this).children('.deleteItem').hide(); }
		);

	$('.deleteItem').click(function(){
		myElement = $(this);
		parentID = this.parentElement.id;
		$.ajax({
			url : '/listItems/delete/',
			type : 'DELETE',
			success : function(data){ 
				myElement.parents('li').remove()
			},
			data : {id : parentID}
		})
		
	});

	$('.editable').each(function() { 
		var parentID = this.parentElement.id; 
		var headerOrComment = this.className;
		$(this).editable('/listItems/update/', 
		{
		method : 'PUT',
		submitdata : {id : parentID, headerOrComment : headerOrComment},
		data : function(dataVal) {return $.trim(dataVal);},
		placeholder : 'No comment. Click to add one'
		})
	});
});//closes document ready
