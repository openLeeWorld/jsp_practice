<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 session.setMaxInactiveInterval(10);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session Test</title>
</head>
<body>
<h2>세션 테스트</h2>
isNew():<%=session.isNew() %><br>
생성시간:<%=session.getCreationTime() %><br>
최종 접속 시간:<%=session.getLastAccessedTime() %><br>
세션 ID:<%=session.getId() %><br>
</body>
</html>