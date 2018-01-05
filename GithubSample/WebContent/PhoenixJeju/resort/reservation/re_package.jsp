<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*, packageInfo.*"%>
<%@ page import="packageInfo.PackageInfoVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.UserVO"%>
<!-- <jsp:useBean id="packList2" scope="request" class="packageInfo.PackageServlet" /> -->
<!DOCTYPE html>
<html lang="ko">
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />

<title>휘닉스 호텔앤드리조트 | PHOENIX HOTELS &amp; RESORTS</title>
<!-- 지윤 체크박스 데이터에 따라 값 변경 -->
<script language="javascript">
	var week_type, people_num;
	var totalCost;
	function update_week(week_type) {
		if (week_type == 'weekend') {
			totalCost = document.getElementById("costId").value;
			totalCost += 85000;
			document.getElementById("costId").value = totalCost;
			document.getElementById("costText").innerHTML = totalCost + '원';
		} else if (week_type == 'weekday') {
			totalCost = document.getElementById("costId").value;
			totalCost -= 85000;
			document.getElementById("costId").value = totalCost;
			document.getElementById("totalPackageCost").innerHTML = totalCost + '원';
			document.getElementById("costText").innerHTML = totalCost + '원';
		}
	}

	function update_people(people_num) {
		var num = 0, preNum;
		preNum = document.getElementById("peopleNumId").value;
		if ((people_num - preNum) > 0) {//인원수 늘어나면 
			totalCost = document.getElementById("costId").value;//현재 요금 가져옴
			num = (people_num - document.getElementById("peopleNumId").value);//인원 차이 구함
			totalCost = totalCost + (66000 * num);//인원 수 만큼 더해 줌
			//b는 id = 'b'
		} else if ((people_num - document.getElementById("peopleNumId").value) < 0) {//인원수 줄어들면
			totalCost = document.getElementById("costId").value;//현재 요금 가져옴
			num = (document.getElementById("peopleNumId").value - people_num);//인원 차이 구함
			totalCost = totalCost - (66000 * num);//인원 수 만큼 빼줌
		}
		document.getElementById("peopleNumId").value = people_num;//인원 수정
		document.getElementById("peopleText").innerHTML = people_num + '명';
		

		document.getElementById("costId").value = totalCost;//요금 수정
		//document.getElementById("totalPackageCost").innerHTML = totalCost + '원';
		document.getElementById("costText").innerHTML = totalCost + '원';
	}
	//객실타입, 숙박일수에 따른 패키지 금액
	var stayDay = 2, roomTypeCost, lastCost;
	function totalCostOp() {
		//지윤이 부분
		//roomTypeCost = document.getElementById("roomType").value;
		//roomTypeCost = document.getElementById("costId").value + (roomTypeCost*10000) ;
		//아름 추가
		var roomName = document.getElementById("roomType").value;
		if (roomName.indexOf("스위트") != -1) {
			roomTypeCost = 10;
		} else {
			roomTypeCost = 0;
		}
		roomTypeCost = document.getElementById("costId").value + (roomTypeCost * 10000);
		lastCost = roomTypeCost * stayDay;
		document.getElementById("totalPackageCost").innerHTML = lastCost + '원';
	}
</script>

<!-- 정민 수정 제이쿼리 레이어팝업 시도 -->
<style>
/* 마스크 뛰우기 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}
/* 팝업으로 뜨는 윈도우 css  */
.window_jm {
	display: none;
	position: absolute;
	left: 50%;
	top: 50px;
	margin-left: -500px;
	width: 1000px;
	height: 500px;
	background-color: #FFF;
	z-index: 10000;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var path = window.location.pathname;
	function goToJejuIndex() {
		location.href = "../../jeju/index.html";
	}
	function wrapWindowByMask() {

		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$("#mask").css({
			"width" : maskWidth,
			"height" : maskHeight
		});

		//애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

		$("#mask").fadeIn(0);
		$("#mask").fadeTo("slow", 0.6);

		//윈도우 같은 거 띄운다.
		$(".window_jm").show();

	}

	$(document).ready(function() {
		//검은 막 띄우기
		$(".openMask").click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		//닫기 버튼을 눌렀을 때
		$(".window_jm .close").click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$("#mask, .window_jm").hide();
		});

		//검은 막을 눌렀을 때
		$("#mask").click(function() {
			$(this).hide();
			$(".window_jm").hide();

		});

	});
</script>

<meta name="keywords"
	content="PHOENIX, PHOENIX PYEONGCHANG, PHOENIX SNOWPARK, PHOENIX HOTELS &amp; RESORTS, PHOENIX JEJU, PHOENIX CC, 휘닉스, 휘닉스 호텔앤드리조트, 휘닉스평창, 휘닉스 평창, 휘닉스 스노파크, 휘닉스 스노우파크, 휘닉스 제주 섭지코지, 휘닉스 제주, 유민미술관, 평창 동계올림픽, 휘닉스 블루캐니언, 휘닉스 CC, 휘닉스 컨트리클럽" />
<!--<link href="../../Content/Site.css" rel="stylesheet" />-->
<link href="../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script src="../../Scripts/modernizr-2.6.2.js"></script>
<link href="../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
<meta name="viewport" content="width=device-width" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="../../resort/_css/datePicker.css" type="text/css"
	rel="stylesheet" />
