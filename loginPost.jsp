<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int su = 0;
	String str = "로그인에 실패했습니다..";
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "event";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "select * from users where id = '" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rPasswd = rs.getString("passwd");
			
			if(rPasswd.equals(rs.getString(2))){
				session.setAttribute("id", rs.getString(1));
				session.setAttribute("passwd", rs.getString(2));
				session.setAttribute("name", rs.getString(3));
				su = 1;
			}else {
				str = "비밀번호를 확인해주세요.";
			}
		}else {
			str = "아이디가 존재하지 않습니다.";
		}
	} catch (Exception e) {
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
		
		if(su == 1){
			out.println("<script>alert('로그인 되었습니다!');");
			out.println("location.href = 'main.jsp';</script>");
		} else {
			out.println("<script>alert('" + str + "');");
			out.println("location.href = 'login.jsp';</script>");
		}
	}
%>