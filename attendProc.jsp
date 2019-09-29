<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String today = request.getParameter("today");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int su = 0;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "event";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "insert into attend values(?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, today);
		su = pstmt.executeUpdate();
		
		sql = "select point from point where id = '" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		if(rs.next()){
			int point = rs.getInt(1);
			point += 100;
			
			sql = "update point set point = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			su = pstmt.executeUpdate();
		}//rs == null
	} catch(Exception e){
		e.printStackTrace();
		su = 0;
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
			out.println("<script>alert('출석 CHECK가 되었습니다!');");
			out.println("location.href = 'attend.jsp';</script>");
		} else {
			out.println("<script>alert('출석 CHECK에 실패하였습니다....');");
			out.println("location.href = 'attend.jsp';</script>");
		}
	}
%>