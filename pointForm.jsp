<%@page import="java.sql.*"%>
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
	background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
	opacity: 0.6;
	font-family: 'yg-jalnan';
	color: white;
}

.sub {
	font-size: 23px;
}

.sub_s {
	font-size: 16px;
}

.main {
	font-size: 42px;
	padding: 0 10px;
}

hr {
	width: 500px;
	border: 3px soild blue;
}
</style>
</head>
<body style="text-align: center;">
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		if(name != null) name = name.trim();
		int point = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String user = "event";
			String pass = "1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			
			String sql = "select point from point where id = '" + id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			if(rs.next()){
				point = rs.getInt(1);
			}//rs == null
		} catch(Exception e){
			e.printStackTrace();
		} finally {		
			if(rs != null){
				try{ rs.close(); } catch(Exception e){ }
			}//if
			
			if(pstmt != null){
				try{ pstmt.close(); } catch(Exception e){ }
			}//if
			
			if(conn != null){
				try{ conn.close(); } catch(Exception e){ }
			}//if
		}
	%>
	<div class="event">
		<div class="sub" style="margin-top: 70px;"><strong><%=name %>님</strong>의 POINT</div>
		<hr>
		<div class="main"> <%=point %>P </div>
		<hr><div style="margin-bottom:20px"></div>
		<div class="sub_s">POINT는 1000P부터 사용가능합니다.<br>POINT는 출석CHECK를 통해 모을 수 있습니다.<br>POINT를 모아 다양한 곳에 사용하세요!</div>
	</div>
</body>
</html>