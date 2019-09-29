<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="top.css"/>
<style>
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
	<% } else {%>
		<li class="topli_right"><a href="logout.jsp">LOGOUT</a></li>
		<li class="topli_right"><a href="*">POINT</a></li>
		<li class="topli_right" style="margin-top: 42px;"><%=name %>님</li>
	<% } %>
</ul>