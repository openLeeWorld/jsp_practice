<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String name="";
 	String value="";
 	String cookie=request.getHeader("Cookie");
 	
 	if(cookie!=null){
 		Cookie cookies[] =request.getCookies();
 		for(int i=0; i<cookies.length; i++) {
 			name=cookies[i].getName();
 			value=cookies[i].getValue();
 		}
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>��Ű �̸�=<%=name %></h2>
	<h2>��Ű ��=<%=value %></h2>
</body>
</html>