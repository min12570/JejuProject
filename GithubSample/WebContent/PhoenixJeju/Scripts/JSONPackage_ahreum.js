/**
 * 17/12/29
 * json read
 * 
 */
$(document).ready(function(){
	readPackageJSON();
});

var pNum = [];
var pImg = [];
function readPackageJSON(){
	$.getJSON('../../package.json', function (data) {
		for (var j = 0; j < data.length; j++) {
			pNum.push(data[j].name);
			pImg.push(data[j].img);
	    }
	});
	start();
}