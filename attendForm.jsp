<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>
<style>
table, td, th {  
  border: 1px solid #ddd;
}

table {
	width: 80%;
	height: 80%;
	margin: auto;
	border-collapse: collapse;
}

th {
	text-align: center;
}

td {
	vertical-align: top;
}
</style>
<body style="text-align: center">
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String)session.getAttribute("name");	
		String id = (String)session.getAttribute("id");
	
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = cr.get(Calendar.MONTH);
		int date = cr.get(Calendar.DATE);
		
		String day;
		String today = year + ":" + (month + 1) + ":" + date; // 오늘 날짜
		String todayDB;
		if((month+1) < 10) {
			todayDB  = year + "0" + (month + 1) + "" + date; // 오늘 날짜
		} else {
			todayDB  = year + "" + (month + 1) + "" + date; // 오늘 날짜
		}
		// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
		cr.set(year, month, 1);

		// 셋팅한 날짜로 부터 아래 내용을 구함

		// 해당 월의 첫날를 구함
		int startDate = cr.getMinimum(Calendar.DATE);

		// 해당 월의 마지막 날을 구함
		int endDate = cr.getActualMaximum(Calendar.DATE);

		// 1일의 요일을 구함
		int startDay = cr.get(Calendar.DAY_OF_WEEK);
		int count = 0;
	%>
	<h3><%=month+1%>월</h3>
	<table>
		<tr height="30">
			<th><font size="2" color="red">일</font></th>
			<th><font size="2">월</font></th>
			<th><font size="2">화</font></th>
			<th><font size="2">수</font></th>
			<th><font size="2">목</font></th>
			<th><font size="2">금</font></th>
			<th><font size="2" color="#529dbc">토</font></th>
		</tr>
		<tr height="30">
			<%
				for (int i = 1; i < startDay; i++) {
					count++;
			%>
			<td>&nbsp;</td>
			<%
				}
				for (int i = startDate; i <= endDate; i++) {
					if((month+1) < 10) {
						day  = year + "0" + (month + 1);
					} else {
						day  = year + "" + (month + 1);
					}
					
					if(i >= 10) {
						day = day + "" + i;
					} else {
						day = day + "0" + i;
					}
					//System.out.println(day);
					
					String bgcolor = (today.equals(year + ":" + (month + 1) + ":" + i)) ? "#CCCCCC" : "#FFFFFF";
					String color;
					if(count % 7 == 0) {
						color = "red";
					} else if (count % 7 == 6){
						color = "#529dbc";
					} else {
						color = "black";
					}
					count++;
			%>
			<td style="background-color: <%=bgcolor%>"><div style="margin-left:4px;color:<%=color%>"><%=i%></div>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					if(id != null){
						try {
							String url = "jdbc:oracle:thin:@localhost:1521:XE";
							String user = "event";
							String pass = "1234";
							
							Class.forName("oracle.jdbc.driver.OracleDriver");
							conn = DriverManager.getConnection(url, user, pass);
							
							String sql = "select * from attend where id = '" + id + "' and to_char(ATTEND_DATE, 'YYYYMMdd') = '" + day + "'";
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							System.out.println("1");
							if(rs.next()){
								System.out.println("2");
								out.println("dd");
								System.out.println("출석");
							}
							System.out.println("3");
							
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
					}
				%>
			</td>
			<%
					if (count % 7 == 0 && i < endDate) {
			%>
		</tr>
		<tr height="30">
			<%
					}
				}
				while (count % 7 != 0) {
			%>
			<td>&nbsp;</td>
			<%
					count++;
				}
			%>
		</tr>
	</table>
</body>
</html>
