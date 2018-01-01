

/*
	- 카테고리: /Phoenix/resort/_json/roomReservation.json.aspx (http://58.103.158.51/resort/_json/roomReservation.json.aspx)
	- 달력로딩: /Phoenix/packages/Reservation/Xml/Golf/golfMonth.aspx (http://58.103.158.51/packages/Reservation/Xml/Golf/golfMonth.aspx)
	- 패키지달력로딩: /Phoenix/packages/Reservation/Xml/Package/golfMonth.aspx (http://58.103.158.51/packages/Reservation/Xml/Package/calendar.aspx)
	- 요금조회: /Phoenix/packages/Reservation/Xml/Room/roomPrice.aspx (http://58.103.158.51/packages/Reservation/Xml/Room/roomPrice.aspx)
	- 객실옵션: /Phoenix/packages/Reservation/Xml/Room/optionList.aspx?bsns_cd=12 (http://58.103.158.51/packages/Reservation/Xml/Room/optionList.aspx?bsns_cd=12)
*/

// 패키지결제 진행가능여부 플래그
var reservationActionFlag = false;
var reservationActionMsg = "예약정보를 확인해 주세요.";

// 지역/시설정보 데이터
var locationJson;
// 지역코드 분류(평창,제주)
var locationCode = ["12", "17"];
// 건물코드 분류(콘도,호텔,호스텔)
//var buildingCode = ["02", "01", "03"];
// 첫번째 달력 조회 년월
var first_cal_ym = "";
// 두번째 달력 조회 년월
var second_cal_ym = "";
// 첫번째 달력 데이터
var calJson1;
// 두번째 달력 데이터
var calJson2;
// 객실타입 인덱스
var calRoomTypeIndex = 0;
// 달력+시설+객실타입 모두 갱신여부
var allRefleshFlag = true;
var payMethodValue = ["예약실문의", "카드결제", "현금/현장(카드)결제", "계좌이체"];


var bsns_cd = "12";
var buld_cd = "02";
var pk_no = "000000";
var room_type = "";
var memb_no = "";

var buld_cd_bak = "";

var roomPrice = "";
var optionPrice = 0;
var complex = "";
var rate_cd = "";
var rsrv_stat = "";
var folio = "";

$(document).ready(function(){

	var now_d = new Date();
	var now_y = now_d.getFullYear();
	var now_m = now_d.getMonth() + 1;
	first_cal_ym = now_y + '' + (now_m < 10 ? '0'+now_m : now_m);
	second_cal_ym = first_cal_ym;

	// 패키지 리스트 로딩
	$.getJSON('/packages/Reservation/Xml/Package/productList', function(json){
		locationJson = json.field;
		// 리스트 설정
		packageListSet();
	});

	userInfoSet();
});


// 회원유형 변경
function guestMerketChange()
{
	$.post( "/packages/Reservation/Xml/usrInfo", { guest_market:$("#MainContent_guest_market1 option:selected").val(),cust_no:$("#MainContent_cust_no").val() }
	, function( json ) {
		if( json.status == "SUCC" )
		{
			if( json.user.result == "Y" )
			{
				// 요금정보 갱신
				roomPriceCall();
			}
		}
	}, "json");
}

//토글기능
$(document).ready(function() {
	$("#py_li").click(function() {
		$("#py_ul").slideToggle("slow");
	});

});

$(document).ready(function() {
	$("jeju_li").click(function() {
		$("#jeju_ul").slideToggle("slow");
	});

});




// 패키지 리스트 설정
function packageListSet()
{
	$('.rsu_package').empty();

	$.each(locationJson,function(key,val){
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
	});
	

}



// 이용 인원 선택
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


// 선택정보 내용 변경
function choiceContentSet(selkey)
{ 
	var codeArr = selkey.split("-");
	bsns_cd = locationJson[parseInt(codeArr[0])].location_id;
	pk_no = codeArr[3];

	$.post( "/packages/Reservation/Xml/Package/productView", { bsns_cd:bsns_cd,pk_no:pk_no }
	, function( json ) {
		if( json.status == "SUCC" )
		{
			// 콘텐츠 설정
			$('.rsu_choiceContent ul li:eq(0)').html(json.packageinfo.pk_name);
			$('.rsu_choiceContent ul li:eq(1)').html('<span>타입 : </span>'+json.packageinfo.pk_buld);
			$('.rsu_choiceContent ul li:eq(2)').html('<span>인원 : </span>'+json.packageinfo.pk_no_gst);
			$('.rsu_choiceContent ul li:eq(3)').html('<span>요금 : </span>'+formatNumber(json.packageinfo.pk_amt)+'원');
			$('.rsu_choiceContent ul li:eq(4)').html('<span>투숙기간 : </span>'+formatDate(json.packageinfo.from_date,".")+" ~ "+formatDate(json.packageinfo.to_date,"."));
			$('.rsu_choiceContent ul li:eq(5)').html(json.packageinfo.pk_dname);
			$('.rsu_choiceContent ul li:eq(6)').html('<span>구성 : </span>'+json.packageinfo.bigo);
			$('.rsu_choiceContent ul li:eq(7)').html('<span>안내1 : </span>'+ json.packageinfo.pk_desc1 + json.packageinfo.pk_desc2);
			$('.rsu_choiceContent ul li:eq(8)').html('<span>안내2 : </span>'+json.packageinfo.pk_desc3);

			// 대표이미지 변경 
			var img = new Image(); 
			img.onload = function(){
				$(".pkgImg").attr("src", "http://www.phoenixpark.co.kr/file/resort/Package/"+json.packageinfo.pk_code+".jpg");
			};  
			img.src="http://www.phoenixpark.co.kr/file/resort/Package/"+json.packageinfo.pk_code+".jpg"

			buld_cd = json.packageinfo.buld_cd;

			// 패키지 선택시 옵션 초기화
			// 20151105 임솔
			buld_cd_bak = "";

			// 달력로딩
			firstCalendarLoading();
			secondCalendarLoading();
		}
	}, "json");
}




