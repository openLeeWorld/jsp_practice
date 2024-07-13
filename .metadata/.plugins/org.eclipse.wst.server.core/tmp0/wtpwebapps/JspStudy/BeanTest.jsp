<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <jsp:useBean id="beantest" class="First.BeanTest" scope="page"/>
 <jsp:setProperty name="beantest" property="name" value="BeanTest!"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<b>자바빈 사용 예제</b>
	<h3><%=beantest.getName()  %></h3>
	 <h3><jsp:getProperty name="beantest" property="name"/></h3>
</body>
</html>