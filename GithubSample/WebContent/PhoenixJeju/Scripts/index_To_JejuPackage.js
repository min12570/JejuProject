/**
 * 17/12/29
 * package select --> blue
 * reservation_package.js를 참고함
 */


var package_number;
function goReser(){
	package_number =0;
	package_number = $("btn_white").attr('id');
	packageList();
	//alert(package_number);
	//alert("package_number "+package_number);
	//location.href='../../resort/reservation/re_package.html';	
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
$('.rsu_package li ul li:eq('+package_number+')').trigger('click');


function packageList(){
	alert("왔다");
	location.href="main.package?db=all";
}


//------------------------------------------
//패키지 리스트 설정
function packageListSet()
{
	$('.rsu_package').empty();

	//package list add
	//package 정보 불러와서 보여주기
//	location.href = "main.big?view=add";
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