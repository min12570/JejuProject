<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*, packageInfo.*"%>
<%@ page import="packageInfo.PackageInfoVO" %>
<%@ page import="java.util.ArrayList" %>
<!-- <jsp:useBean id="packList2" scope="request" class="packageInfo.PackageServlet" /> -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<title>휘닉스 호텔앤드리조트 | PHOENIX HOTELS &amp; RESORTS</title>
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

		<div id="wrap">
			<div id="top">
				<div id="gnb_area">
					<ul class="sitemenu">
						<li><a href="/resort/intro"> <img
								src="../../pyeongchang/_img/gnb/phoenixresort_on.gif"
								alt="휘닉스 호텔&리조트" /></a></li>
						<li><a href="/pyeongchang/index"> <img
								src="../../pyeongchang/_img/gnb/resortmenu_off.gif" alt="휘닉스 평창" /></a></li>
						<li><a href="/jeju/index"> <img
								src="../../pyeongchang/_img/gnb/islandmenu_off.gif" alt="휘닉스 제주" /></a></li>
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

				<link href="../_css/cont.css" type="text/css" rel="stylesheet">
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
							<p class="f_l font_b14 ml25 "
								style="width: 250px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
								회원정보 :<span class="font_n14"> <span id="MainContent_knm1"
									style="vertical-align: baseline;">정지윤</span>님
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
									<li class="on"><a href="javascript:;" class="top_none">휘닉스
											평창</a>
									<ul class="list">
											<li class="off"><a href="javascript:;" code="0-0">-
													(스파)블루캐니언</a></li>
											
											<li class="off"><a href="javascript:;" code="0-1">-
													스키</a></li>
											
											<li class="off"><a href="javascript:;" code="0-2">-
													스키PLUS</a></li>
										</ul></li>
									<li class="on"><a href="javascript:;" class="">휘닉스 제주</a>
									<ul class="list">
											<li class="off"><a href="javascript:;" code="1-0">-
													맛있는 해랑</a></li>
											<li class="off"><a href="javascript:;" code="1-1">-
													유민미술관패키지</a></li>
											<li class="off"><a href="javascript:;" code="1-2">-
													릴렉싱테라피</a></li>
											<li class="on"><a href="javascript:;" code="1-3">-
													휘닉스 스쿠버</a></li>
											<li class="off"> <a href="javascript:;" code="1-4">-
													수영장사우나패키지</a></li>
											<li class="off"><a href="javascript:;" code="1-5">-
													민트하우스그릴패키지</a></li>
										</ul></li>
								</ul>
							</div>
							<div class="sel_box">
								<p class="form_tit">이용 인원 선택</p>
								<ul class="sel_list rsu_packdetail"></ul>
							</div>
							<%