// 첫번째 달력데이터 로딩
function firstCalendarLoading()
{
	var yyyymm = first_cal_ym;
	$.post( "/packages/Reservation/Xml/Package/calendar", { yyyymm:yyyymm,bsns_cd:bsns_cd,buld_cd:buld_cd,pk_no:pk_no,memb_no:memb_no }
	, function( json ) {
		if( json.status == "SUCC" )
		{
			// 달력데이터 복사
			calJson1 = json;
			var index = 0;
			var day_cnt = 0;
			var first_day = json.dates[0].fulldate;
			var begin_day = new Date(parseInt(first_day.substring(0,4),10), parseInt(first_day.substring(4,6),10)-1, 1, 0, 0, 0, 0);
			var begin_depth = begin_day.getDay();

			// 달력 상단 현재 년월 노출
			var now_year = parseInt(yyyymm.substring(0,4),10);
			var prev_year = now_year;
			var next_year = now_year;
			var now_month = parseInt(yyyymm.substring(4),10);
			var prev_month = now_month - 1;
			var next_month = now_month + 1;
			if( prev_month < 1 )
			{
				prev_month = 12;
				prev_year = now_year - 1;
			}
			if( next_month > 12 )
			{
				next_month = 1;
				next_year = now_year + 1;
			}
			$('.reservation_in div.date p.dateNow').html(now_year+'년 '+now_month+'월');
			// 달력 상단 이전 년월 노출
			$('.reservation_in div.date p.datePrev a').attr('onclick','in_month_move('+prev_year+','+prev_month+');');
			// 달력 상단 다음 년월 노출
			$('.reservation_in div.date p.dateNext a').attr('onclick','in_month_move('+next_year+','+next_month+');');
			$('.reservation_in table td').removeClass('no').html('');


 

			if( allRefleshFlag || $('select[name=roomType] option').length == 0 )
			{
				allRefleshFlag = false;

				// 옵션선택에서 시설구분 설정
				$('select[name=buld_cd]').empty();
				$.each(json.bulds,function(key,val){
					$('select[name=buld_cd]').append('<option value="'+val.buld_cd+'">'+val.buld+'</option>');
				});
 


				// 시설구분값 선택
				if(buld_cd_bak != "")
				{
					$("select[name=buld_cd]").val(buld_cd_bak).attr("selected", "selected");
				}

				// 옵션선택에서 객실타입 설정
				$('select[name=roomType]').empty();
				$.each(json.options,function(key,val){
					$('select[name=roomType]').append('<option value="'+val.roomType+'">'+val.roomName+'</option>');
				});
			}

			// 객실타입 인덱스 구하기
			$('select[name=roomType] option').each(function(key){
				if( room_type == $(this).attr('value') )
				{
					index = parseInt(key);
					return false;
				}
			});

			// 객실타입 설정(달력설정용)
			room_type = $('select[name=roomType]').val();

			// 달력 첫주 여백설정
			for( var i=0; i<begin_depth; i++ )
				$('.reservation_in table td:eq('+i+')').addClass('no');
			day_cnt = day_cnt + begin_depth;

			// 달력 첫주 날자설정
			$.each(json.dates,function(key,val){
				//console.log(key+" "+val.date);
				var cstyle = "done";
				var flag = val.flags[index].flag;
				if( flag == "1" ) cstyle = "sucess";
				else if( flag == "2" ) cstyle = "standby";
				else if( flag == "3" ) cstyle = "impossible";
				else if( flag == "4" ) cstyle = "lottery";
				else if( flag == "5" ) cstyle = "receipt";
				else if( flag == "6" ) cstyle = "yet";
				$('.reservation_in table td:eq('+(begin_depth+key)+')').html('<a href="javascript:;" class="'+cstyle+'" dt="'+yyyymm+(val.date<10?'0'+val.date:val.date)+'">'+val.date+'</a>');
				day_cnt = day_cnt + 1;
			});

			// 날자를 채운후 나머지 셀 설정
			for( var i=day_cnt; i<42; i++ )
				$('.reservation_in table td:eq('+i+')').addClass('no');

			// 체크인 날자선택
			$('.reservation_in .sucess,.reservation_in .standby').unbind().bind('click',function(){
				$('.in_date_text').val($(this).attr('dt'));
				// 선택된 날자의 배경색을 적색으로 적용하고 이전에 적용된 적색은 복원을 시킨다.
				$('.reservation_in a[bkcls]').removeClass('okay').addClass($('.reservation_in a[bkcls]').attr('bkcls')).removeAttr('bkcls');
				$(this).attr('bkcls',$(this).attr('class')).removeClass('sucess standby').addClass('okay');
				choiceDateRange();
			});

		}
	}, "json");
}