<script src="../../Scripts/jquery-1.11.2.min.js"></script>
</head>
<body>
	<script type="text/javascript">
			//<![CDATA[
			var theForm = document.forms['ctl01'];
			if (!theForm) {
				theForm = document.ctl01;
			}
			function __doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.__EVENTTARGET.value = eventTarget;
					theForm.__EVENTARGUMENT.value = eventArgument;
					theForm.submit();
				}
			}
			//]]>
		</script>




	<script
		src="/WebResource.axd?d=CRdoFqYDqtNoAb04YR4jxo6DWGNrlOfFeqO1dUam-ilSjZW-OY8lMksdSyybKMO7-HqvfpFrUXKVCqH26aiOtqsOk781&amp;t=636355230046607314"
		type="text/javascript"></script>

	<script
		src="/ScriptResource.axd?d=R4ZmigUvEZqtssH8GprCVUXzqr3_ZZC9ANsGH0OK3mls7YfcACBb697m75RpQp9LYmlCaGdtUb2sTvsN1Cs1bEttU2TK1hOch6AXZuUax_a-84Ao2OLH3DOyZruPDamUnGxj3kjBemm5yUBJ8KQv6jL9Rr1VaSsxcga2cyjDeXs4AWeW0&amp;t=3d6efc1f"
		type="text/javascript"></script>
	<script type="text/javascript">
			//<![CDATA[
			if (typeof (Sys) === 'undefined')
				throw new Error('ASP.NET Ajax 클라이언트 쪽 프레임워크를 로드하지 못했습니다.');
			//]]>
		</script>

	<script
		src="/ScriptResource.axd?d=Ft0qnPitlPXzUEL4OBoLnVNtlvGq6bOBIHnwkGkYstea3LntMQf8VqDNNibttCmmwW7OPPOPWgXyk4FldDxiVCPI5gt8czKr0Z2UJkGWatHzMpwpMqS0LM1ixJ5JiIJkujCAcZtdghnQ3MQqC1IuBXTUvFSZ8uTbAQ8KrUfe38rWA4yz0&amp;t=3d6efc1f"
		type="text/javascript"></script>
	<script src="../../Scripts/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="../../Scripts/jquery-ui-1.8.24.js" type="text/javascript"></script>
	<div class="aspNetHidden">

		<input type="hidden" name="__VIEWSTATEGENERATOR"
			id="__VIEWSTATEGENERATOR" value="5ACD374E" /> <input type="hidden"
			name="__EVENTVALIDATION" id="__EVENTVALIDATION"
			value="yZzcIRnFKVqZqqbIxfB8z23jTGqzRCdYHTr+uM1Bx6E74h9107T2NA0XZydk5ju6Wr/Tbmtpi/HYNV7ATr+pSpHa1cEu40K7neM9ucXBml5ega3euHAPka1on6Xld+6H4hIZo4CNgSWDTPF7/TRjq/nnU1mgYHOWRt60nuXRmaRV665qc5W9MnJFWhP3U9KXKriZA6uO5yUaQ6i6P4yhBgO7U1Zqx4GURV43cuyHBV/SsONg08xH8A38rA40iuWgs7SvL55fGYrTLshg91N7TpdL+ladxCr7etgj4OpD7i6isRPTI3xFzLUZeS0=" />
	</div>
	<script type="text/javascript">
			//<![CDATA[
			Sys.WebForms.PageRequestManager._initialize('ctl00$ctl12', 'ctl01',
					[], [], [], 90, 'ctl00');
			//]]>
		</script>
	<link href="../../resort/_css/ahreum.css" type="text/css"
		rel="stylesheet" />
	<div id="wrap">
		<div id="top">
			<div id="gnb_area">
				<ul class="sitemenu">
					<li><a href="/resort/intro"> <img
							src="../../pyeongchang/_img/gnb/phoenixresort_off.gif"
							alt="휘닉스 호텔&리조트" /></a></li>
					<li><a href="/pyeongchang/index"> <img
							src="../../pyeongchang/_img/gnb/resortmenu_off.gif" alt="휘닉스 평창" /></a></li>
					<div class="dropdown">
						<li class="dropbtn"><a href="../jeju/index.html"> <img
								src="../../pyeongchang/_img/gnb/islandmenu_on.gif" alt="휘닉스 제주" /></a></li>
						<div class="dropdown-content">
							<div class="row">
								<ul class="column">
									<div class="depth01"
										onclick="location.href=../../jeju/intro/info'">
										<img src="../../jeju/_img/comn/tmn01.gif"
											ov_src="../jeju/_img/comn/tmn01_on.gif"
											_src="../jeju/_img/comn/tmn01.gif" alt="Intro" />
									</div>
									<a href="../jeju/intro/info">리조트소개</a>
									<a href="../jeju/intro/resortmap">단지안내도</a>
									<a href="../Site/event/event">이벤트</a>
									</li>
									<a href="../jeju/intro/news_letter">NEWS LETTER</a>
									<a href="../jeju/intro/sketch">현장스케치</a>
									<a href="../jeju/intro/golf">가이드</a>
								</ul>
								<ul class="column">
									<div class="depth01"
										onclick="location.href=../jeju/accommodation/velraterrace'">
										<img src="../../jeju/_img/comn/tmn02.gif"
											ov_src="../jeju/_img/comn/tmn02_on.gif"
											_src="../jeju/_img/comn/tmn02.gif" alt="ACCOMMODATION" />
									</div>
									<a href="../jeju/accommodation/velraterrace">벨라테라스(콘도)</a>
									<!-- <a id ="jejuPackageReserve()" href="javascript:;">패키지예약</a> -->
									<a href="javascript:;" onclick="goPackageReserve();">패키지예약</a>
									<a href="../../jeju/accommodation/hillius">힐리우스(별장)</a>
								</ul>
								<ul class="column">
									<div class="depth01"
										onclick="location.href=../jeju/dining/mint'">
										<img src="../../jeju/_img/comn/tmn03.gif"
											ov_src="../../jeju/_img/comn/tmn03_on.gif"
											_src="../jeju/_img/comn/tmn03.gif" alt="DINING" />
									</div>
									<a href="/jeju/dining/mint">민트</a>
									<a href="/jeju/dining/haerang">해랑</a>
									<a href="/jeju/dining/seobji">섭지</a>
									<a href="/jeju/dining/cozy">코지</a>
									<a href="/jeju/dining/bbq">불턱BBQ</a>
									<a href="/jeju/dining/moonlight">문라이트</a>
									<a href="/jeju/dining/cozysnack">코지스넥</a>
									<a href="/jeju/dining/blue">아일랜드블루</a>
								</ul>
								<ul class="column">
									<div class="depth01"
										onclick="location.href=../jeju/architecture/index'">
										<img src="../../jeju/_img/comn/tmn06.gif"
											ov_src="../jeju/_img/comn/tmn06_on.gif"
											_src="../jeju/_img/comn/tmn06.gif" alt="ARCHITECTURE" />
									</div>
									<a href="/jeju/architecture/yumin">유민미술관</a>
									<a href="/jeju/architecture/glasshouse">글라스하우스</a>
									<a href="/jeju/architecture/agora">아고라</a>
								</ul>
								<ul class="column">
									<div class="depth01"
										onclick="location.href=../jeju/activities/seopjireports'">
										<img src="../../jeju/_img/comn/tmn04.gif"
											ov_src="../jeju/_img/comn/tmn04_on.gif"
											_src="../jeju/_img/comn/tmn04.gif" alt="ACTIVITIES" />
									</div>
									<a href="/jeju/activities/seopjireports">레저</a>
									<a href="/jeju/activities/kongkong">엔터테인먼트</a>
								</ul>
								<ul class="column">
									<div class="depth01"
										onclick="location.href=..../jeju/facilities/islandballroom'">
										<img src="../../jeju/_img/comn/tmn05.gif"
											ov_src="../jeju/_img/comn/tmn05_on.gif"
											_src="../jeju/_img/comn/tmn05.gif" alt="FACILITIES" />
									</div>
									<a href="../jeju/facilities/islandballroom">연회장</a>
									<a href="../jeju/facilities/cswrite">연회/단체문의</a>
									<a href="../jeju/facilities/mintwedding">&nbsp;&nbsp;웨딩</a>
									<a href="../jeju/facilities/welcenter">&nbsp;&nbsp;편의</a>
									<a href="../jeju/facilities/shopping">&nbsp;&nbsp;쇼핑</a>
								</ul>
							</div>
						</div>
					</div>
				</ul>
				<div class="gnbmenu">
					<ul class="gnb">
						<li><a href="/resort/reservation/re_remain">통합예약</a></li>
						<!--<li><a href="/Site/event/package">패키지</a></li>
                            <li><a href="/Site/event/event">이벤트</a></li>
                             -->
						<li><a href="/Site/customer/Faq">고객센터</a></li>
						<li><span id="lblLogin"><a
								href='/Site/Passport/Logout?mod=logout'>로그아웃</a></span></li>
						<li class='last'><span id="lblJoin"><a
								href='/Site/Join/PhoenixModify'>정보수정</a></span></li>
						<li class="mem"><a href="/resort/memberlounge/condomember">회원라운지</a></li>
						<li class="mem"><a href="/resort/castLots/castLots1">회원추첨</a></li>
						<li class="mem_last"><a href="/resort/lounge/index">분양라운지</a></li>
					</ul>
					<div id="language">
						<a href="#" id="subDepth2" class="selected">Language</a>
						<ul class="sec-depth" style="display: none;">
							<!-- <li><a href="/pyeongchang/global/en/index" target="_blank">English</a></li>
                                <li><a href="/pyeongchang/global/jp/index" target="_blank">Japanese</a></li>
                                <li><a href="/pyeongchang/global/cn/index" target="_blank">Chinese</a></li> -->

							<li><a href="/resort/global/en/info_EN" target="_blank">English</a></li>
							<li><a href="/resort/global/jp/info_JP" target="_blank">Japanese</a></li>
							<li><a href="/resort/global/cn/info_CN" target="_blank">Chinese</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 지윤수정	<div id="header">
					<h1>
						<a href="/resort/intro"> <img
							src="../../resort/_img/comn/logo.gif" alt="휘닉스 호텔&리조트 로고" /></a>
					</h1>
				</div>-->
		</div>

		<section class="content-wrapper main-content clear-fix">
			<!-- 정민 수정 css복구 -->
			<link href="../../resort/_css/cont.css" type="text/css"
				rel="stylesheet">
				<style>
