<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	
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
		
		String sql = "select * from users where id = '" + id + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
			
		if(rs.next() == false){
			sql = "insert into users values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			su = pstmt.executeUpdate();
			
			sql = "insert into point values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, 0);
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
			out.println("<script>alert('회원가입이 성공적으로 되었습니다!');");
			out.println("location.href = 'login.jsp';</script>");
		} else {
			out.println("<script>alert('회원가입에 실패하였습니다....');");
			out.println("location.href = 'register.jsp';</script>");
		}
	}
%>