// 두번째 달력데이터 로딩
function secondCalendarLoading()
{
	var yyyymm = second_cal_ym;
	$.post( "/packages/Reservation/Xml/Package/calendar2", { yyyymm:yyyymm,bsns_cd:bsns_cd,buld_cd:buld_cd,pk_no:pk_no,memb_no:memb_no }
	, function( json ) {
		if( json.status == "SUCC" )
		{
			// 달력데이터 복사
			calJson2 = json;
			var index = 0;
			var day_cnt = 0;
			var first_day = json.dates[0].fulldate;
			var begin_day = new Date(parseInt(first_day.substring(0,4),10), parseInt(first_day.substring(4,6),10)-1, 1, 0, 0, 0, 0);
			var begin_depth = begin_day.getDay();

			// 달력 상단 현재 년월 노출
			var now_year = parseInt(yyyymm.substring(0,4),10);
			var prev_year = now_year;
			var next_year = now_year;
			var now_month = parseInt(yyyymm.substring(4),10);
			var prev_month = now_month - 1;
			var next_month = now_month + 1;
			if( prev_month < 1 )
			{
				prev_month = 12;
				prev_year = now_year - 1;
			}
			if( next_month > 12 )
			{
				next_month = 1;
				next_year = now_year + 1;
			}
			$('.reservation_out div.date p.dateNow').html(now_year+'년 '+now_month+'월');
			// 달력 상단 이전 년월 노출
			$('.reservation_out div.date p.datePrev a').attr('onclick','out_month_move('+prev_year+','+prev_month+');');
			// 달력 상단 다음 년월 노출
			$('.reservation_out div.date p.dateNext a').attr('onclick','out_month_move('+next_year+','+next_month+');');
			$('.reservation_out table td').removeClass('no').html('');
			// 달력 첫주 여백설정
			for( var i=0; i<begin_depth; i++ )
				$('.reservation_out table td:eq('+i+')').addClass('no');
			day_cnt = day_cnt + begin_depth;

			// 객실타입 인덱스 구하기
			$('select[name=roomType] option').each(function(key){
				if( room_type == $(this).attr('value') )
				{
					index = parseInt(key);
					return false;
				}
			});

			// 달력 첫주 날자설정
			var cstyle = "done";
			var cstyleFlag = true;
			$.each(json.dates,function(key,val){
				//console.log(key+" "+val.date);
				if( cstyleFlag && parseInt(val.flags[index].flag) > 0 )
				{
					cstyle = "sucess";
					cstyleFlag = false;
				}

				
				$('.reservation_out table td:eq('+(begin_depth+key)+')').html('<a href="javascript:;" class="'+cstyle+'" dt="'+yyyymm+(val.date<10?'0'+val.date:val.date)+'">'+val.date+'</a>');
				day_cnt = day_cnt + 1;
			});

			// 날자를 채운후 나머지 셀 설정
			for( var i=day_cnt; i<42; i++ )
				$('.reservation_out table td:eq('+i+')').addClass('no');

			// 체크아웃 날자선택
			$('.reservation_out .sucess,.reservation_out .standby').unbind().bind('click',function(){
				$('.out_date_text').val($(this).attr('dt'));
				// 선택된 날자의 배경색을 적색으로 적용하고 이전에 적용된 적색은 복원을 시킨다.
				$('.reservation_out a[bkcls]').removeClass('okay').addClass($('.reservation_out a[bkcls]').attr('bkcls')).removeAttr('bkcls');
				$(this).attr('bkcls',$(this).attr('class')).removeClass('sucess standby  ').addClass('okay');
				choiceDateRange();
			});
		}
	}, "json");
}


// 객실타입이 변경되면 캐쉬된 달력데이터로 갱신한다.
function roomTypeChangeReflesh()
{
	// 선택된 객실타입
	room_type = $('select[name=roomType]').val();
	var index = 0;
	
	// 인덱스 구하기
	$('select[name=roomType] option').each(function(key){
		if( room_type == $(this).attr('value') )
		{
			index = parseInt(key);
			return false;
		}
	});

	// 첫번째 달력 갱신
	var yyyymm = first_cal_ym;
	var day_cnt = 0;
	var first_day = calJson1.dates[0].fulldate;
	var begin_day = new Date(parseInt(first_day.substring(0,4),10), parseInt(first_day.substring(4,6),10)-1, 1, 0, 0, 0, 0);
	var begin_depth = begin_day.getDay();

	// 달력 첫주 여백설정
	for( var i=0; i<begin_depth; i++ )
		$('.reservation_in table td:eq('+i+')').addClass('no');
	day_cnt = day_cnt + begin_depth;

	// 달력 첫주 날자설정
	$.each(calJson1.dates,function(key,val){
		//console.log(key+" "+val.date);
		var cstyle = "done";
		var flag = val.flags[index].flag;
		if( flag == "1" ) cstyle = "sucess";
		else if( flag == "2" ) cstyle = "standby";
		else if( flag == "3" ) cstyle = "impossible";
		else if( flag == "4" ) cstyle = "lottery";
		else if( flag == "5" ) cstyle = "receipt";
		else if( flag == "6" ) cstyle = "yet";
		$('.reservation_in table td:eq('+(begin_depth+key)+')').html('<a href="javascript:;" class="'+cstyle+'" dt="'+yyyymm+(val.date<10?'0'+val.date:val.date)+'">'+val.date+'</a>');
		day_cnt = day_cnt + 1;
	});

	// 날자를 채운후 나머지 셀 설정
	for( var i=day_cnt; i<42; i++ )
		$('.reservation_in table td:eq('+i+')').addClass('no');

	// 체크인 날자 이벤트등록
	$('.reservation_in .sucess,.reservation_in .standby').unbind().bind('click',function(){
		$('.in_date_text').val($(this).attr('dt'));
		// 선택된 날자의 배경색을 적색으로 적용하고 이전에 적용된 적색은 복원을 시킨다.
		$('.reservation_in a[bkcls]').removeClass('okay').addClass($('.reservation_in a[bkcls]').attr('bkcls')).removeAttr('bkcls');
		$(this).attr('bkcls',$(this).attr('class')).removeClass('sucess standby').addClass('okay');
		choiceDateRange();
	});






	// 두번째 달력 갱신
	yyyymm = second_cal_ym;
	day_cnt = 0;
	first_day = calJson2.dates[0].fulldate;
	begin_day = new Date(parseInt(first_day.substring(0,4),10), parseInt(first_day.substring(4,6),10)-1, 1, 0, 0, 0, 0);
	begin_depth = begin_day.getDay();

	// 달력 첫주 여백설정
	for( var i=0; i<begin_depth; i++ )
		$('.reservation_out table td:eq('+i+')').addClass('no');
	day_cnt = day_cnt + begin_depth;

	// 달력 첫주 날자설정
	var cstyle = "done";
	var cstyleFlag = true;
	$.each(calJson2.dates,function(key,val){
		//console.log(key+" "+val.date);
		if( cstyleFlag && parseInt(val.flags[index].flag) > 0 )
		{
			cstyle = "sucess";
			cstyleFlag = false;
		}
		
		$('.reservation_out table td:eq('+(begin_depth+key)+')').html('<a href="javascript:;" class="'+cstyle+'" dt="'+yyyymm+(val.date<10?'0'+val.date:val.date)+'">'+val.date+'</a>');
		day_cnt = day_cnt + 1;
	});

	// 날자를 채운후 나머지 셀 설정
	for( var i=day_cnt; i<42; i++ )
		$('.reservation_out table td:eq('+i+')').addClass('no');

	// 체크아웃 날자선택
	$('.reservation_out .sucess,.reservation_out .standby').unbind().bind('click',function(){
		$('.out_date_text').val($(this).attr('dt'));
		// 선택된 날자의 배경색을 적색으로 적용하고 이전에 적용된 적색은 복원을 시킨다.
		$('.reservation_out a[bkcls]').removeClass('okay').addClass($('.reservation_out a[bkcls]').attr('bkcls')).removeAttr('bkcls');
		$(this).attr('bkcls',$(this).attr('class')).removeClass('sucess standby').addClass('okay');
		choiceDateRange();
	});

// 가격관련 정보 초기화
	choiceDateClear();


}


