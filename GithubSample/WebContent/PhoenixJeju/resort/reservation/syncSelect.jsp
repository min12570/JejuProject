<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*, packageInfo.*"%>
<%@ page import="packageInfo.PackageInfoVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.UserVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <jsp:useBean id="packList2" scope="request" class="packageInfo.PackageServlet" /> -->
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

</head>
<body>
<style>
.updown{
    padding-top: 5px;
}

div.option p.tit {
    border-left: 1px solid #777;
    background: #878787;
    padding: 11px 0 5px 20px;
    font: bold 16px "Malgun Gothic","Dotum","Arial","verdana","Helvetica";
    color: #fff;
}
</style>



	<script type="text/javascript">
	function DBsearch() {
			location.href = "main.jan_res?db=selectNalja";
		}
		
			var stayDay, roomTypeCost, lastCost;
			function totalCostOp(){
				var roomName = document.getElementById("roomType").value;
				if(roomName.indexOf("스위트") != -1){
					roomTypeCost = 100000;
				}else{
					roomTypeCost = 0;
				}
				var cost = ${intCost};
				roomTypeCost =(cost+roomTypeCost);
				document.getElementById("totalPackageCost").innerHTML = roomTypeCost+'원';
			}
	</script>

	<div id="op_cont1" class="op_cont">
		<div class="updown" id="updown">
			<p class="text">&nbsp;&nbsp;시설구분</p>
			<select name="buld_cd" class="w140 ml30" style="width: 130px"
				onchange="buldChange()"><option selected>콘도</option>
			</select>
		</div>
		<div class="updown">
			<p class="text">&nbsp;&nbsp;객실타입</p>
			<select id="roomType" name="roomType" class="w140 ml30"
				style="width: 130px" onchange="totalCostOp();">
				<option>선택하세요</option>
				<c:forEach var="jan_resName" items="${jan_resName}">
					<option>${jan_resName}</option>
				</c:forEach>
			</select>
			<!-- 지윤 - totalCostOp(투숙기간) -->
		</div>
		<div class="money01">
			<p id="stayDay"class="tit" value = "${stay}">결제금액</p>
			<p class="pt25 pl20 font_b15">
				패키지 금액 <span id='totalPackageCost' items = "${intCost}" value = "${intCost}" class="font_b16_r ml20 room_total_price_display">${cost} 원</span>					
			</p>
		</div>
	</div>
</body>
</html>