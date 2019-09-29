<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<style>
@font-face {
	font-family: 'yg-jalnan';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	width: 100%;
	text-align: center;
	position: relative;
	background: url('https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=655&q=80')
		center center/cover no-repeat;
}

.event {
	width: 50%;
	height: 50%;
	border: 3px solid white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-image: linear-gradient(to top, #a3bded 0%, #6991c7 100%);
	opacity: 0.6;
	font-family: 'yg-jalnan';
	color: white;
}

.sub {
	font-size: 20px;
}

.main {
	font-size: 40px;
	padding-bottom: 10px;
}

hr {
	width: 500px;
	border: 3px soild blue;
}

.check:link, .check:visited {
	border: 3px solid #f44336;
	color: yellow;
	padding: 14px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
}

.check:hover, .check:active {
	background-color: red;
}
</style>
</head>
<body style="text-align: center;">
	<div class="event">
		<div class="sub" style="padding-top: 40px;">메일 출석하고 포인트받자!</div>
		<div class="main">
			하루에 한 번<br>출석CHECK
		</div>
		<hr>
		<div class="sub">출석체크 할 때 마다 100P 적립!</div>
		<hr> <div style="padding-bottom:10px"></div>
		<a href="attend.jsp" class="check">출석체크하기</a>
	</div>
</body>
</html>