// 체크인 달력 변경
function in_month_move(year_,month_)
{
	var month = month_ < 10 ? '0'+month_ : month_;
	first_cal_ym = year_+""+month;
	firstCalendarLoading();

	// 체크아웃 달력도 같이 로딩한다.
	out_month_move(year_,month_);
}


// 체크아웃 달력 변경
function out_month_move(year_,month_)
{
	var month = month_ < 10 ? '0'+month_ : month_;
	second_cal_ym = year_+""+month;
	secondCalendarLoading();
}


// 선택일자,숙박일수 초기화
function choiceDateClear()
{
	$('.in_date_text, .out_date_text, input.dateperiod').val('');
	$('.reservation_in a[bkcls]').removeClass('okay').addClass($('.reservation_in a[bkcls]').attr('bkcls')).removeAttr('bkcls');
	$('.reservation_out a[bkcls]').removeClass('okay').addClass($('.reservation_out a[bkcls]').attr('bkcls')).removeAttr('bkcls');
	// 객실정보란 초기화
	$('.room_price_display, .room_option_price_display, .room_total_price_display').html('0원');
	// 요금상세보기도 초기화
	$('.layer_pop_title0,.layer_pop_title1,.layer_pop_title2,.layer_pop_title3,.layer_pop_title4').html('');
}


