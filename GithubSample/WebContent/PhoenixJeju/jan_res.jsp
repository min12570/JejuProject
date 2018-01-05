<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>날짜 2개 선택 후! 남은 룸 조회!</title>
</head>
<body>
	<h2>값이 ondol, twin 등 5개 나와야 함</h2>
	1월이다
	<div onclick="goRoomStart(1);">날짜를 하sssss나 받자 1</div>
	<div onclick="goRoomEnd(2);">2</div>
	<script type="text/javascript">
		var start_index = 0;
		var end_index = 0;

		function goRoomStart(start) {
			start_index = start;
		}

		function goRoomEnd(end) {
			end_index = end;

			if (start_index != 0) {
				alert(start_index);
				DBsearch();
			}
		}
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
	<div class="updown">
		<p class="text">객실타입</p>
		<select id="roomType" name="roomType" class="w140 ml30"
			style="width: 130px" onchange="totalCostOp();">
			<c:forEach var="jan_resName" items="${jan_resName}">
				<option>${jan_resName}</option>
			</c:forEach>
		</select>
		<div class="money01">
			<p class="tit" style="">결제금액</p>
			<p class="pt25 pl20 font_b15">
				패키지 금액 <span id='totalPackageCost'
					class="font_b16_r ml20 room_total_price_display">302000원</span>
			</p>
		</div>
	</div>
</body>
</html>