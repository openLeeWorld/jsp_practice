<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename = request.getParameter("filename");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	올린 사람: <%=name %><br>
	제목: <%=subject %><br>
	파일명: <a href="upload/<%=filename %>"><%=filename %></a><br>
	<p>
</body>
</html>