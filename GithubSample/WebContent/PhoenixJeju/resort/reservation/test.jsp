<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
    $("#a").click(function(){
        $("#div1").load("cal_index.html");
    });
});
</script>
<div id="div1">
    <h2>Let jQuery AJAX Change This Text</h2>
</div>
<div id="di2">
    <h2>Let jQuery AJAX Change This Text</h2>
</div>


<button id="a">Get External Content</button>

</body>
</html>