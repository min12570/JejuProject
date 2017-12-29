/**
 * 17/12/29
 * package select --> blue
 * reservation_package.js를 참고함
 */


var package_number;
function goReser(){
	package_number =0;
	package_number = $("btn_white").attr('id');
	//alert(package_number);
	//alert("package_number "+package_number);
	location.href='../../resort/reservation/re_package.html';	
}

//클릭이벤트 설정
$('.rsu_package li ul li').unbind("click").bind("click",function(){
	$('.rsu_package li ul li').removeClass('on').addClass('off');
	$(this).removeClass('off').addClass('on');
	var selkey = $('a',this).attr('code');
	//alert(selkey);
	//alert(selkey);
	//packDetailSet(selkey);
});

// 패키지 선택 기본선택
//휘닉스 스쿠버 선택시, 15번이다
//$('.rsu_package li ul li:eq('+package_number+')').trigger('click');
$('.rsu_package li ul li:eq('+package_number+')').trigger('click');

//이용 인원 선택
function packDetailSet(selkey)
{
	var codeArr = selkey.split("-");

	$('.rsu_packdetail').empty();

	$.each(locationJson[parseInt(codeArr[0])].label[parseInt(codeArr[1])].items,function(key,val){
		$('.rsu_packdetail').append('<li class="off"><a href="javascript:;" class="top_none" code="'+selkey+'-'+key+'-'+val.id+'">'+val.item+'</a></li>');
	});

	// 클릭이벤트 설정
	$('.rsu_packdetail li').unbind("click").bind("click",function(){
		$('.rsu_packdetail li').removeClass('on').addClass('off');
		$(this).removeClass('off').addClass('on');
		var selkey = $('a',this).attr('code');
		allRefleshFlag = true;
		choiceContentSet(selkey);
	});

	// 이용 인원 선택 기본선택
	$('.rsu_packdetail li:eq(0)').trigger('click');
}