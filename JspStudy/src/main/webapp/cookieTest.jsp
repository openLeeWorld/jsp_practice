<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	Cookie cookie =new Cookie("name","Lee");
 	cookie.setMaxAge(60);
 	response.addCookie(cookie);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2><%=cookie.getName() %></h2>
	<h2><%=cookie.getValue() %></h2>
	<h2><%=cookie.getMaxAge() %></h2>
	<a href="cookieTest2.jsp">쿠키 값 불러오기</a>
</body>
</html>