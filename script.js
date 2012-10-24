function addEaten() {

	// Gets name and note values and sets them to variables
	var newEatenName = document.addToEaten.newEatenName.value;
	var newEatenNote = document.addToEaten.newEatenNote.value;
	
	// Creates new li with values	
	var newEatenItem = '<li> <a href="#" class="placeName">' + newEatenName + '</a> <span class = "note">' + newEatenNote + '</span> </li>';
    
    // Inserts new item into ul
    document.getElementById('eatenList').innerHTML = document.getElementById('eatenList').innerHTML + newEatenItem;

    // Clears inputs
    document.addToEaten.newEatenName.value = "";
    document.addToEaten.newEatenNote.value = "";
}

function addUneaten() {

	var newUneatenName = document.addToUneaten.newUneatenName.value;

	var newUneatenNote = document.addToUneaten.newUneatenNote.value;
		
	var newUneatenItem = '<li> <a href="#" class="placeName">' + newUneatenName + '</a> <span class="note">' +newUneatenNote + '</span> </li>';
    
    document.getElementById('uneatenList').innerHTML = document.getElementById('uneatenList').innerHTML + newUneatenItem;

	// Clears inputs
    document.addToUneaten.newUneatenName.value = "";
    document.addToUneaten.newUneatenNote.value = "";

}

function alertTest() {
	alert ("Hello World!");
}



function turnOffNeighborhood () {
	$(".neighborhood").hide();
};