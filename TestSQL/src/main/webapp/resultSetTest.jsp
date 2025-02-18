<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<% 
	Connection conn = null;
	String sql = "SELECT * FROM student";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySql");
		conn = ds.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		
		while(rs.next()) {
			out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
		}
		
		out.println("칼럼 수: " + rsmd.getColumnCount()+"<br>");
		for(int i=1; i<=rsmd.getColumnCount();i++){
			out.println(i+"번째 칼럼의 이름: " + rsmd.getColumnName(i)+"<br>");
			out.println(i+"번째 칼럼의 타입 이름: " + rsmd.getColumnTypeName(i)+"<br>");
		}
		rs.close();
		pstmt.close();
	} catch (Exception e) {
		out.println("<h3>데이터가 가져오기가 안되었습니다.</h3>");
		e.printStackTrace();
	} finally {
		conn.close();
	}
%> 