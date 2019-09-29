<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="top.css"/>
<style>
@font-face {
	font-family: 'HangeulNuri-Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_three@1.0/HangeulNuri-Bold.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

ul {
	font-family: 'HangeulNuri-Bold';
}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("name");
%>
<ul class="top_ul">
	<li class="toplogo"><a href="main.jsp">사이트</a></li>
	<li class="topli"><a href="attend.jsp">출석체크</a></li>
	<%
		if(name == null){
	%>
		<li class="topli_right"><a href="login.jsp">LOGIN</a></li>
	<% } else {
			name = name.trim();
	%>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="point.jsp">POINT</a></li>
		<li class="topli_right" style="margin-top: 42px;"><%=name %>님</li>
	<% } %>
</ul>