// 선택일자 체크 및 숙박일수 계산
function choiceDateRange()
{
	// 체크일 날자
	var checkIn = $('.in_date_text').val();
	// 체크아웃 날자
	var checkOut = $('.out_date_text').val();

	// 체크인 날자 체크
	if( !/20[12][0-9][01][0-9][0-3][0-9]/.test(checkIn) )
	{
		// 값이 없거나 오류
		return;
	}

	// 체크아웃 날자 체크
	if( !/20[12][0-9][01][0-9][0-3][0-9]/.test(checkOut) )
	{
		// 값이 없거나 오류
		return;
	}

	// 현재일
	var d = new Date();
	var now = new Date((d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear());

	// 체크인 날자 변환
	var chkInDate = new Date(parseInt(checkIn.substring(4,6),10)+"/"+parseInt(checkIn.substring(6),10)+"/"+parseInt(checkIn.substring(0,4),10));
	// 체크아웃 날자 변환
	var chkOutDate = new Date(parseInt(checkOut.substring(4,6),10)+"/"+parseInt(checkOut.substring(6),10)+"/"+parseInt(checkOut.substring(0,4),10));

	// 체크인 날자가 현재일보다 이전인 경우 오류
	if( now.getTime() > chkInDate.getTime() )
	{
		alert("체크인 날자는 현재일이거나 이후이어야 합니다1.");
		$('.in_date_text').val('');
		return;
	}

	// 체크아웃 날자가 현재일이거나 이전인 경우 오류
	if( (now.getTime() + 86400000 - 1) > chkOutDate.getTime() )
	{
		alert("체크아웃 날자는 다음일이거나 이후이어야 합니다2.");
		$('.out_date_text').val('');
		return;
	}

	// 체크아웃 날자가 체크인 날자보다 이전인 경우
	if( chkInDate.getTime() >= chkOutDate.getTime() )
	{
		alert("체크아웃 날자는 체크인 날자보다 이후이어야 합니다3.");
		$('.out_date_text').val('');
		return;
	}

	// 두 날자의 차이값 얻은 후 숙박일수 값 설정
	var toDay = chkOutDate - chkInDate;
	toDay = toDay / 86400000;
	$('input.dateperiod').val(toDay);

	// 객실료 조회가 가능한지 확인
	if( !roomPriceCall() )
	{
	    
		$('.room_price_display').html('0원');
		$('.room_option_price_display').html('0원');
	}
}


// 객실요금조회
function roomPriceCall()
{
	// 예약에 필요한 정보들이 입력되었는 체크
	// 체크일 날자
	var arr_date		= $('.in_date_text').val();			// 도착일자(체크인)
	var night			= $('input[name=night]').val();		// 숙박일수
	var rooms			= $('select[name=rooms]').val();	// (대여)객실수
	var guest_market	= $("#MainContent_guest_market1 option:selected").val();	// 고객유형
	var pakg_no			= ($('.rsu_packdetail li.on a').attr('code')).split("-")[3];	// 패키지 코드
	var bkbuff_yn		= "Y";		// 조식뷔페이용 여부
	var defaultbkbuff_yn= "Y";		// 기본조식제공 여부
	var memb_reg_yn = "Y";		// 본인(Y) 회원권대여(N)

	

	buld_cd = $('select[name=buld_cd]').val();		// 시설코드
	room_type = $('select[name=roomType]').val();	// 객실타입

	

    // 객실타입 체크
    //유스텔 숫자체킹 오류로 수정-20160528 hokyoung
	//if (!/[A-Z]{3}/.test(room_type)) return false; 
	if (room_type.length < 3) return false;
	// 체크인 날자 체크
	if( !/20[12][0-9][01][0-9][0-3][0-9]/.test(arr_date) ) return false;
	// 숙박일수 체크
	if( !/[0-9]{1,2}/.test(night) ) return false;
	// 객실수 체크
	if (!/[0-9]{1,2}/.test(rooms)) return false;

	


	$('.btn_reservation').hide();
	$('#roomprice_loading').show('fast', function(){

	    $.ajaxSetup({ async: false });

	   

	$.post( "/packages/Reservation/Xml/Room/roomPrice"
	, {  bsns_cd:bsns_cd
		,buld_cd:buld_cd
		,guest_market:guest_market
		,room_type:room_type
		,rooms:rooms
		,pakg_no:pakg_no
		,arr_date:arr_date
		,night:night
		,memb_no:memb_no
		,bkbuff_yn:bkbuff_yn
		,defaultbkbuff_yn:defaultbkbuff_yn
		,memb_reg_yn:memb_reg_yn
	  }
	, function( json ) {
		// 로딩이미지 비노출
		$('.btn_reservation').show();
		$('#roomprice_loading').hide();

		if( json.status == "SUCC" )
		{
			if( json.roomPrices.result == "1" )
			{
				// 예약가능
				reservationActionFlag = true
				// 객실가격
				roomPrice = json.roomPrices.room_price;
				// 건물코드
				complex = json.roomPrices.complex;
				// 판매유형
				rate_cd = json.roomPrices.rate_cd;
				// 예약 구분값
				rsrv_stat = json.roomPrices.stat;

				// 객실가격
				$('.room_price_display').html(formatNumber(roomPrice)+'원');
				// 옵션가격 계산
				var option_total = 0;
				$('.option-prices').each(function(){
					option_total += parseInt($(this).attr('price')) * parseInt($(this).val());
				});
				$('.room_option_price_display').html( formatNumber(option_total) + '원');
				option_total += parseInt(roomPrice);
				$('.room_total_price_display').html(formatNumber(""+option_total)+'원');

				// 객실요금상세보기
				$('.layer_pop_rooms').empty();
				if( json.roomPrices.detail.length > 0 )
				{
					var html = '';
					for( var i=0; i<json.roomPrices.detail.length; i++ )
					{
						html = '<tr><td class="first">'+json.roomPrices.detail[i].date+'</td>';
						html += '<td>'+json.roomPrices.detail[i].room_type+'</td>';
						html += '<td>'+json.roomPrices.detail[i].rooms+'</td>';
						html += '<td>'+json.roomPrices.detail[i].price_type+'</td>';
						html += '<td>'+formatNumber(json.roomPrices.detail[i].price_display)+'원'+'</td></tr>';
						$('.layer_pop_rooms').append(html);
					}
				}
				else
				{
					// 객실정보란 초기화
					$('.room_price_display, .room_option_price_display, .room_total_price_display').html('0원');
				}

				// 결제방법
				var paymethod = json.roomPrices.pay_method.split("#");
				$('select[name=payment]').empty();
				for( var i=0; i<paymethod.length; i++ )
				{
					if( paymethod[i] != "00" )
						$('select[name=payment]').append('<option value="'+paymethod[i]+'">'+payMethodValue[parseInt(paymethod[i])]+'</option>');
				}
			}
			else
			{
				// 예약가능
				reservationActionFlag = false
				// 기타 오류 발생
				// 객실정보란 초기화
				$('.room_price_display, .room_option_price_display, .room_total_price_display').html('0원');
				// 요금상세보기도 초기화
				$('.layer_pop_title0,.layer_pop_title1,.layer_pop_title2,.layer_pop_title3,.layer_pop_title4').html('');
				reservationActionMsg = json.roomPrices.message
				alert(reservationActionMsg);
			}
		}

		$.ajaxSetup({async:true});
	}, "json");

	});

	return true;
}


// 예약자정보 복사
function caller_copy()
{
	var flag = $('.caller-copy').is(':checked');
	if( flag ) // 체크 true
	{
		$('input[name=guest_name]').val($('input[name=caller]').val());
		//$("select[name=gphone0]").val($("select[name=phone0]").val()).attr("selected", "selected");
		$('input[name=gphone0]').val($('input[name=phone0]').val());
		$('input[name=gphone1]').val($('input[name=phone1]').val());
		$('input[name=gphone2]').val($('input[name=phone2]').val());
		$('input[name=gmail0]').val($('input[name=mail0]').val());
		$('input[name=gmail1]').val($('input[name=mail1]').val());
		$("select[name=gmail2]").val($("select[name=mail2]").val()).attr("selected", "selected");
	}
	else
	{
		$('input[name=guest_name]').val('');
		//$("select[name=gphone0]").val('').attr("selected", "selected");
		$('input[name=gphone0]').val('');
		$('input[name=gphone1]').val('');
		$('input[name=gphone2]').val('');
		$('input[name=gmail0]').val('');
		$('input[name=gmail1]').val('');
		$("select[name=gmail2]").val('').attr("selected", "selected");
	}
}


// select값을 input에 복사
function valcopy(val, target)
{
	$('input[name='+target+']').val(val);
}


// 통화형 문자열로 변환
function formatNumber(num)
{
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}


// 년월일에 구분자를 추가한다.(20150101->2015.01.01)
function formatDate(dt,ch)
{
    return dt.toString().replace(/(\d{4})(\d{2})(\d{2})/g, "$1"+ch+"$2"+ch+"$3");
}


// 시설이 변경되면 날자를 다시로딩
function buldChange()
{	
	// 객식타입을 변경하기 위한 플래그 수정
	// 20151105 임솔
	allRefleshFlag = true;

	buld_cd_bak = buld_cd = $('select[name=buld_cd]').val();		// 시설코드
	// 가격관련 정보 초기화
	choiceDateClear();
	// 달력로딩
	firstCalendarLoading();
	secondCalendarLoading();
}





// 예약하기f
function reservation()
{
	if( !reservationActionFlag )
	{
		alert(reservationActionMsg);
		return false;
	}

	// 조식뷔페이용 여부
	var bkbuff_yn = "Y";//$("input[name=bkbuff_yn]").is(":checked") ? "Y" : "N";	 
	// 고객유형
	var guest_market = $("#MainContent_guest_market1 option:selected").val();	// 고객유형 
	// 객실료 함께 결제할지 여부 확인 (0: 옵션만 결제, 1: 옵션 + 객실료 결제) 
	var pay_togeter_yn = "1";
	// 객실수
	var rooms = $("select[name=rooms] option:selected").val(); 
	// 예약자명
	var caller = $("input[name=caller]").val().trim();
	// 예약자 전화번호
	var rsrv_phone_no = $("input[name=phone0]").val()+"-"+$("input[name=phone1]").val()+"-"+$("input[name=phone2]").val();
	// 투숙자명
	var guest_name = $("input[name=guest_name]").val().trim();
	// 투숙자 전화번호
	var use_phone_no = $("input[name=gphone0]").val()+"-"+$("input[name=gphone1]").val()+"-"+$("input[name=gphone2]").val();
	// 투숙자 이메일	  
	var email = "";	
	// 결제 지불수단(CA현금, CD카드)   
	var dp_gubun = $("select[name=payment] option:selected").val()=="01" ? "CD" : "CA"; 
	// 본인/추천인 구분(Y/N) 
	var emp_rr_gubun = $("input[name=emp_rr_gubun02]").is(":checked") ? "N" : "Y";	
	// sms 발송여부
	var sms_yn = $("input[name=sms_yn]:checked").val();
	// 숙박일수
	var night = $('input[name=night]').val();
	// 패키지 코드
	var pakg_no = ($('.rsu_packdetail li.on a').attr('code')).split("-")[3];
	// 도착일
	var arr_date = $("input[name=arr_date]").val();
	// 퇴실일
	var dep_date = $("input[name=dep_date]").val();
	// 옵션1가격
	var option1_amt = "";//$(".option-prices").eq(0).attr("price");
	// 옵션1코드
	var option1_cd = "";//$(".option-prices").eq(0).attr("name").substring(6,8);
	// 옵션1갯수
	var option1_qty = "";//$(".option-prices").eq(0).val();
	// 옵션2가격
	var option2_amt = "";//$(".option-prices").eq(1).attr("price");
	// 옵션2코드
	var option2_cd = "";//$(".option-prices").eq(1).attr("name").substring(6,8);
	// 옵션2갯수
	var option2_qty = "";//$(".option-prices").eq(1).val();
	// 옵션1가격
	var option3_amt = "";//$(".option-prices").eq(2).attr("price");
	// 옵션1코드
	var option3_cd = "";//$(".option-prices").eq(2).attr("name").substring(6,8);
	// 옵션1갯수
	var option3_qty = "";//$(".option-prices").eq(2).val();

	// 패키지
	if( pakg_no=="")
	{
		alert("패키지를 선택하세요.");
		return false;
	}


	// 예약자 검사
	if( caller=="" )
	{
		alert("예약자명을 입력하세요.");
		$("input[name=caller]").focus();
		return false;
	}

	if($("input[name=phone0]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=phone0]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=phone0]").val())==true )  
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=phone0]").val("").focus();
			return false;
		}
	}

	if($("input[name=phone1]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=phone1]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=phone1]").val())==true || $("input[name=phone1]").val().length<3)  
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=phone1]").val("").focus();
			return false;
		}
	}
	if($("input[name=phone2]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=phone2]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=phone2]").val())==true || $("input[name=phone2]").val().length<4) 
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=phone2]").val("").focus();
			return false;
		}
	} 

	// 투숙자 검사
	if( guest_name=="" )
	{
		alert("투숙자명을 입력하세요.");
		$("input[name=guest_name]").focus();
		return false;
	}

	if($("input[name=gphone0]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=gphone0]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=gphone0]").val())==true ) 
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=gphone0]").val("").focus();
			return false;
		}
	}


	if($("input[name=gphone1]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=gphone1]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=gphone1]").val())==true || $("input[name=gphone1]").val().length<3) 
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=gphone1]").val("").focus();
			return false;
		}
	}
	if($("input[name=gphone2]").val()=="")
	{
		alert("예약자 휴대전화를 입력하세요.");
		$("input[name=gphone2]").focus();
		return false;
	}
	else
	{
		if(isNaN($("input[name=gphone2]").val())==true || $("input[name=gphone2]").val().length<4) 
		{
			alert("번호가 올바르지 않습니다.");
			$("input[name=gphone2]").val("").focus();
			return false;
		}
	}

	// 투숙자 이메일
	if( $("input[name=gmail0]").val().trim()!="" && $("input[name=gmail1]").val().trim()!="")
	{
		email = $("input[name=gmail0]").val()+"@"+$("input[name=gmail1]").val();
	}
	else if( $("input[name=gmail0]").val().trim()=="" && $("input[name=gmail1]").val().trim()!="")
	{
			alert("이메일을 입력하세요.");
			$("input[name=gmail0]").focus();
			return false;
	}
	else if( $("input[name=gmail0]").val().trim()!="" && $("input[name=gmail1]").val().trim()=="")
	{
			alert("이메일을 입력하세요.");
			$("input[name=gmail1]").focus();
			return false;
	} 
 

	// 날짜검사
	if( arr_date=="" )
	{
		alert("체크인 날짜를 선택하세요.");
		return false;
	}
	if( dep_date=="" )
	{
		alert("체크아웃 날짜를 선택하세요.");
		return false;
	}	 
	 
	
	// 위약 규정 사항 동의
	if( !$("input[name=payAgreeChk]").is(":checked"))
	{
		// guest_market 값이 5303,5304,5702 인 경우 체크 스킵처리
		if( guest_market == "5303"
		 || guest_market == "5304"
		 || guest_market == "5702"
		);
		else
		{
			alert("위약규정 사항을 확인하고 동의하세요.");
			$("input[name=payAgreeChk]").focus();
			return false;
		}
	}  


	// 객실료+옵션
	roomPrice = parseInt(roomPrice) + parseInt(optionPrice);

	var params = {
		bkbuff_yn		: bkbuff_yn									
		,room_type		: room_type
		,complex		: complex									
		,memb_no		: memb_no
		,rate_cd		: rate_cd								
		,sms_yn			: sms_yn								
		,night			: night									
		,pakg_no		: pakg_no								
		,arr_date		: arr_date								
		,jumin_no		: ""		
		,guest_market	: guest_market		
		,option1_amt	: option1_amt
		,option2_amt	: option2_amt
		,option3_amt	: option3_amt
		,option1_qty	: option1_qty
		,option2_qty	: option2_qty
		,option3_qty	: option3_qty
		,option1_cd		: option1_cd
		,option2_cd		: option2_cd
		,option3_cd		: option3_cd
		,room_amt		: roomPrice		
		,pay_togeter_yn : pay_togeter_yn
		,rooms			: rooms
		,rsrv_stat		: rsrv_stat									                                                         
		,dp_gubun		: dp_gubun								
		,op_gubun		: dp_gubun								
		,emp_rr_gubun	: emp_rr_gubun							
		,caller			: caller	
		,rsrv_phone_no	: rsrv_phone_no
		,guest_name		: guest_name
		,use_phone_no	: use_phone_no
		,email			: email                             
		,dep_date		: dep_date
		,bsns_cd		: bsns_cd
	}
 
	//alert( objToString(params) );
 

 

	$.ajax({
		url : "/packages/Reservation/Xml/Room/roomBooking"
		,type : "POST"
		,cache : false
		,async : false
		,data : params
		,dataType : "JSON"
		,success : function(data){

			if( data.status=="SUCC")
			{
				alert( data.root.message );

				if( data.root.result=="1")
				{				
					// 카드 결제
					if( data.root.dp_gubun=="CD")
					{
						// 예약 불가능하도록 변경
						$('.btn_reservation').attr('onclick','');
						cardProcess('/Toolkit/KCP/kcp_order.asp',data.root);
					}
					else if( data.root.dp_gubun=="CA" )
					{
						folio = data.root.folio;
						urlForwarding('./re_package_complete');
					}
				}
			}
			else
			{
				alert( data.root.message );
				return false;
			}
		}
		,fail : function(x,t,m){
			//
		}
	});
}


