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
	<div onclick="goRoomStart(1);">날짜를 하나 받자 1</div>
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
	</script>
	<div class="updown">
		<p class="text">객실타입</p>
		<select name="roomType" class="w140 ml30" style="width: 130px"
			onchange="roomTypeChangeReflesh()">
			<c:forEach var="jan_resName" items="${jan_resName}">
				<option>${jan_resName}</option>
			</c:forEach>
		</select>
	</div>
</body>
</html>