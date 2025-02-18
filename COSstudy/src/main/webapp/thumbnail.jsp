<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderedOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	String imagePath = request.getRealPath("image");
	int size=1*1024*1024; //1MB가 최대 파일 크기
	String filename="";
	
	try {
		// 최대 크기를 넘어가는 파일 크면 예외 처리
		MultipartRequest multi = new MultipartRequest(request, 
													imagePath,
													size,
													"euc-kr",
													new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String file=(String)files.nextElement();
		filename=multi.getFilesystemName(file);
		
	
	ParameterBlock pb= new ParameterBlock();
	pb.add(imagePath+"/"+filename);
	RenderedOp rOp = JAI.create("fileload", pb);
	
	BufferedImage bi = rOp.getAsBufferedImage();
	BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
	
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,100,100,null);
	
	File sm_file = new File(imagePath + "/sm_" + filename);
	ImageIO.write(thumb,"jpg",sm_file);
	
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
	-원본 이미지-<br>
	<img src="image/<%=filename %>"><p>
	-썸네일 이미지-<br>
	<img src="image/sm_<%=filename %>">
</body>
</html>