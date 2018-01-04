<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*, packageInfo.*"%>
<%@ page import="packageInfo.PackageInfoVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.UserVO"%>
<!-- <jsp:useBean id="packList2" scope="request" class="packageInfo.PackageServlet" /> -->
<!DOCTYPE html>
<html lang="ko">
<head>
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
			alert("minus");
			totalCost = document.getElementById("costId").value;//현재 요금 가져옴
			num = (document.getElementById("peopleNumId").value - people_num);//인원 차이 구함
			totalCost = totalCost - (66000 * num);//인원 수 만큼 빼줌
		}
		document.getElementById("peopleNumId").value = people_num;//인원 수정
		document.getElementById("peopleText").innerHTML = people_num + '명';

		document.getElementById("costId").value = totalCost;//요금 수정
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
</head>
<body>


	<form method="post" action="./re_package" id="ctl01">
		<div class="aspNetHidden">
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
			<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value="" /> <input type="hidden" name="__VIEWSTATE"
				id="__VIEWSTATE"
				value="1d3dTk/vfMjc3e8GFjWal9aHaGv58Tvqhq4c3h6on5imNTqS3Dhsf4ir3Wz8EvS38Gjh7NEl4CyJ5w72jIOf0LZft9B1GvtcJqFlQ0sADpHEWoTT5dMX0/L7k9gxvbxwz/NBy2UUg+Tx+6N1acBWjPGBuvYfQAPgr4tsYnyPNg6DfekNFjaLeFxq/3i0hXm0UIIsURZJlKhHSLFLZycrU+ai/lzdDc3yieE61dRbG7PwSw+Rz30GcNGFqPqd8NR62nyXlzskN9lvOqN7NT5GpnMHO1iw+V86IkYzLjj0Usrh0wNYBF1jPDjMSgVC8PW+wiIbIhMpIwbZMCBTjw7qgUMYJy80oql7+8VxnKhcBulHxc4sD9c5cpqLGkbXfnnFtrAZGqQjfoyW9IdFunkUx+FAeqNhiMBrqgLPJmURK9tI94Z1Tiue48VPMWhmc6jlcpbb6NGQDAlICiGZte6HM4rdxCGT6J7ZOUYLe4CBdlyrAmaBlYyJmmQPm1wwHVZWAWEyxxnWJqIjF7F3g3SoyyjtSQFfR0ObChU1nDqIhE6w8s7ZDzxOz+xRyjw35fqVf6PFYmiBY5wQ/6lRwakFKwzyggb2pJCHe4YlFw==" />
		</div>

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
						$("#py_list").click(function() {
							$("#py_ul").slideToggle("slow");
						});

						$("#jeju_list").click(function() {
							$("#jeju_ul").slideToggle("slow");

						});
					});
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
								id="MainContent_cyberId" value="wlwl8469" /> <input
								type="hidden" name="ctl00$MainContent$cust_no"
								id="MainContent_cust_no" value="01178615" /> <input
								type="hidden" name="ctl00$MainContent$email"
								id="MainContent_email" value="wlwl8469@naver.com" /> <input
								type="hidden" name="ctl00$MainContent$mobile"
								id="MainContent_mobile" value="01091298469" />
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
									<li class="on"><a href="javascript:;" id="py_list" class="top_none">휘닉스 평창</a>
										<ul class="list" id="py_ul">
											<li class="off"id=0><a href="javascript:;" code="0-0">-
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
													value='weekday' id=weekday
													onclick="update_week('weekday');" checked />
												</label> <label for="id">주말</label> <input type=radio name=week_type
													value='weekend' id=weekend
													onclick="update_week('weekend');" />
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
									<div i치d="container_jm">
										<div id="mask"></div>
										<div class="window_jm" style="overflow: scroll;">
										<ul>

											<span><center>
											
													<br> <br><li class="title"></li></center></span>
												
													</ul>
