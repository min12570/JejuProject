/**
 * 17/12/29
 * package select --> blue
 * reservation_package.js를 참고함
 * 18/01/03 Json add
 */
var pName = [];
var pImg = [];
var package_number;
function goReser(p_number){
	packageList(p_number);
}
//클릭이벤트 설정
$('.rsu_package li ul li').unbind("click").bind("click",function(){
	$('.rsu_package li ul li').removeClass('on').addClass('off');
	$(this).removeClass('off').addClass('on');
	var id = $(this).attr('id');
	showPackages(id);
});

var temp;
temp = location.href.split("&");
temp = temp[1].split("=");
$('.rsu_package li ul li:eq('+temp[1]+')').trigger('click');

function showPackages(Pid){
	var img = pImg[Pid];
	var Name = pName[Pid];
	var imgURL = "<img src='"+img+"' style='width: 100%;' class='pkgImg'>";
	$('.title').html(Name);
	$('.fff_img').html(imgURL);
}

function reservation_chk(){
	var payHow = document.getElementById("payHow").value;
	//alert(payHow);
	if (payHow == "계좌이체") {
		location.href='../../resort/reservation/re_package_complete.jsp';
	}else{
		alert("지원하지 않는 기능입니다");
		
	}
}	

function packageList(p_number){
	location.href="main.package?db=all&p_num="+p_number;
}

function readPackageJSON(){
	alert("readJSON");
	$.getJSON('../../package.json?v=1', function (data) {
		for (var j = 0; j < data.length; j++) {
			pName.push(data[j].name);
			pImg.push(data[j].img);
	    }
	});
	alert(pName[3]);
}