<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta charset="utf-8" /><title>
	휘닉스 호텔앤드리조트 | PHOENIX HOTELS &amp; RESORTS
</title><meta name="keywords" content="PHOENIX, PHOENIX PYEONGCHANG, PHOENIX SNOWPARK, PHOENIX HOTELS &amp; RESORTS, PHOENIX JEJU, PHOENIX CC, 휘닉스, 휘닉스 호텔앤드리조트, 휘닉스평창, 휘닉스 평창, 휘닉스 스노파크, 휘닉스 스노우파크, 휘닉스 제주 섭지코지, 휘닉스 제주, 유민미술관, 평창 동계올림픽, 휘닉스 블루캐니언, 휘닉스 CC, 휘닉스 컨트리클럽" />
    <!--<link href="../../../Content/Site.css" rel="stylesheet" />-->
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <script src="../../Scripts/modernizr-2.6.2.js"></script>
    <link href="../../../favicon.ico" rel="shortcut icon" type="image/x-icon" /><meta name="viewport" content="width=device-width" /><meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- 휘닉스 호텔 & 리조트 구글 애널리틱스 -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-87590871-1', 'auto');
        ga('send', 'pageview');
    </script>
</head>
<body>
<!--  정민 수정 사용자 정보 가져오기 및 세션값 설정 -->
<%
								ArrayList<UserVO> userInfo = (ArrayList)request.getAttribute("userInfo");
								
								 if(userInfo.size() != 0) {
									UserVO userData = null;
		
										userData = (UserVO)userInfo.get(0);
										session.setAttribute("userinfo", userData);
										//세션 값 설정
								 
							%>
													
    <div id="wrap">

    <form method="post" action="./package?bsns=PI_PACKAGE" id="ctl01">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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" />
</div>

<script type="text/javascript">
function goToJejuIndex() {
	location.href="../../PhoenixJeju/jeju/index.html";
}
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


<script src="../../WebResource.axd?d=CRdoFqYDqtNoAb04YR4jxo6DWGNrlOfFeqO1dUam-ilSjZW-OY8lMksdSyybKMO7-HqvfpFrUXKVCqH26aiOtqsOk781&amp;t=636355230046607314" type="text/javascript"></script>


<script src="../../ScriptResource.axd?d=R4ZmigUvEZqtssH8GprCVUXzqr3_ZZC9ANsGH0OK3mls7YfcACBb697m75RpQp9LYmlCaGdtUb2sTvsN1Cs1bEttU2TK1hOch6AXZuUax_a-84Ao2OLH3DOyZruPDamUnGxj3kjBemm5yUBJ8KQv6jL9Rr1VaSsxcga2cyjDeXs4AWeW0&amp;t=3d6efc1f" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax 클라이언트 쪽 프레임워크를 로드하지 못했습니다.');
//]]>
</script>

<script src="../../ScriptResource.axd?d=Ft0qnPitlPXzUEL4OBoLnVNtlvGq6bOBIHnwkGkYstea3LntMQf8VqDNNibttCmmwW7OPPOPWgXyk4FldDxiVCPI5gt8czKr0Z2UJkGWatHzMpwpMqS0LM1ixJ5JiIJkujCAcZtdghnQ3MQqC1IuBXTUvFSZ8uTbAQ8KrUfe38rWA4yz0&amp;t=3d6efc1f" type="text/javascript"></script>
<script src="../../../Scripts/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../../../Scripts/jquery-ui-1.8.24.js" type="text/javascript"></script>
<script src="../../Scripts/package_ahreum.js"></script>
<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CBA2E6C2" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="qleYhTimtZoth94p0YTmRP8QqJca/a3ZzKZaospqrIkEmyypgV/4Zb577/+X8ww82O9zOr7zMJN8kom7kYFyuSMnVzfiIRBMyIsSKWxsWMMcRgImWmZ/cJC+NbJc+n/ToCexdk0JjIukEWC2A0GhyNCXh83g5rpVv4EVl+ewuw43iZG/PBYAYeGTZkfcGjWA8pQvZkgzA/534FyWKHfiNcXAQ9IPUyXOozLkwG3ikJ/tjacG6ffVTeEMEBhIxF1kgpJK6nUYX2fdngiCdbpDCm3JBn47W/1zm5jwVRFHzGGQj6Yq6XlBpVgPw2TCfUGrKq8/ouB3yLLrOra7o0sUQkul/T8j21ACxWekVA==" />
</div>
        <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ctl12', 'ctl01', [], [], [], 90, 'ctl00');
//]]>
</script>
<link href="../../PhoenixJeju/resort/_css/ahreum.css" type="text/css" rel="stylesheet"/>
        <div id="wrap">
            <div id="top">
                <div id="gnb_area">
                    <ul class="sitemenu">
                        <li><a href="/resort/intro">
                            <img src="../../PhoenixJeju/pyeongchang/_img/gnb/phoenixresort_off.gif" alt="휘닉스 호텔&리조트" /></a></li>
                        <li><a href="/pyeongchang/index">
                            <img src="../../PhoenixJeju/pyeongchang/_img/gnb/resortmenu_off.gif" alt="휘닉스 평창" /></a></li>
                        <div class="dropdown">
                        <li class="dropbtn"><a href="../../PhoenixJeju/jeju/index.html">
                            <img src="../..//PhoenixJeju/pyeongchang/_img/gnb/islandmenu_on.gif" alt="휘닉스 제주" /></a></li>
						<div class="dropdown-content">
							<div class="row">
								<ul class="column">
								<div class="depth01" onclick="location.href=../../jeju/intro/info'">
                            	<img src="../../PhoenixJeju/jeju/_img/comn/tmn01.gif" ov_src="../../jeju/_img/comn/tmn01_on.gif" _src="../../jeju/_img/comn/tmn01.gif" alt="Intro" /></div>                         
                                <a href="../jeju/intro/info">리조트소개</a>
                                <a href="../jeju/intro/resortmap">단지안내도</a>
                                <a href="../Site/event/event">이벤트</a></li>
                                <a href="../jeju/intro/news_letter">NEWS LETTER</a>
                                <a href="../jeju/intro/sketch">현장스케치</a>
                                <a href="../jeju/intro/golf">가이드</a>                           
								</ul>
								<ul class="column">
								<div class="depth01" onclick="location.href=../../jeju/accommodation/velraterrace'">
								<img src="../../PhoenixJeju/jeju/_img/comn/tmn02.gif" ov_src="../../jeju/_img/comn/tmn02_on.gif" _src="../../jeju/_img/comn/tmn02.gif" alt="ACCOMMODATION" /></div>
								<a href="../../jeju/accommodation/velraterrace">벨라테라스(콘도)</a>
                                <!-- <a id ="jejuPackageReserve()" href="javascript:;">패키지예약</a> -->
                                <a href="javascript:;" onclick="goPackageReserve1();">패키지예약</a>
                                <a href="../jeju/accommodation/hillius">힐리우스(별장)</a>
								</ul>
								<ul class="column">
									<div class="depth01" onclick="location.href=../jeju/dining/mint'">
                            		<img src="../../PhoenixJeju/jeju/_img/comn/tmn03.gif" ov_src="../../jeju/_img/comn/tmn03_on.gif" _src="../../jeju/_img/comn/tmn03.gif" alt="DINING" /></div>
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
								<div class="depth01" onclick="location.href=../jeju/architecture/index'">
                            	<img src="../..//PhoenixJeju/jeju/_img/comn/tmn06.gif" ov_src="../../jeju/_img/comn/tmn06_on.gif" _src="../../jeju/_img/comn/tmn06.gif" alt="ARCHITECTURE" /></div>
								<a href="/jeju/architecture/yumin">유민미술관</a>
                                <a href="/jeju/architecture/glasshouse">글라스하우스</a>
                                <a href="/jeju/architecture/agora">아고라</a>
								</ul>
								<ul class="column">
								<div class="depth01" onclick="location.href=../jeju/activities/seopjireports'">
                           		<img src="../..//PhoenixJeju/jeju/_img/comn/tmn04.gif" ov_src="../../jeju/_img/comn/tmn04_on.gif" _src="../../jeju/_img/comn/tmn04.gif" alt="ACTIVITIES" /></div>
                                <a href="/jeju/activities/seopjireports">레저</a>
                                <a href="/jeju/activities/kongkong">엔터테인먼트</a>
								</ul>
								<ul class="column">
								<div class="depth01" onclick="location.href=..../jeju/facilities/islandballroom'">
                            	<img src="../..//PhoenixJeju/jeju/_img/comn/tmn05.gif" ov_src="../../jeju/_img/comn/tmn05_on.gif" _src="../../jeju/_img/comn/tmn05.gif" alt="FACILITIES" /></div>
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
                            <li><a href="../../PhoenixJeju/resort/reservation/re_remain">통합예약</a></li>
                            <!--<li><a href="/Site/event/package">패키지</a></li>
                            <li><a href="/Site/event/event">이벤트</a></li>
                             -->
                            <li><a href="/Site/customer/Faq">고객센터</a></li>
                            <li>
                                <span id="lblLogin"><a href='/Site/Passport/Logout?mod=logout'>로그아웃</a></span></li>
                            <li class='last'>
                                <span id="lblJoin"><a href='/Site/Join/PhoenixModify'>정보수정</a></span></li>
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

            </div>
            
            <section class="content-wrapper main-content clear-fix">
                 
<link href="../../PhoenixJeju/resort/_css/cont.css" type="text/css" rel="stylesheet">

    <div id="wrap">
		<!-- 지윤이수정<div class="nav">
			<ul>
				<li><a href="#"><img src="../../resort/_img/comn/home_icon.gif" alt="home" style="padding-top:3px;"/></a></li>
				<li>패키지&이벤트행사</li>
				<li class="end">패키지</li>
			</ul>
		</div>-->

		<div id="container">
			<h1><%= userData.getUser_id() %> 님 환영합니다.</h1>
								<%	 }else { %>
									<td> 데이터가 없음</td>
										
									<% }%>
			<div class="customer_top">
              <p class="ev_sub">고객님들께 더 나은 서비스를 제공하기 위해 각종 패키지와 이벤트 행사를 진행하고 있습니다.</p>
			</div>
			
            <ul class="event_tab">
			
				<li style="width:331px" class="custab_on" onclick="location.href='../../Site/event/package'">  
					<p class="cus_icon01"><img src="../../PhoenixJeju/resort/_img/cont/package_img_on.png" alt="패키지" /></p>
					<p class="cus_text01 on">패키지</p>
				</li>
				<li class="custab_off" onMouseOver="this.className='custab_over'" onMouseOut="this.className='custab_off'" onclick="location.href='/Site/event/event'">
					<p class="cus_icon"><img src="../../PhoenixJeju/resort/_img/cont/event_img.png" alt="이벤트/행사" /></p>
					<p class="cus_text01">이벤트/행사</p>
				</li>
				<li class="custab_off" onMouseOver="this.className='custab_over'" onMouseOut="this.className='custab_off'" onclick="location.href='/Site/event/PhotoEvent'"> 
					<p class="cus_icon"><img src="../../PhoenixJeju/resort/_img/cont/eventwin_img.png" alt="포토이벤트" /></p>
					<p class="cus_text01">포토이벤트</p>
				</li>
			</ul>
            <div class="overflow">
				<h3 class="f_l bbs_tit mt45">패키지</h3>

				<ul class="f_r sitetap mt30">
                     <li>
                        <input type="image" name="ctl00$MainContent$btnAll" id="MainContent_btnAll" onMouseOver="../../PhoenixJeju/resort/_img/comn/sitetap_all_on.gif" onMouseOut="../../PhoenixJeju/resort/_img/comn/sitetap_all.gif" src="../../PhoenixJeju/resort/_img/comn/sitetap_all.gif" />
                    </li>                   
                    <li>
                        <input type="image" name="ctl00$MainContent$btnpp" id="MainContent_btnpp" onMouseOver="../../PhoenixJeju/resort/_img/comn/sitetap_park.gif" onMouseOut="../../PhoenixJeju/resort/_img/comn/sitetap_park_on.gif" src="../../PhoenixJeju/resort/_img/comn/sitetap_park_on.gif" />
                    </li>
                     <li>
                        <input type="image" name="ctl00$MainContent$btnpi" id="MainContent_btnpi" onMouseOver="../../PhoenixJeju/resort/_img/comn/sitetap_island.gif" onMouseOut="../../PhoenixJeju/resort/_img/comn/sitetap_island.gif" src="../../PhoenixJeju/resort/_img/comn/sitetap_island.gif" />
                    </li>
				</ul>
			</div>

		<!--사이트 탭 수정 150714 -->
			<div class="bbs_info">
				<p>패키지 구매시 엑스키퍼 모바일 3개월 무료 이용권 지급 <a href="https://phoenixpark.co.kr/Site/event/event_view?seq=12693" target="_blank">[자세히 보기]</a></p>
                <!--p>총 <span class="info_point"><span id="MainContent_lbltotcnt">6</span>건</span>의 게시물이 등록되어 있습니다.</p-->
				<div class="info_search">
                    <select name="ctl00$MainContent$ddpType" id="MainContent_ddpType" name="searchType">
	<option value="SUBJECT">제목</option>