<% } %>
											<div style="width: 100%">
												<img src="../../resort/_img/comn/scuba_detail.jpg"
													style="width: 100%; vertical-align: middle;">
											</div>
											<div style="width: 100%">

												<br> <br> <br> <br> <br>
												<table
													style="width: 100%; text-align: center; color: rgb(102, 102, 102); line-height: 20px; font-family: Malgun Gothic, Dotum, Arial, verdana, Helvetica; font-size: 13px; font-style: normal; font-variant: normal; border-top-color: rgb(149, 149, 149); border-top-width: 2px; border-top-style: solid; border-collapse: collapse; font-size-adjust: none; font-stretch: normal;">
													<thead>
														<tr
															style="border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: solid;">
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-bottom-width: 1px; border-right-style: solid; border-bottom-style: solid;"
																rowspan="2">기간</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-bottom-width: 1px; border-right-style: solid; border-bottom-style: solid;"
																rowspan="2">객실타입</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-right-width: 1px; border-right-style: solid;"
																colspan="3">주중(일 ~ 목)</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-right-width: 1px; border-right-style: solid;"
																colspan="3">주말(금 ~ 토)</th>
														</tr>
														<tr
															style="border-bottom-color: rgb(187, 187, 187); border-bottom-width: 1px; border-bottom-style: solid;">
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">2인용</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">3인용</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">4인용</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">2인용</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">3인용</th>
															<th
																style="background: rgb(238, 238, 238); padding: 8px 0px; border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(187, 187, 187); border-right-width: 1px; border-right-style: solid;">4인용</th>
														</tr>
													</thead>
													<tbody>
														<tr
															style="border-bottom-color: rgb(221, 221, 221); border-bottom-width: 1px; border-bottom-style: solid;">
															<th
																style="background: rgb(244, 244, 244); padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;"
																rowspan="2">17/12/01(수) ~ 18/02/28(수)</th>
															<th
																style="background: rgb(244, 244, 244); padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">로얄</th>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">302,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">368,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">434,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">387,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">453,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">519,000</td>
														</tr>
														<tr
															style="border-bottom-color: rgb(187, 187, 187); border-bottom-width: 1px; border-bottom-style: solid;">
															<th
																style="background: rgb(244, 244, 244); padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">로얄스위트</th>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">402,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">468,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">534,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">487,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">553,000</td>
															<td
																style="padding: 10px 0px; border-right-color: rgb(221, 221, 221); border-right-width: 1px; border-right-style: solid;">619,000</td>
														</tr>
													</tbody>
												</table>
											</div>
											<br> <br> <br>
											<h3 style="color: rgb(132, 108, 74);">상품 세부안내</h3>
											<ul class="font_nw13 pl10">
												<li><b>실내풀 스쿠버&nbsp;/ 조식쿠폰 수령장소 : 오렌지동 프론트데스크</b></li>
												<li>객실 정원 외 인원 추가시 인원 추가비용은 인당 25,000원 입니다.(최대 2인 추가
													가능)</li>
												<li><b> 조식 인원 추가시 특별요금 적용</b></li>
												<p>대인 19,000원(14세 이상), 소인 13,000원(8세~13세 이하), 미취학
													7,000원(만 3세 ~ 7세 이하), 유아 무료(만 3세미만)</p>
												<li><b>&nbsp;실내풀 스쿠버 이용안내</b></li>
												<p>- 위치 : 블루동 1층 064-731-7706</p>
												<p>- 시간 : 09:00 ~ 18:00&nbsp;</p>
												<p>- 실스쿠버 다이빙의 실제적인 체험 프로그램으로 물 속에서 자기 자신의 호흡으로 물 위로 뜨지도
													않고 가라 앉지도 않는 우주 공간에 떠있는 듯한 중성 부력을 느껴보는 스쿠버 다이빙 입문의 1단계
													(초등학교 고학년 이상, 추후 2,3단계 후 자격증 취득 가능)&nbsp;</p>
												<li><b>실내풀 스쿠버 체험은 사전예약 후 이용가능합니다.</b></li>
												<li><font color="#ff0000"><strong>매월
															1,3주 수요일 수영장&amp;사우나 휴장으로 1,3주 수요일 투숙 패키지 이용 시 목요일에
															스쿠버교육을 이용하셔야 합니다.</strong><br style="clear: both;"></font></li>
											</ul>
											<p>&nbsp;</p>
											<h3 style="color: rgb(132, 108, 74);">이용절차</h3>
											<h3 style="color: rgb(132, 108, 74);">
												<img
													src="http://www.phoenixpark.co.kr/File/Resort/Package/img_jeju_package(1).jpg">
											</h3>
											<h3 style="color: rgb(132, 108, 74);">&nbsp;</h3>
											<h3 style="color: rgb(132, 108, 74);">예약안내</h3>
											<ul class="font_n13 pl10">
												<li>인터넷 예약시 온라인 카드 결제 또는 현금 입금 가능합니다.</li>
												<p>* 계좌안내 : 우리은행 1005-801-081715 예금주 (주)보광제주</p>
												<p>* 입금시 투숙자명과 동일한 이름으로 송금해 주십시오.</p>
												<li>상기 요금에는 세금 및 봉사료가 포함되어 있습니다.</li>
												<li><b> 패키지 예약 문의 : </b> 1577-0069(ARS 객실예약 1번)</li>
											</ul>
											<h3 style="color: rgb(132, 108, 74);">&nbsp;</h3>
											<h3 style="color: rgb(132, 108, 74);">취소/변경 수수료 안내</h3>

											<ul class="font_n13 pl10">
												<li>도착일 기준 7일전까지 위약금 없이 취소/변경 가능합니다. (도착일 6일전 ~ 미도착 :
													10~50 취소/변경 수수료 발생)</li>
												<li>패키지 상품 세부 구성에 대한 부분 환불은 불가능합니다.</li>
											</ul>
											<br> <br>
											<p
												style="text-align: center; background: #ffffff; padding: 20px;">
												<a href="#" class="close"><img
													src="../../resort/_img/comn/close.png"
													style="width: 5%; vertical-align: middle;"></a>
											</p>

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
								<jsp:include page="cal_index.html" />
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
									</select> 실
									<p style="height: 12px;"></p>
								</div>
							</div>

							<div class="option" style="height: 290px;">
								<p class="tit" style="">옵션선택</p>
								<div class="op_cont">
									<div class="updown">
										<p class="text">시설구분</p>
										<select name="buld_cd" class="w140 ml30" style="width: 130px"
											onchange="buldChange()"><option selected>콘도</option>
										</select>
									</div>
									<div class="updown">
										<p class="text">객실타입</p>
										<select id="roomType" name="roomType" class="w140 ml30"
											style="width: 130px" onchange="totalCostOp();">
											<!-- 지윤 - totalCostOp(투숙기간) -->
											<%@page import="javax.sql.*"%>
											<%@page import="javax.naming.*"%>
											<%@page import="java.sql.*"%>
											<%@page import="biz.Biz"%>
											<% int checkIn=20180102;
												Biz biz = new Biz();

												Connection conn = null;
												//미리 만들어 놓은 테이블의 데이터를 불러오자.
												String sql;
												int checkOut = 20180103;
												int[] Empty = { 1, 1, 1, 1, 1, 1, 1 };
												sql = "	 SELECT CASE D_ONDOL WHEN D_ONDOL > 0 THEN 0\r\n" + "	ELSE 1 END 	 AS D_ONDOL	 		\r\n"
														+ "    , CASE D_TWIN WHEN D_TWIN > 0 THEN 0\r\n" + "    ELSE 1 END      AS D_TWIN\r\n"
														+ "    , CASE T_ONDOL WHEN T_ONDOL > 0 THEN 0\r\n" + "    ELSE 1 END     AS T_ONDOL\r\n"
														+ "    , CASE O_ONDOL WHEN O_ONDOL > 0 THEN 0\r\n" + "    ELSE 1 END     AS O_ONDOL\r\n"
														+ "    , CASE SUITE_A WHEN SUITE_A > 0 THEN 0\r\n" + "    ELSE 1 END     AS SUITE_A\r\n"
														+ "    , CASE SUITE_B WHEN SUITE_B > 0 THEN 0\r\n" + "    ELSE 1 END     AS SUITE_B\r\n"
														+ "    , CASE SUITE_O WHEN SUITE_O > 0 THEN 0\r\n" + "    ELSE 1 END     AS SUITE_O\r\n"
														+ "    FROM JAN_RES\r\n" + "    WHERE jan_day BETWEEN " + checkIn + " AND " + checkOut + "; ";
												Context init = new InitialContext();
												conn = (Connection) biz.getConnection();
												conn.setAutoCommit(false);
												try {

													Statement st = (Statement) conn.createStatement();
													ResultSet rs = null;
													// PreparedStatement pstmt = conn.prepareStatement(sql);
													rs = st.executeQuery(sql);
													while (rs.next()) {
														if (rs.getInt("D_ONDOL") == 0) Empty[0] = 0;
														if (rs.getInt("D_TWIN") == 0) Empty[1] = 0;
														if (rs.getInt("T_ONDOL") == 0) Empty[2] = 0;
														if (rs.getInt("O_ONDOL") == 0) Empty[3] = 0;
														if (rs.getInt("SUITE_A") == 0) Empty[4] = 0;
														if (rs.getInt("SUITE_B") == 0) Empty[5] = 0;
														if (rs.getInt("SUITE_O") == 0) Empty[6] = 0;
													}
													rs.close(); // 사용객체 반환

												} catch (Exception e) {
													e.printStackTrace();

												}
												String[] arr = null;
												if (Empty[0] == 1) out.println("<option>더블온돌</option>");
												if (Empty[1] == 1) out.println("<option>더블트윈</option>");
												if (Empty[2] == 1) out.println("<option>트윈온돌</option>");
												if (Empty[3] == 1) out.println("<option>오션온돌</option>");
												if (Empty[4] == 1) out.println("<option>스위트A</option>");
												if (Empty[5] == 1) out.println("<option>스위트B</option>");
												if (Empty[6] == 1) out.println("<option>스위트O</option>");
												biz.close(conn);
											%>
										</select>
									</div>

									<!--div class="updown" >
							<p class="text">객실수</p>
							<p class="acount">
								<input class="" type="text" name="rooms" value="1"/><span><a class="up" href="javascript:;" style="height:9px;"><img  src="../_img/cont/up.jpg" alt=""/></a>
								<a class="down" href="javascript:;"><img src="../_img/cont/down.jpg" alt=""/></a>
								</span>
							</p>&nbsp;&nbsp;실
						</div>
						
						<div class="updown" >
							<p class="text">인원</p>
							<p class="acount">
								<input class="" type="text"/>
								<span>
									<a class="up" href="javascript:;" style="height:9px;"><img  src="../_img/cont/up.jpg" alt=""/></a>
									<a class="down" href="javascript:;"><img src="../_img/cont/down.jpg" alt=""/></a>
								</span>
							</p>
							&nbsp;&nbsp;명 (정원4명)
						</div-->

								</div>
							</div>
							<div class="money01">
								<p class="tit" style="">결제금액</p>
								<p class="pt25 pl20 font_b15">
									패키지 금액 <span id='totalPackageCost'
										class="font_b16_r ml20 room_total_price_display">302000원</span>
								</p>
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
							String e_last = re_user_email.substring(6,11);
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
											style="width: 100px; margin-left: -1px;" value="<%= e_first %>"><span>
											@ </span><input type="text" name="mail1" class="co_date"
											style="width: 100px;" value="<%= e_last %>"> <select name="mail2"
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
										<span class="pr25">문자수신</span><input type="radio"
											name="sms_yn" value="1" class="co_date" checked="checked">
										예&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sms_yn"
											value="0" class="co_date"> 아니요
									</p>
								</div>
							</div>
							<div class="">
								<p class="tit">투숙자정보</p>
								<div class="info_cont" style="">
									<p class="pb5">
										<input type="checkbox" class="co_date caller-copy"
											onchange="caller_copy()">&nbsp;&nbsp;<span>예약자와
											동일</span>
									</p>
									<p>
										<span class="pr25">예약자명</span><input class="co_date"
											type="text" name="guest_name" style="width: 100px">
									</p>
									<p class="mt5">
										<span class="pr25">휴대전화</span>
										<!-- <select name="gphone0" class="w140" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select> -->
										<input type="text" name="gphone0" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span> <input
											type="text" name="gphone1" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span><input
											type="text" name="gphone2" class="co_date"
											style="width: 90px;" maxlength="4">
										<!-- <a href="javascript:;" class="btn_g">인증</a> -->
									</p>
									<p class="mt5">
										<span class="pr30">이메일</span>&nbsp; <input type="text"
											class="co_date" name="gmail0"
											style="width: 100px; margin-left: -1px;"><span>
											@ </span><input type="text" name="gmail1" class="co_date"
											style="width: 100px;"> <select name="gmail2"
											class="w140" style="width: 120px"
											onchange="valcopy(this.value,'gmail1');">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="nate.com">nate.com</option>
										</select>
									</p>
								</div>
							</div>
						</div>

						<div class="re_last mt20">
							<p class="tit">객실정보</p>
							<div class="top">
								<p>
									<span class="bold">객실료</span><span
										class="b_bold room_price_display">0원</span>
								</p>
								<p style="width: 300px;">
									<span class="bold">옵션</span><span
										class="b_bold room_option_price_display">0원</span>
								</p>
								<p>
									<span class="bold">총금액</span><span
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
	</form>
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
<script>
readPackageJSON();
</script>
</html>
