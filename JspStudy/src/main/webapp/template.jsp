<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	String pagefile=request.getParameter("page");
 	if (pagefile==null) pagefile="newitem";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Template test</title>
</head>
<body>
	<table width="960" border="1" color="gray" align="center">
		<tr>
			<td height="43" colspan="3" align="left">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr>
			<td width="15%" align=right valign=top><br>
				<jsp:include page="left.jsp"/>
			</td>
			<td colspan="2" align="center"><br>
				<jsp:include page="<%=pagefile+\".jsp\" %>"/>
			</td>
		</tr>
		<tr>
			<td width="100%" colspan="3" height="40" >
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>