.updown{
    padding-top: 5px;
}
#op_cont1{
padding:0px;
}
</style>
			<script type="text/javascript" charset="utf-8">
					// Internet Explorer 버전 체크
					var IEVersionCheck = function() {

						var word;
						var version = "N/A";

						var agent = navigator.userAgent.toLowerCase();
						var name = navigator.appName;

						// IE old version ( IE 10 or Lower )
						if (name == "Microsoft Internet Explorer")
							word = "msie ";

						else {
							// IE 11
							if (agent.search("trident") > -1)
								word = "trident/.*rv:";

							// IE 12  ( Microsoft Edge )
							else if (agent.search("edge/") > -1)
								word = "edge/";
						}

						var reg = new RegExp(word
								+ "([0-9]{1,})(\\.{0,}[0-9]{0,1})");
						if (reg.exec(agent) != null)
							version = RegExp.$1 + RegExp.$2;
						//return version;

						if (version < 8) {
							if (confirm("크롬 또는 익스플로러 8 버전 이상에서만 지원됩니다. \n 구 예약페이지로 이동하시겠습니까?")) {
								location.href = "http://www.phoenixresort.co.kr/site/main/indexs.aspx";
							}
						}
					};

					IEVersionCheck();

					//토글기능 v1.0
					$(document).ready(function() {
						onestart();
						$("#py_list").click(function() {
							$("#py_ul").slideToggle("slow");
						});
						
						$("#jeju_list").click(function() {
							$("#jeju_ul").slideToggle("slow");

						});
					});
					function onestart(){
						$("#py_ul").slideToggle("slow");
					}
				</script>
			<script type="text/javascript" src="../_js/pop_layer.js"></script>
			<script type="text/javascript" src="../_js/reservation_package.js"></script>
			<div id="wrap">
				<!-- <div class="nav">
						<ul>
							<li><a href="javascript:;"><img
									src="../../pyeongchang/_img/comn/home_icon.gif" alt="home"
									style="padding-top: 3px;" /></a></li>
							<li><a href="javascript:;">통합예약</a></li>
							<li class="end"><a href="javascript:;">통합예약</a></li>
						</ul>
					</div>
					 -->

				<div id="container">
					<div class="customer_top">
						<!--	<h2 class="cus_title">
								<img src="../../resort/img/bbs/reservation.png" alt="통합예약" />
							</h2>-->
						<p class="cus_sub">고객님들의 예약을 빠르게 처리해 드리겠습니다.</p>

						<input type="hidden" name="ctl00$MainContent$cyberId"
							id="MainContent_cyberId" /> <input type="hidden"
							name="ctl00$MainContent$cust_no" id="MainContent_cust_no" /> <input
							type="hidden" name="ctl00$MainContent$email"
							id="MainContent_email" /> <input type="hidden"
							name="ctl00$MainContent$mobile" id="MainContent_mobile" />
					</div>

					<ul class="re_tab">
						<li style="width: 166px" class="custab_off"
							onMouseOver="this.className='custab_over'"
							onMouseOut="this.className='custab_off'"
							onclick="location.href='/resort/reservation/re_room'">
							<p class="cus_text01">통합예약</p>
						</li>
						<li class="custab_on"
							onclick="location.href='/resort/reservation/re_package'">
							<p class="cus_text05 on">패키지 예약</p>
						</li>
						<li class="custab_off" onMouseOver="this.className='custab_over'"
							onMouseOut="this.className='custab_off'"
							onclick="location.href='/resort/reservation/re_confirm02'">
							<p class="cus_text03">
								예약 확인 /<br /> 변경 / 취소
							</p>
						</li>
						<li class="custab_off" onMouseOver="this.className='custab_over'"
							onMouseOut="this.className='custab_off'"
							onclick="location.href='/resort/reservation/re_remain'">
							<p class="cus_text04">잔여객실 조회</p>
						</li>
						<li class="custab_off" onmouseover="this.className='custab_over'"
							onmouseout="this.className='custab_off'"
							onclick="location.href='/resort/reservation/re_coupon'">
							<!--<a href="http://www.phoenixresort.co.kr/RSRVRelation/RSRV_relation_type_2015_main.aspx" target="_blank" style="display:block;height:100%;"><p class="cus_text01">쿠폰예약</p></a>-->
							<p class="cus_text01">쿠폰예약</p>
						</li>
						<!-- <li style="width:166px" class="custab_off" onMouseOver="this.className='custab_over'" onMouseOut="this.className='custab_off'"
				onclick="location.href='/pyeongchang/intro/traffic_skibus'">
					<p class="cus_text01">버스예약</p>
				</li> -->
						<li style="width: 166px" class="custab_off"
							onMouseOver="this.className='custab_over'"
							onMouseOut="this.className='custab_off'"
							onclick="location.href='/resort/reservation/re_ski_add'">
							<p class="cus_text01">강습예약</p>
						</li>
					</ul>



					<!-- <h3 class="bbs_tit mt45">패키지예약</h3>-->

					<div class="overflow mt30">
						<div class="f_l overflow" style="display: inline-block">
							<p class="f_l font_b14 ">회원유형 선택 :</p>
							<select name="ctl00$MainContent$guest_market1"
								id="MainContent_guest_market1" class="h22 f_l ml10 "
								name="guest_market" onchange="guestMerketChange()"
								style="width: 250px;">
								<option selected="selected" value="4401" mcode="">사이버휘팍-개인회원</option>

							</select> <span class="" style="width: 220px; -ms-user-select: none;"></span>
						</div>
						<%
							UserVO userinfo1 = (UserVO)session.getAttribute("userinfo");
							String re_user_id = userinfo1.getUser_id();
							String re_user_pw = userinfo1.getUser_pw();
							String re_user_email = userinfo1.getUser_email();
							String re_user_contact = userinfo1.getUser_contact();
			%>

						<p class="f_l font_b14 ml25 "
							style="width: 250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							회원정보 :<span class="font_n14"> <span id="MainContent_knm1"
								style="vertical-align: baseline;"><%= re_user_id %></span>님
							</span>
						</p>
						<p class="f_r  font_n13 ml10">
							객실에 대한 자세한 문의는 <span class="b">1577-0069(#1)</span>으로 문의 주세요.
						</p>
					</div>
					<div class="se_form mt10">
						<div class="sel_box">
							<p class="form_tit">패키지 선택</p>
							<ul class="sel_list rsu_package">
								<li class="on"><a href="javascript:;" id="py_list"
									class="top_none">휘닉스 평창</a>
									<ul class="list" id="py_ul">
										<li class="off" id=0><a href="javascript:;" code="0-0">-
												(스파)블루캐니언</a></li>

										<li class="off" id=1><a href="javascript:;" code="0-1">-
												스키</a></li>
										<li class="off" id=2><a href="javascript:;" code="0-2">-
												스키PLUS</a></li>
									</ul></li>
								<li class="on"><a href="javascript:;" id="jeju_list"
									class="">휘닉스 제주</a>
									<ul class="list" id="jeju_ul">
										<li class="off" id=3><a href="javascript:;" code="1-0">-
												맛있는 해랑</a></li>
										<li class="off" id=4><a href="javascript:;" code="1-1">-
												유민미술관패키지</a></li>
										<li class="off" id=5><a href="javascript:;" code="1-2">-
												릴렉싱테라피</a></li>
										<li class="on" id=6><a href="javascript:;" code="1-3">-
												휘닉스 스쿠버</a></li>
										<li class="off"><a href="javascript:;" code="1-4">-
												수영장사우나패키지</a></li>
										<li class="off"><a href="javascript:;" code="1-5">-
												민트하우스그릴패키지</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="sel_box">
							<!-- 지윤이 수정 체크박스 -->
							<p class="form_tit">이용 옵션 선택</p>
							<ul class="sel_list rsu_package">
								<li class="on"><a class="top_none">요일 선택</a>
									<form>
										<fieldset>
											<label> 주중 <input type=radio name=week_type
												value='weekday' id=weekday onclick="update_week('weekday');"
												checked />
											</label> <label for="id">주말</label> <input type=radio name=week_type
												value='weekend' id=weekend onclick="update_week('weekend');" />
										</fieldset>
									</form></li>
								<li class="on"><a class="top_none">인원 선택</a>
									<form>
										<fieldset>
											<label> 2명 <input type=radio name='people_num'
												value='2' onclick="update_people(2);" checked />
											</label> <label for="id">3명</label> <input type=radio
												name='people_num' value='3' id=id
												onclick="update_people(3);" /> <label> 4명 </label><input
												type=radio name='people_num' value='4'
												onclick="update_people(4);" />

										</fieldset>
									</form></li>
							</ul>
						</div>
						<%
								ArrayList<PackageInfoVO> list = (ArrayList) request.getAttribute("packList");
								//Object obj = request.getAttribute("packList2");
								//if(obj != null) {
								//	PackageInfoVO pi = (PackageInfoVO)request.getAttribute("packList2");
								//	out.println(pi.getP_name());
								//}
							%>


						<div class="result_box">
							<p class="re_tit">선택 정보</p>
							<div class="img_box rsu_choiceContent">
								<div class="p_img">
									<p class="fff_img"></p>
									<!--<p class="f_l" style="width: 230px; height: 170px;">
											<img src="../../resort/_img/comn/scuba_image.jpg"
												style="width: 100%;" class="pkgImg">

										</p>-->
									<%
										int p_number = (int)request.getAttribute("p_number");
										
										
										if (list.size() != 0) {
											PackageInfoVO data = null;
											if (p_number == 3) { //넘어 오는 값이 해랑이면
												System.out.println("p_number = " + p_number);
											
												data = (PackageInfoVO)list.get(1);
											}
											else if (p_number == 6) { //넘어 오는 값이 스쿠버이면
												System.out.println("p_number = " + p_number);
												data = (PackageInfoVO)list.get(0);
											}
										%>

									<!-- 정민 수정// db로 패키지 목록 불러오기  -->
									<!-- 아름 수정 JSON 이용 -->
									<ul class="re_info" style="width: 265px;">
										<li class="title"></li>
										<li><span>타입 : </span>콘도, 호텔, 호스텔</li>
										<li id='peopleNumId' value='2'><span>인원 : </span><span
											id='peopleText'>2인</span></li>
										<li id='costId' value='302000'><span>요금 : </span><span
											id='costText'>302,000원</span></li>
										<li><span>투숙기간 : </span>2017.11.01 ~ 2018.03.31</li>

									</ul>
								</div>
							</div>

							<!-- 정민 수정 // 레이어 팝업 시도 -->
							<div id="wrap_jm">
								<div id="container_jm">
									<div id="mask"></div>
									<div class="window_jm" style="overflow: scroll;">

										<div class="view_top">
											<h4 class="view_hd">
												<li class="title"></li>
											</h4>
											<p class="view_hd2">
												<span>기간</span> <span class="hd_2 view_date">2017.11.01
													~ 2018.03.31</span> <span class="hd_1 "> 조회수 </span> <span
													class="hd_2 view_viewno">4,782</span>
											</p>
										</div>
										<% } %>

										<div style="width: 100%" align="center">
											<br>
											<br>
											<p align="center" class="img_for_detail"></p>

										</div>


										<br> <br> <br>


									</div>
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										</tr>
										<tr>


											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="#" class="openMask"><img
													src="../../resort/_img/comn/search.png"
													style="width: 3%; vertical-align: middle;">&nbsp;<span
													style="color: #474747; font-weight: bold">자세히 보기</span></a>
											</td>
										</tr>
									</table>
								</div>
							</div>


							<!--  데이터없음 있었음 -->
						</div>
					</div>


					<div class="se_cal mt15">
						<div class="check f_l">
							<div class="in_out">
								<p class="tit" style="border-right: 1px solid #777;">체크인</p>
								<!--기존 달력 체크인 달력-->
							</div>
							<div class="in_out" style="width: 359px;">
								<p class="tit" style="">체크아웃</p>
								<!--기존 체크아웃 달력-->
							</div>
							<!--현정, 캘린더 start-->

							<div id="wrapper">
								<div class="demo" style="margin: 0px;">
									<input id="date-range12" size="40" value="">
									<div id="date-range12-container" style="width: 456px;"></div>
								</div>
							</div>
							<!--현정, 캘린더 end-->

							<div class="color_box">
								<img src="../../_img/cont/sel_img.jpg" alt="" />
								예약가능&nbsp;&nbsp;&nbsp;&nbsp; <img
									src="../../_img/cont/standby_img.jpg" alt="" />
								대기예약&nbsp;&nbsp;&nbsp;&nbsp; <img
									src="../../_img/cont/impossible_img.jpg" alt="" />
								예약완료&nbsp;&nbsp;&nbsp;&nbsp; <img
									src="../../_img/cont/okay_img.jpg" alt="" />
								선택된날짜&nbsp;&nbsp;&nbsp;&nbsp;
								<!--<img src="../_img/cont/lottery_img.jpg" alt=""/> 회원추첨&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="../_img/cont/receipt_img.jpg" alt=""/> 회원접수&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="../_img/cont/yet_img.jpg" alt=""/> 오픈전-->

							</div>

							<div class="choice">
								<span>선택일자</span>&nbsp; <input class="co_date in_date_text"
									type="text"
									style="width: 74px; text-align: center; line-height: 1em;"
									name="arr_date" readonly="readonly"> ~ <input
									class="co_date out_date_text" type="text"
									style="width: 74px; text-align: center; line-height: 1em;"
									name="dep_date" readonly="readonly"> <a class="btn_r"
									href="javascript:;" onclick="choiceDateClear()">다시선택</a>&nbsp;&nbsp;&nbsp;
								<span>숙박일수</span>&nbsp;<input class="co_date dateperiod"
									type="text" name="night"
									style="width: 38px; text-align: center; line-height: 1em;"
									readonly="readonly"> 일&nbsp;&nbsp;&nbsp; <span>객실수</span>&nbsp;<select
									name="rooms" class="w140" style="width: 44px;"
									onchange="roomPriceCall()">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
								</select> 
								<p style="height: 12px;"></p>
							</div>
						</div>

						<div class="option" style="height: 290px;">
							<p class="tit" onclick="test();" style="">옵션선택</p>
							<div id="op_cont1" class="op_cont">
								<div class="updown" id="updown">
									<p class="text">&nbsp;&nbsp;시설구분</p>
									<select name="buld_cd" class="w140 ml30" style="width: 130px"
										onchange="buldChange()"><option selected>콘도</option>
									</select>
								</div>
								<div id="updown" class="updown">


									<p class="text" >&nbsp;&nbsp;객실타입</p>
									<!-- 세란선배님, 셀렉트박스 클릭하면 리로드 되도록 -->
									<select id="roomType" name="roomType"
										class="w140 ml30" style="width: 130px"
										onchange="totalCostOp();">
										<option>선택하세요</option>
										<c:forEach var="jan_resName" items="${jan_resName}">
											<option>${jan_resName}</option>
										</c:forEach>
									</select>

									<!-- 지윤 - totalCostOp(투숙기간) -->
								</div>
								<div class="money01">
							<p class="tit" style="">결제금액</p>
							<p class="pt25 pl20 font_b15">
								패키지 금액 <span id="totalPackageCost"
									class="font_b16_r ml20 room_total_price_display">원</span>
							</p>
						</div>
							</div>
						
						</div>
							
					</div>
					<div class="re_info mt20">
						<div class="">
							<p class="re_info_tit">예약자정보</p>
							<div class="info_cont">
								<p>

									<span class="pr25">예약자명</span><input class="co_date"
										type="text" name="caller" style="width: 100px"
										value="<%= re_user_id %>">
								</p>
								<p class="mt5">
									<span class="pr25">휴대전화</span>
									<!-- <select name="phone0" class="w140" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select> -->
									<%
							String p_first = re_user_contact.substring(0, 3);
							String p_middle = re_user_contact.substring(4, 8);
							String p_last = re_user_contact.substring(9,13);
							
							String e_first = re_user_email.substring(0,5);
							String e_last = re_user_email.substring(6,15);
							%>
									<input type="text" name="phone0" class="co_date"
										style="width: 90px;" maxlength="4" value="<%= p_first %>"><span>
										- </span> <input type="text" name="phone1" class="co_date"
										style="width: 90px;" maxlength="4" value="<%= p_middle %>"><span>
										- </span><input type="text" name="phone2" class="co_date"
										style="width: 90px;" maxlength="4" value="<%= p_last %>">
									<!-- <a href="javascript:;" class="btn_g">인증</a> -->
								</p>
								<p class="mt5">
									<span class="pr30">이메일</span>&nbsp; <input type="text"
										class="co_date" name="mail0"
										style="width: 100px; margin-left: -1px;"
										value="<%= e_first %>"><span> @ </span><input
										type="text" name="mail1" class="co_date" style="width: 100px;"
										value="<%= e_last %>"> <select name="mail2"
										class="w140" style="width: 120px"
										onchange="valcopy(this.value,'mail1');">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
									</select>
								</p>
								<p class="mt10">
									<span class="pr25">문자수신</span><input type="radio" name="sms_yn"
										value="1" class="co_date" checked="checked">
									예&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sms_yn"
										value="0" class="co_date"> 아니요
								</p>
							</div>
						</div>


						<script type="text/javascript">
							function caller_copy() {
								if (document.check_5.checkbox1.checked == true) {
							
									document.getElementById("text_1").value="<%=re_user_id%>";
									document.getElementById("text_2").value="<%=p_first%>";
									document.getElementById("text_3").value="<%=p_middle%>";
									document.getElementById("text_4").value="<%=p_last%>";
									document.getElementById("text_5").value="<%=e_first%>";
									document.getElementById("text_6").value="<%=e_last%>";
								}
							}
							</script>
						<div class="">
							<!--  정민 수정 체크박스 선택 시 value값 지정 -->
							<p class="tit" name="check_1">투숙자정보</p>
							<form name="check_5">
								<div class="info_cont" name="check_2">
									<p class="pb5" name="check_3">
										<input type="checkbox" name="checkbox1"
											class="co_date caller-copy" onclick="caller_copy()"
											href="javascript:;">&nbsp;&nbsp;<span>예약자와 동일</span>
									</p>
									<p>
										<span class="pr25">예약자명</span><input class="co_date"
											type="text" id="text_1" name="guest_name"
											style="width: 100px">
									</p>
									<p class="mt5">
										<span class="pr25">휴대전화</span>
										<!-- <select name="gphone0" class="w140" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select> -->
										<input type="text" name="gphone0" id="text_2" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span> <input
											type="text" name="gphone1" id="text_3" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span><input
											type="text" name="gphone2" id="text_4" class="co_date"
											style="width: 90px;" maxlength="4">
										<!-- <a href="javascript:;" class="btn_g">인증</a> -->
									</p>
									<p class="mt5">
										<span class="pr30">이메일</span>&nbsp; <input type="text"
											class="co_date" name="gmail0" id="text_5"
											style="width: 100px; margin-left: -1px;"><span>
											@ </span> <input type="text" class="co_date" id="text_6"
											name="gmail1" style="width: 100px;"> <select
											name="gmail2" class="w140" style="width: 120px"
											onchange="valcopy(this.value,'gmail1');">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
										</select>
									</p>
								</div>
							</form>
						</div>
					</div>

					<div class="re_last mt20">
						<p class="tit">객실정보</p>
						<div class="top">
							<p>
								<span class="bold">객실료</span><span id = "roomCostTotal"
									class="b_bold room_price_display">0원</span>
							</p>
							<p style="width: 300px;">
								<span class="bold">옵션</span><span
									class="b_bold room_option_price_display">0원</span>
							</p>
							<p>
								<span class="bold">총금액</span><span id ="totalCostPay"
									class="r_bold room_total_price_display">0원</span>&nbsp;&nbsp;<a
									class="btn_radius_r pt5" style="width: 118px;"
									href="javascript:;"
									onclick="layer_open('layer1');return false;">객실요금상세보기</a>
							</p>
						</div>

						<div class="t_info">
							<p class="f_l">
								<span>결제방법</span>
							</p>
							<select id="payHow" class="w140 f_l ml10" name="payment"
								style="width: 170px;">
								<option selected="selected" mcode="">계좌이체</option>
								<option mcode="">카드결제</option>
							</select>
							<p class="f_l ">
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="co_date"
									name="payAgreeChk"> 위약규정 사항을 확인하고
								동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn_line_radius_g"
									style="width: 80px;" href="javascript:;"
									onclick="cancelReadBtn(); return false;">위약규정확인</a>
							</p>
						</div>
					</div>
					<div class="c mt30">
						<!-- <a class="btn_g_w130" href="javascript:;">취소</a>  -->
						<a class="btn_w130 btn_reservation" href="javascript:;"
							onclick="reservation_chk();">예약하기</a>
						<!-- /resort/reservation/re_package_complete -->
						<img src="../../resort/_img/comn/loading.gif" alt="로딩중입니다."
							id="roomprice_loading" style="display: none;">
					</div>

					<div class="layer">
						<div class="bg"></div>
						<div id="layer1" class="pop-layer" style="width: 700px;">
							<div class="pop_tit">
								<h3>객실요금상세보기</h3>
								<p style="float: right;">
									<a href="javascript:;" class="cbtn"><img
										src="../../_img/cont/pop_close.png" alt="닫기" /></a>
								</p>
							</div>

							<div class="pop_cont">
								<table class="table01">
									<colgroup>
										<col width="18%">
										<col width="%">
										<col width="15%">
										<col width="20%">
										<col width="18%">
									</colgroup>
									<thead>
										<tr>
											<th class="border_b">사용일자</th>
											<th class="border_b">객실타입</th>
											<th class="border_b">객실번호</th>
											<th class="border_b">요금유형</th>
											<th class="last none border_b">객실료</th>
										</tr>
									</thead>
									<tbody class="layer_pop_rooms"></tbody>
								</table>

								<p class="c mt20">
									<a class="btn_w130 cbtn" href="javascript:;">확인 </a>
								</p>

							</div>

						</div>
					</div>

					<div class="layer2">
						<div class="bg2"></div>
						<div id="layer2" class="pop-layer" style="width: 700px;">
							<div class="pop_tit">
								<h3>위약규정확인</h3>
								<p style="float: right;">
									<a href="javascript:;" class="cbtn"><img
										src="../../_img/cont/pop_close.png" alt="닫기" /></a>
								</p>
							</div>

							<div class="pop_cont" style="text-align: center;">
								<img
									src="../../packages/Reservation/assets/images/etc/cancel_read_12.jpg"
									class="pop_cont_cancel_image" alt="위약규정확인">
							</div>

						</div>
					</div>
				</div>
			</div>



		</section>
		<div id="footer">
			<div class="footer">
				<p class="f_logo">
					<img src="../../resort/_img/comn/footer_logo.jpg" alt="" />
				</p>
				<div class="copyright">
					<script type="text/javascript">
							function Anne() {
								alert("준비중입니다.")
							}
						</script>
					<ul>
						<li><a href="/resort/info/info">회사소개</a></li>
						<li><a href="/Site/customer/1to1">고객문의</a></li>
						<li><a href="/Site/Customer/Faq">FAQ</a></li>
						<li><a href="http://recruit.joongang.co.kr/html/main.html"
							target="_blank">채용안내</a></li>
						<li><a href="/site/op_guide/privacy_policy"
							style="color: #f3d322;">개인정보처리방침</a></li>
						<li><a href="/site/op_guide/tos">서비스이용약관</a></li>
						<br />
						<li class="end"><a href="/site/op_guide/emailinfo">이메일추출방지정책</a></li>
						<li><a href="http://ppblog.blog.me/"> <img
								src="../../pyeongchang/_img/comn/blog_logo.png" alt="" /></a></li>
						<li><a href="https://www.facebook.com/phoenixhnr/"> <img
								src="../../pyeongchang/_img/comn/facebook_logo.png" alt="" /></a></li>
						<li><a href="https://www.instagram.com/phoenixhnr/"> <img
								src="../../pyeongchang/_img/comn/insta_logo.png" alt="" /></a></li>
						<!--<li class="none"><a href="#">SITE MAP</a></li>-->
					</ul>
					<p class="f01">
						강원도 평창군 봉평면 태기로 174 &nbsp;&nbsp; 대표 : 민병관 &nbsp;&nbsp; 사업자등록번호 :
						616-81-57404<br /> 개인정보보호책임자 : 자산관리팀 임 인 순
						yim.insun@phoenixhnr.co.kr<br /> 유선전화번호 : 1588-2828(#0)
						&nbsp;&nbsp; 객실예약문의 : 1577-0069(#1) &nbsp;&nbsp; 분양문의 :
						02-554-0600

					</p>
					<p class="f02">COPYRIGHT PHOENIX HOTELS&RESORTS ALL RIGHTS
						RESERVED</p>
				</div>
				<div class="spon_logo mt30">

					<table>
						<tr>
							<td>
								<p class="kisia" style="cursor: pointer;">
									<img src="../../pyeongchang/_img/comn/ieco_logo.png" alt="" />
								</p>
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
								<table width="135" border="0" cellpadding="2" cellspacing="0"
									title="Click to Verify - This site chose GeoTrust SSL for secure e-commerce and confidential communications.">
									<tr>
										<td width="135" align="center" valign="top"><script
												type="text/javascript"
												src="https://seal.geotrust.com/getgeotrustsslseal?host_name=phoenixhnr.co.kr&amp;size=M&amp;lang=en"></script>
											<br /> <a href="http://www.geotrust.com/ssl/"
											target="_blank"
											style="color: #000000; text-decoration: none; font: bold 7px verdana, sans-serif; letter-spacing: .5px; text-align: center; margin: 0px; padding: 0px;"></a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<form name="custom">
		<input type="hidden" name="folio">
	</form>
</body>
<script>
	$(document).ready(function() {
		$("#subDepth2").mouseover(function() {
			$(this).next().show();
		});

		$("#subDepth2").next().each(function() {
			$(this).mouseover(function() {
				$(this).show();
			});
			$(this).mouseleave(function() {
				$(this).hide();
			});
		});
	});

	$(document).ready(function() {
		$("#subDepth3").mouseover(function() {
			$(this).next().show();
		});

		$("#subDepth3").next().each(function() {
			$(this).mouseover(function() {
				$(this).show();
			});
			$(this).mouseleave(function() {
				$(this).hide();
			});
		});
  
	});
	$(document).ready(function() {
		$("#subDepth4").mouseover(function() {
			$(this).next().show();
		});

		$("#subDepth4").next().each(function() {
			$(this).mouseover(function() {
				$(this).show();
			});
			$(this).mouseleave(function() {
				$(this).hide();
			});
		});

	});
</script>

<script src="../../Scripts/package_ahreum.js"></script>
<script src="../../Scripts/datePicker.js"></script>

<script type="text/javascript">
readPackageJSON();
//세란선배님, 리로드 시키는  s 부분
var count;
var day;
function test(){
	var check_inGo = check_in_function();
	var check_outGo = check_out_function();
	
	ahreum_nalGo(check_inGo,check_outGo);
	
	var check_in = check_inGo.substring(0, 4) + check_inGo.substring(5, 7) + check_inGo.substring(8, 10);
	var check_out = check_outGo.substring(0, 4) + check_outGo.substring(5, 7) + check_outGo.substring(8, 10);

	day = (check_out-check_in);
	var cost = document.getElementById("costId").value;
	cost = cost*day;
	setDay(day);
	document.getElementById("roomCostTotal").innerHTML = cost + '원 ';
	document.getElementById("totalCostPay").innerHTML = cost + '원';
	$('#totalCostPay').val(cost+'원');
	$("#op_cont1").load("main.jan_res?db3=selectNalja&check_inGo="+check_in + "&check_outGo=" + check_out+"&cost="+cost);
}

</script>
</html>
