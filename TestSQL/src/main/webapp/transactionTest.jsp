<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "INSERT INTO student (num, name) VALUES(12, \"홍길동\")";
	String sql2 = "SELECT * FROM student WHERE num=12";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySql");
		conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		
		pstmt = conn.prepareStatement(sql2);
		rs = pstmt.executeQuery();
		
		if(!rs.next()){
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백하였습니다.</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입이 모두 완료되었습니다.</h3>");
		}
		
		pstmt.close();
		conn.setAutoCommit(true);
		rs.close();
	} catch (Exception e) {
		out.println("<h3>데이터 삽입이 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		conn.close();
	}
%> 