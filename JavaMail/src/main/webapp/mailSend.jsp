<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.*" %>
 <%@ page import="javax.mail.*" %>
 <%@ page import="javax.mail.internet.*" %>
 <%
 	request.setCharacterEncoding("euc-kr");
 	String sender = request.getParameter("sender");
 	String receiver = request.getParameter("receiver");
 	String subject = request.getParameter("subject");
 	String content = request.getParameter("content");
 	String server= "localhost";
 	
 	try{
 		Properties properties = new Properties();
 		properties.put("mail.smtp.protocols", "smtp");
 		properties.put("mail.smtp.host", server);
 		//properties.put ("mail.smtp.localhost", "127.0.0.1");
 		properties.put("mail.smtp.port", 25);
 		properties.put("mail.smtp.auth", true);
 		properties.put("mail.smtp.ssl.enable", true);
 		//properties.put("mail.smtp.ssl.trust", server);
 		
 		Session s = Session.getDefaultInstance(properties, null);
 		Message message = new MimeMessage(s);
 		
 		Address sender_address = new InternetAddress(sender);
 		Address receiver_address = new InternetAddress(receiver);
 		
 		message.setHeader("content-type", "text/html;charset=euc-kr");
 		message.setFrom(sender_address);
 		message.addRecipient(Message.RecipientType.TO, receiver_address);
 		message.setContent(content, "text/html;charset=euc-kr");
 		message.setSentDate(new java.util.Date());
 		
 		Transport transport = s.getTransport("smtp");
 		transport.connect(server, null, null); // 계정정보(id,pw)를 null로 넘겨 익명 접근 가능
 		transport.sendMessage(message, message.getAllRecipients());
 		transport.close();
 		
 		out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
 	} catch (Exception e) {
 		out.println("smtp 서버가 잘못 설정되었거나 , 서비스에 문제가 있습니다.");
 		e.printStackTrace();
 	}
%>
 	