// 특정주소로 페이지이동
function urlForwarding(url)
{
	$('form[name=custom] input[name=folio]').val(folio);
	$('form[name=custom]')
		.attr('action',url)
		.attr('method','post')
		.submit();
}



function objToString (obj) {
    var str = '';
    for (var p in obj) {
        if (obj.hasOwnProperty(p)) {
            str += p + '::' + obj[p] + '\n';
        }
    }
    return str;
}




function cardProcess(url,data)
{
	window.open('','winOpen','scrollbars=yes,width=700,height=800');
	$('<form action="'+url+'" method="post" target="winOpen"></form>')
		.appendTo('body')
		.append('<input type="hidden" name="pay_method" value="CARD">')					// 주문유형
		.append('<input type="hidden" name="ordr_idxx" value="'+data.ordr_idxx+'">')	// 주문번호
		.append('<input type="hidden" name="good_mny"  value="'+data.good_mny+'">')		// 금액
		.append('<input type="hidden" name="buyr_mail" value="'+data.buyr_mail+'">')	// 구매자 이메일
		.append('<input type="hidden" name="buyr_tel1" value="'+data.buyr_tel1+'">')	// 전화번호1
		.append('<input type="hidden" name="buyr_tel2" value="'+data.buyr_tel2+'">')	// 전화번호2
		.append('<input type="hidden" name="cvt_folio" value="'+b64(data.folio)+'">')	// 예약번호
		.append('<input type="hidden" name="seq" value="'+data.seq+'">')				// 순번
		.append('<input type="hidden" name="pkg_div" value="'+data.pkg_div+'">')		// 패키지 구분 (02 일반객실예약, 03 패키지예약)
		.append('<input type="hidden" name="modify_cd" value="'+data.pkg_div+'">')		// 예약상태 (11 신규, 22 변경)
		.append('<input type="hidden" name="bsns_cd" value="'+data.bsns_cd+'">')		// 사업부코드
		.append('<input type="hidden" name="buyr_name" value="'+data.buyr_name+'">')	// 구매자 성명
		.append('<input type="hidden" name="good_name" value="'+'인터넷 예약'+'">')		// 상품명
		.submit().remove();
}

