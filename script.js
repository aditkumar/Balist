function addEaten() {

	var listItem = document.addToEaten.newEntry.value;
		
	var listed = '<li> <a href="#" class="placeName">' + listItem + '</a> </li>';
    
    document.getElementById('eatenList').innerHTML = document.getElementById('eatenList').innerHTML + listed;

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