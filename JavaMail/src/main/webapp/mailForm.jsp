<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form action = "mailSend.jsp" method="post">
	<table border="1" width="450">
		<tr><td align="center" colspan="2" ><b>자바메일 보내기</b></td></tr>
		<tr><td>보내는 사람 메일:</td><td><input type="text" name="sender"></td></tr>
		<tr><td>받는 사람 메일:</td><td><input type="text" name="receiver"></td></tr>
		<tr><td>제목:</td><td><input type="text" name="subject"></td></tr>
		<tr>
			<td>내용:</td>
			<td><textarea name="content" cols="40" rows="20"></textarea></td>
		</tr>
		<tr><td align="center" colspan="2"><input type="submit" value="보내기"></td></tr>
	</table>
	</form>
	</center>
</body>
</html>