/**
 * 17/12/29
 * package select --> blue
 * reservation_package.js를 참고함
 * 18/01/03 Json add
 */
var pName = [];
var pImg = [];
var pack_D1 = [];
var pack_D2 = [];
var pack_D3 = [];
var pack_D4 = [];
var package_number;
function readPackageJSON(){
	$.getJSON('../../package.json?v=1', function (data) {
		for (var j = 0; j < data.length; j++) {
			pName.push(data[j].name);
			pImg.push(data[j].img);
			pack_D1.push(data[j].packD1);
			pack_D2.push(data[j].packD2);
			pack_D3.push(data[j].packD3);
			pack_D4.push(data[j].packD4);
	    }
		start();
	});
}
function start(){
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
	
}
function goReser(p_number){
	packageList(p_number);
}

function showPackages(Pid){
	var img = pImg[Pid];
	var Name = pName[Pid];
	var packD1 = pack_D1[Pid];
	var packD2 = pack_D2[Pid];
	var packD3 = pack_D3[Pid];
	var packD4 = pack_D4[Pid];
	var imgURL = "<img src='../../resort/_img/comn/" +img+"' style='width: 100%;' class='pkgImg'>";
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