</select>
<!--                        <asp:ListItem Text="내용" Value="CONTENT"></asp:ListItem>-->
                    <input name="ctl00$MainContent$txtsearch" type="text" id="MainContent_txtsearch" name="searchText" class="info_in" />
                    <input type="submit" name="ctl00$MainContent$ctl00" value="검색" class="btn_write_w37" />
				</div>
			</div>

            
                    <ul class="gallery03">
                
                        <span id="MainContent_Repeater1_Label1_0"><li class='gallery'><p><a href='package_view?seq=13198'><img src='../../PhoenixJeju/file/resort/Package/upload_20170704d4bcae66.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='package_view?seq=13198'>[제주] 유민미술관 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 02월 28일(수)</p><p class='mt15'><a href='package_view?seq=13198' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                        <span id="MainContent_Repeater1_Label1_1"><li class='gallery'><p><a href='../../PhoenixJeju/Site/event/package_view_12447.jsp'><img src='../../PhoenixJeju/file/resort/Package/upload_201611162efae3cb.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='../../PhoenixJeju/Site/event/package_view_12447.jsp'>[제주] 휘닉스 스쿠버 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 02월 28일(수)</p><p class='mt15'><a href='../../PhoenixJeju/Site/event/package_view_12447.jsp' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                        <span id="MainContent_Repeater1_Label1_2"><li class='gallery'><p><a href=../../PhoenixJeju/Site/event/package_view_12446.jsp><img src='../../PhoenixJeju/file/resort/Package/upload_20161116d39457c7.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='../../PhoenixJeju/Site/event/package_view_12446.jsp'>[제주] 맛있는 해랑[근고기모듬] 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 01월 15일(월)</p><p class='mt15'><a href='../../PhoenixJeju/Site/event/package_view_12446.jsp' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                        <span id="MainContent_Repeater1_Label1_3"><li class='gallery'><p><a href='package_view?seq=12445'><img src='../../PhoenixJeju/file/resort/Package/upload_20161116640742d4.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='package_view?seq=12445'>[제주] 민트 하우스 그릴 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 02월 28일(수)</p><p class='mt15'><a href='package_view?seq=12445' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                        <span id="MainContent_Repeater1_Label1_4"><li class='gallery'><p><a href='package_view?seq=12444'><img src='../../PhoenixJeju/file/resort/Package/upload_20161116f89407b5.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='package_view?seq=12444'>[제주] 릴렉싱 테라피 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 02월 28일(수)</p><p class='mt15'><a href='package_view?seq=12444' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                        <span id="MainContent_Repeater1_Label1_5"><li class='gallery'><p><a href='package_view?seq=12443'><img src='../../PhoenixJeju/file/resort/Package/upload_20161116d6b463d0.jpg' style='width:320px;height:185px;' class=pi></a></p><h4><a href='package_view?seq=12443'>[제주] 수영장 사우나 패키지</a></h4><p class='t02'>2017년 11월 01일(수)~2018년 02월 28일(수)</p><p class='mt15'><a href='package_view?seq=12443' class='btn_line_w140'>자세히 보기</a></p></li></span>
                
                    </ul>
                
        <input type="hidden" name="ctl00$MainContent$colCount" id="MainContent_colCount" />        
        <p>
            <center>
            <span id="MainContent_lblPage"><table class='btn_page mt30 c' >	<tr><td><a href='#'><img src='../../PhoenixJeju/resort/_img/bbs/fisrt.png'></a></td><td></td><td><a href='#'><img src='../../PhoenixJeju/resort/_img/bbs/back.png'></a></td><td></td><td class='btn_pageon'><a href='/site/event/package?bsns=PI_PACKAGE&type=&content=&page=1'>1</a></td><td width='10'></td><td><a href='#'><img src='../../PhoenixJeju/resort/_img/bbs/next.png'></a></td><td><a href='#'><img src='../../PhoenixJeju/resort/_img/bbs/last.png'></a></td>	</tr></table></span>
                </center>
        </p>
            
		</div>
	</div>


            </section>
            <div id="footer">
                <div class="footer">
                    <p class="f_logo">
                        <img src="../../PhoenixJeju/resort/_img/comn/footer_logo.png" alt="" /></p>
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
                            <li><a href="http://recruit.joongang.co.kr/html/main.html" target="_blank">채용안내</a></li>
                            <li><a href="/site/op_guide/privacy_policy" style="color: #f3d322;">개인정보처리방침</a></li>
                            <li><a href="/site/op_guide/tos">서비스이용약관</a></li>
                            <br />
                            <li class="end"><a href="/site/op_guide/emailinfo">이메일추출방지정책</a></li>
                            <li><a href="http://ppblog.blog.me/">
                                <img src="../../pyeongchang/_img/comn/blog_logo.png" alt="" /></a></li>
                            <li><a href="https://www.facebook.com/phoenixhnr/">
                                <img src="../../pyeongchang/_img/comn/facebook_logo.png" alt="" /></a></li>
                            <li><a href="https://www.instagram.com/phoenixhnr/">
                                <img src="../../pyeongchang/_img/comn/insta_logo.png" alt="" /></a></li>
                            <!--<li class="none"><a href="#">SITE MAP</a></li>-->
                        </ul>
                        <p class="f01">
                            강원도 평창군 봉평면 태기로 174 &nbsp;&nbsp;   대표 : 민병관  &nbsp;&nbsp;  사업자등록번호 : 616-81-57404<br />
                            개인정보보호책임자 : 자산관리팀 임 인 순 yim.insun@phoenixhnr.co.kr<br />
                            유선전화번호 : 1588-2828(#0)   &nbsp;&nbsp;  객실예약문의 : 1577-0069(#1)  &nbsp;&nbsp;  분양문의 : 02-554-0600

                        </p>
                        <p class="f02">COPYRIGHT PHOENIX HOTELS&RESORTS ALL RIGHTS RESERVED</p>
                    </div>
                    <div class="spon_logo mt30">
                        
                        <table>
                            <tr>
                                <td>
                                    <p class="kisia" style="cursor: pointer;">
                                        <img src="../../pyeongchang/_img/comn/ieco_logo.png" alt="" />
                                    </p>
                                </td>
                                <td>&nbsp;&nbsp;&nbsp;
                                </td>
                                <td>
                                    <table width="135" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose GeoTrust SSL for secure e-commerce and confidential communications.">
                                        <tr>
                                            <td width="135" align="center" valign="top">
                                                <script type="text/javascript" src="https://seal.geotrust.com/getgeotrustsslseal?host_name=phoenixhnr.co.kr&amp;size=M&amp;lang=en"></script>
                                                <br />
                                                <a href="http://www.geotrust.com/ssl/" target="_blank" style="color: #000000; text-decoration: none; font: bold 7px verdana,sans-serif; letter-spacing: .5px; text-align: center; margin: 0px; padding: 0px;"></a></td>
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
        <input type="hidden" name="folio"></form>
</body>
<script>
    $(document).ready(function () {
        $("#subDepth2").mouseover(function () {
            $(this).next().show();
        });

        $("#subDepth2").next().each(function () {
            $(this).mouseover(function () {
                $(this).show();
            });
            $(this).mouseleave(function () {
                $(this).hide();
            });
        });
    });

    $(document).ready(function () {
        $("#subDepth3").mouseover(function () {
            $(this).next().show();
        });

        $("#subDepth3").next().each(function () {
            $(this).mouseover(function () {
                $(this).show();
            });
            $(this).mouseleave(function () {
                $(this).hide();
            });
        });

    });
    $(document).ready(function () {
        $("#subDepth4").mouseover(function () {
            $(this).next().show();
        });

        $("#subDepth4").next().each(function () {
            $(this).mouseover(function () {
                $(this).show();
            });
            $(this).mouseleave(function () {
                $(this).hide();
            });
        });

    });
</script>
<script src="../../Scripts/user_jm.js"></script>
</html>
