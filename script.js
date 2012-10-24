function addEaten() {

	var newEatenName = document.addToEaten.newEatenName.value;

	var newEatenNote = document.addToEaten.newEatenNote.value;
		
	var newEatenItem = '<li> <a href="#" class="placeName">' + newEatenName + '</a> <span class = "note">' + newEatenNote + '</span> </li>';
    
    document.getElementById('eatenList').innerHTML = document.getElementById('eatenList').innerHTML + newEatenItem;


}

function addUneaten() {

	var newUneatenName = document.addToUneaten.newUneatenName.value;

	var newUneatenNote = document.addToUneaten.newUneatenNote.value;
		
	var newUneatenItem = '<li> <a href="#" class="placeName">' + newUneatenName + '</a> <span class="note">' +newUneatenNote + '</span> </li>';
    
    document.getElementById('uneatenList').innerHTML = document.getElementById('uneatenList').innerHTML + newUneatenItem;



}

function alertTest() {
	alert ("Hello World!");
}


function turnOffNeighborhood () {
	$(".neighborhood").hide();
};