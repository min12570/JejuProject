/**
 * 17/12/29
 * package select --> blue
 * reservation_package.js를 참고함
 */
readPackageJSON();
var pNum = [];
var pImg = [];
function readPackageJSON(){
	$.getJSON('../../package.json', function (data) {
		for (var j = 0; j < data.length; j++) {
			pNum.push(data[j].name);
			pImg.push(data[j].img);
	    }
	});
}

var package_number;
function goReser(p_number){
	//package_number =0;
	//package_number = $("btn_white").attr('id');
	//p_number 값 받아와서 default 설정 가능!
	//alert(p_number);
	packageList(p_number);
	//alert(package_number);
	//alert("package_number "+package_number);
	//location.href='../../resort/reservation/re_package.html?p_number';	
}

//클릭이벤트 설정
$('.rsu_package li ul li').unbind("click").bind("click",function(){
	$('.rsu_package li ul li').removeClass('on').addClass('off');
	$(this).removeClass('off').addClass('on');
	var id = $(this).attr('id');
	alert(id);
	showPackages(id);
	//var selkey = $('a',this).attr('code');
	//alert(selkey);
	//packDetailSet(selkey);
});

function showPackages(Pid){
	var Name = pNum[Pid];
	var img = pImg[Pid];
	var Name = pNum[Pid];
	var imgURL = "<img src='"+img+"' style='width: 100%;' class='pkgImg'>";
	$('.title').html(Name);
	$('.fff_img').html(imgURL);
}

/*
function readJobJson() {
	   $.getJSON('http://apis.joins.com/pagecall/?u=http://joongang.joins.com/Innovation/future/json/status_result.json', function (data) {
	   // $.getJSON('./json/status_result.json', function (data) {
	    printJobJSON(data);
	    });
	}
	function printJobJSON(jsonData) {
	    statusData = jsonData;
	    var jLength = jsonData.length;
	    var jobNames = '<div style="color:#01f3fd">ㄱ</div>';
	    for (var j = 0; j < jLength; j++) {
	        if (jobNamesNum != jsonData[j].JobsNum) {
	            jobNamesNum = jsonData[j].JobsNum;
	            jobNames = jobNames + '<br/><div style="color:#01f3fd">' + jobNamesCategory[jobNamesNum] + '</div>';
	        }
	        selectName[j] = jsonData[j].Jobs.replace(",", " ");
	        jobNames = jobNames + '<div class="list_item" onclick=inputName(selectName[' + j + ']);>' + selectName[j] + '</div>';
	        availableTags.push(selectName[j]);
	    }
	    jobNames = jobNames + '<br/><br/>';
	    $('#future_job_list').html(jobNames);
	}

	var selectName = [];
	function inputName(name) {
	    $('#searchJob').val(name);
	}*/
function reservation_chk(){
	var payHow = document.getElementById("payHow").value;
	//alert(payHow);
	if (payHow == "계좌이체") {
		location.href='../../resort/reservation/re_package_complete.jsp';
	}else{
		alert("지원하지 않는 기능입니다");
		
	}
}
// 패키지 선택 기본선택
//휘닉스 스쿠버 선택시,6번이다
//location.href='../../resort/reservation/re_package.html?p_number';
var temp;
temp = location.href.split("&");
temp = temp[1].split("=");
$('.rsu_package li ul li:eq('+temp[1]+')').trigger('click');	

function packageList(p_number){
	readPackageJSON();
	location.href="main.package?db=all&p_num="+p_number;
}

//alert(p_number);
//$('.rsu_package li ul li:eq(3)').trigger('click');

//------------------------------------------
//패키지 리스트 설정
function packageListSet()
{
	$('.rsu_package').empty();

	//package list add
	//package 정보 불러와서 보여주기
	location.href="package?db=all";

		//console.log(key+", "+val.text);
		$('.rsu_package').append('<li class="on"><a href="javascript:;" class="'+(key==0?'top_none':'')+'">'+val.text+'</a></li>');
		$('.rsu_package > li:eq('+key+')').append('<ul class="list"></ul>');

		$.each(val.label,function(key2,val2){
			//console.log(key2+", "+val2.text);
			$('.rsu_package > li:eq('+key+') > ul.list').append('<li><a href="javascript:;" code="'+key+'-'+key2+'">- '+val2.text+'</a></li>');
		});

		// 클릭이벤트 설정
		$('.rsu_package li ul li').unbind("click").bind("click",function(){
			$('.rsu_package li ul li').removeClass('on').addClass('off');
			$(this).removeClass('off').addClass('on');
			var selkey = $('a',this).attr('code');
			packDetailSet(selkey);
		});

		// 패키지 선택 기본선택
		$('.rsu_package li ul li:eq(0)').trigger('click');

}