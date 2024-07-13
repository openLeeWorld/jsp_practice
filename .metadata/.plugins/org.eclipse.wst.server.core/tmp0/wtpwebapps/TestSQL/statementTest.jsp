<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% 
	Connection conn = null;
	String sql = "INSERT INTO student (num, name) VALUES(6, \"홍길동\")";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySql");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		if (result != 0) {
			out.println("<h3>레코드가 등록되었습니다.</h3>");
		}
		stmt.close();
	} catch (Exception e) {
		out.println("<h3>레코드가 등록 안되었습니다.</h3>");
		e.printStackTrace();
	} finally {
		conn.close();
	}
%> 