// 결제 결과처리
function flexPayValPost(pay_result, pay_message, data)
{
	if( pay_result == "1" )
	{
		var params = {
			 ApprovalType	: data.ApprovalType
			,TransactionNo	: data.TransactionNo
			,Status			: data.Status
			,TradeDate		: data.TradeDate
			,TradeTime		: data.TradeTime
			,IssCode		: data.IssCode
			,AquCode		: data.AquCode
			,AuthNo			: data.AuthNo
			,CardNo			: data.CardNo
			,ExpDate		: data.ExpDate
			,Installment	: data.Installment
			,Amount			: data.Amount
			,MerchantNo		: data.MerchantNo
			,VanTransactionNo	: data.VanTransactionNo
			,AuthType		: data.AuthType
			,UserName		: data.UserName
			,cvt_folio		: data.cvt_folio
			,seq			: data.seq
			,pkg_div		: data.pkg_div
		} 

		$.ajax({
			url : "/packages/Reservation/Xml/Room/roomBookingResult"
			,type : "POST"
			,cache : false
			,async : true
			,data : params
			,dataType : "JSON"
			,success : function(data){

				if( data.status=="SUCC")
				{
					//alert( pay_message );
					//$(location).attr('href','/resort/reservation/re_confirm02');
					urlForwarding('./re_package_complete');
				}
				else
				{
					// 실패시 예약 가능하도록 변경
					$('.btn_reservation').attr('onclick','reservation();');
					//alert( pay_message );
				}

			}
			,fail : function(x,t,m){
				// 실패시 예약 가능하도록 변경
				$('.btn_reservation').attr('onclick','reservation();');
				alert( '일시적인 오류입니다. 재시도 바랍니다.' );
			}
		});
	}
}


