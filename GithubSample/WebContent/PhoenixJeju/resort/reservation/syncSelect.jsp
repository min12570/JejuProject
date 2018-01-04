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

	<script type="text/javascript">
	function DBsearch() {
			location.href = "main.jan_res?db=selectNalja";
		}
		
			var stayDay=2, roomTypeCost, lastCost;
			function totalCostOp(){
				//지윤이 부분
				//roomTypeCost = document.getElementById("roomType").value;
				//roomTypeCost = document.getElementById("costId").value + (roomTypeCost*10000) ;
				//아름 추가
				var roomName = document.getElementById("roomType").value;
				if(roomName.indexOf("스위트") != -1){
					roomTypeCost = 10;
				}else{
					roomTypeCost = 0;
				}
				roomTypeCost =302000 + (roomTypeCost*10000) ;
				lastCost = roomTypeCost * stayDay;
				document.getElementById("totalPackageCost").innerHTML = lastCost+'원';
			}
	</script>

	<div id="op_cont" class="op_cont">
		<div class="updown">
			<p class="text">시설d구분</p>
			<select name="buld_cd" class="w140 ml30" style="width: 130px"
				onchange="buldChange()"><option selected>콘도</option>
			</select>
		</div>
		<div id="updown" class="updown">
			<p class="text">객실d타입</p>
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
			<p class="tit" style="">결제금액</p>
			<p class="pt25 pl20 font_b15">
				패키지 금액 <span id='totalPackageCost' class="font_b16_r ml20 room_total_price_display">30200sss0원</span>
					
			</p>
		</div>
	</div>
</body>
</html>