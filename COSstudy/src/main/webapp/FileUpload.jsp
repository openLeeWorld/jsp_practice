<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath = request.getRealPath("upload");
	int size=10*1024*1024; //10MB가 최대 파일 크기
	String name="";
	String subject="";
	String filename="";
	
	try {
	// 최대 크기를 넘어가는 파일 크면 예외 처리
	MultipartRequest multi = new MultipartRequest(request, 
												uploadPath,
												size,
												"euc-kr",
												new DefaultFileRenamePolicy());
	
	name=multi.getParameter("name");
	subject=multi.getParameter("subject");
	
	Enumeration files = multi.getFileNames();
	
	String file=(String)files.nextElement();
	filename=multi.getFilesystemName(file);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="subject" value="<%=subject %>">
		<input type="hidden" name="filename" value="<%=filename%>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>