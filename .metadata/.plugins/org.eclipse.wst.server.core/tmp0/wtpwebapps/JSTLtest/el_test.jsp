<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("test", "Session Test");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action = "el_test2.jsp" method="post">
		<table width="960" border="1" color="gray" align="center">
		<tr>
			<td> �̸�: </td><td><input type="text" name="name" value="ȫ�浿"></td>
			<td colspan="2" align="center"><input type="submit" value="�Է�"></td>
		</tr>
	</table>
	</form>

</body>
</html>