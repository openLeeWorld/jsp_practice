<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Plugin Action Test</title>
</head>
<body>
<h2>�÷����� �׼� �׽�Ʈ</h2>
<jsp:plugin type="applet" codebase="../java/PluginTest" code="PluginTest" width="100"  height="100">
	<jsp:params>
		<jsp:param name="name" value="Lee"/>
	</jsp:params>
	<jsp:fallback>�÷����� �±׸� �������� �ʽ��ϴ�.</jsp:fallback>
</jsp:plugin>
</body>
</html>