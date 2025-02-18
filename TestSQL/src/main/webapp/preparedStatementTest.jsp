<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<% 
	Connection conn = null;
	String sql = "INSERT INTO student (num, name) VALUES(?, ?)";
	ArrayList<String> names = new ArrayList<>(Arrays.asList("송가영", "이서영", "김지름", "경사우"));
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySql");
		conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		for (int i=1; i<5; i++) {
			String name = names.get(i-1);
			pstmt.setInt(1, i);
			pstmt.setString(2, name);  
			if(pstmt.executeUpdate()!=0){
				out.println("<h3>"+i+"번 레코드를 등록하였습니다.</h3>");
			}
		} 
		pstmt.close();
	} catch (Exception e) {
		out.println("<h3>레코드가 등록 안되었습니다.</h3>");
		e.printStackTrace();
	} finally {
		conn.close();
	}
%> 