function b64(s)
{
	var key = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

	var i = 0, len = s.length,
	c1, c2, c3,
	e1, e2, e3, e4,
	result = [];

	while (i < len) {
		c1 = s.charCodeAt(i++);
		c2 = s.charCodeAt(i++);
		c3 = s.charCodeAt(i++);

		e1 = c1 >> 2;
		e2 = ((c1 & 3) << 4) | (c2 >> 4);
		e3 = ((c2 & 15) << 2) | (c3 >> 6);
		e4 = c3 & 63;

		if (isNaN(c2)) {
			e3 = e4 = 64;
		} else if (isNaN(c3)) {
			e4 = 64;
		}

		result.push(e1, e2, e3, e4);
	}

	return result.map(function (e) { return key.charAt(e); }).join('');
}




// 예약자정보 설정
function userInfoSet()
{
	// 예약자명 설정
	$('input[name=caller]').val($('#MainContent_knm1').html());

	// 휴대전화 설정
	var phone = $('#MainContent_mobile').val();
	if( phone.length == 10 )
	{
		//$("select[name=phone0] option[value="+phone.substring(0,3)+"]").attr("selected", "ture");
		$('input[name=phone0]').val(phone.substring(0,3));
		$('input[name=phone1]').val(phone.substring(3,6));
		$('input[name=phone2]').val(phone.substring(6));
	}
	else if( phone.length == 11 )
	{
		//$("select[name=phone0] option[value="+phone.substring(0,3)+"]").attr("selected", "ture");
		$('input[name=phone0]').val(phone.substring(0,3));
		$('input[name=phone1]').val(phone.substring(3,7));
		$('input[name=phone2]').val(phone.substring(7));
	}

	// 이메일 설정
	var mail = $('#MainContent_email').val();
	if( mail.indexOf('@') > 2 )
	{
		$('input[name=mail0]').val(mail.substring(0,mail.indexOf("@")));
		$('input[name=mail1]').val(mail.substring(mail.indexOf("@")+1));
	}
}


// 위약규정 확인버튼
function cancelReadBtn()
{
	// 위약규정이미지
	var imgPath = "/packages/Reservation/assets/images/etc/cancel_read_12.jpg";

	// 사업부코드별 분류
	if( bsns_cd == "12" )		// 평창
	{
		imgPath = "/packages/Reservation/assets/images/etc/cancel_read_12.jpg";
	}
	else if( bsns_cd == "17" )	// 제주
	{
		imgPath = "/packages/Reservation/assets/images/etc/cancel_read_17.jpg";
	}

	$('.pop_cont_cancel_image').attr('src',imgPath);

	// 팝업창 열기
	layer_open2('layer2');
}