ArrayList<PackageInfoVO> list = (ArrayList)request.getAttribute("packList");
//Object obj = request.getAttribute("packList2");
//if(obj != null) {
//	PackageInfoVO pi = (PackageInfoVO)request.getAttribute("packList2");
//	out.println(pi.getP_name());
//}
%>

							<div class="result_box">
							
								<p class="re_tit">선택 정보</p>
								
								<div class="img_box rsu_choiceContent">
									<!-- <p class="f_l"><img src="../_img/bbs/package01_img.gif" width="203px" height="120px"> <br/> <a class="btn_g mt10" style="width:75px;" href="javascript:;">상세보기</a></p> -->

									<p class="f_l" style="width: 230px; height: 170px;">
										<img src="../../resort/_img/comn/logo2.png"
											style="width: 100%;" class="pkgImg">
									</p>
									<% if(list.size() != 0) {
								PackageInfoVO data = null;
								for (int i = 0; i < list.size(); i++) {
									data = (PackageInfoVO)list.get(i);
								%>


									<ul class="re_info" style="width: 265px;">
									<li>패키지 이름 : <%=  data.getP_name() %>
									<%	}
									} else { %>
									<td> 데이터가 없음</td>
									
										
									<% }%>
							
										<li class="title">산패키지(조식포함)</li>
										<li><span>타입 : </span>콘도, 호텔, 호스텔</li>
										<li><span>인원 : </span>2인</li>
										<li><span>요금 : </span>148,000원</li>
										<li><span>투숙기간 : </span>1박</li>


										<li class="title mt10" style="width: 265px;">[성수기] 주중
											2인(조식+양떼목장)</li>
										<li><span>구성 : </span>주중객실+조식+케이블카(양떼)</li>
										<li><span>안내1 : </span>케이블카는 현장상황에따라 운휴될수있습니다.(월요일 휴무)</li>
										<li><span>안내2 : </span>쿠폰 체크인시프론트에서제공합니다.</li>
											
									</ul>
								</div>
							</div>
						</div>
							

						<div class="se_cal mt15">
							<div class="check f_l">
								<div class="in_out">
									<p class="tit" style="border-right: 1px solid #777;">체크인</p>

									<!--달력-->
									<div class="re_cal reservation_in" style="">
										<div class="date">
											<p class="datePrev">
												<a href="javascript:;"><img
													src="../../_img/bbs/cal_prev.png" alt="" /></a>
											</p>
											<p class="dateNext">
												<a href="javascript:;"><img
													src="../../_img/bbs/cal_next.png" alt="" /></a>
											</p>
											<p class="dateNow">2015년 8월</p>
										</div>
										<table class="re_cal">
											<colgroup>
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
											</colgroup>
											<thead>
												<tr>
													<th>sun</th>
													<th>mon</th>
													<th>tue</th>
													<th>wed</th>
													<th>thu</th>
													<th>fri</th>
													<th>sat</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--//달력-->

								</div>
								<div class="in_out" style="width: 359px;">
									<p class="tit" style="">체크아웃</p>
									<!--달력-->
									<div class="re_cal reservation_out" style="">
										<div class="date">
											<p class="datePrev">
												<a href="javascript:;"><img
													src="../../_img/bbs/cal_prev.png" alt="" /></a>
											</p>
											<p class="dateNext">
												<a href="javascript:;"><img
													src="../../_img/bbs/cal_next.png" alt="" /></a>
											</p>
											<p class="dateNow">2015년 9월</p>
										</div>
										<table class="re_cal">
											<colgroup>
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
												<col width="40px" />
											</colgroup>
											<thead>
												<tr>
													<th>sun</th>
													<th>mon</th>
													<th>tue</th>
													<th>wed</th>
													<th>thu</th>
													<th>fri</th>
													<th>sat</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
												<tr>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
													<td class="no"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--//달력-->
								</div>
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
											onchange="buldChange()"></select>
									</div>
									<div class="updown">
										<p class="text">객실타입</p>
										<select name="roomType" class="w140 ml30" style="width: 130px"
											onchange="roomTypeChangeReflesh()"></select>
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
									패키지 금액 <span class="font_b16_r ml20 room_total_price_display">0원</span>
								</p>
							</div>
						</div>

						<div class="re_info mt20">
							<div class="">
								<p class="re_info_tit">예약자정보</p>
								<div class="info_cont">
									<p>
										<span class="pr25">예약자명</span><input class="co_date"
											type="text" name="caller" style="width: 100px">
									</p>
									<p class="mt5">
										<span class="pr25">휴대전화</span>
										<!-- <select name="phone0" class="w140" style="width:60px">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select> -->
										<input type="text" name="phone0" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span> <input
											type="text" name="phone1" class="co_date"
											style="width: 90px;" maxlength="4"><span> - </span><input
											type="text" name="phone2" class="co_date"
											style="width: 90px;" maxlength="4">
										<!-- <a href="javascript:;" class="btn_g">인증</a> -->
									</p>
									<p class="mt5">
										<span class="pr30">이메일</span>&nbsp; <input type="text"
											class="co_date" name="mail0"
											style="width: 100px; margin-left: -1px;"><span>
											@ </span><input type="text" name="mail1" class="co_date"
											style="width: 100px;"> <select name="mail2"
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
								<select class="w140 f_l ml10" name="payment"
									style="width: 170px;"></select>
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
								onclick="reservation();">예약하기</a>
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
</html>