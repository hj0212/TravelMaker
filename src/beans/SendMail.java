package beans;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	String host     = "smtp.gmail.com";
	final String user   = "winhae@gmail.com";	// 구글 아이디
	final String password  = "eunice93";	// 구글 비번




	
	
	public String maketmpPw() {
		String tmpPw ="";	
		for(int i=0;i<11; i++) {
			int rand= (int)(Math.random()*(125-33+1) + 33);
		    String randstr=""+(char)(rand);
		    tmpPw+=randstr;		
		}
		
		return tmpPw;	
	}

	public void send(String id, String email, String pw){

		String mailTo = email;  //수신자메일주소
		String content = "<!DOCTYPE html>\r\n" + 
				"<html>\r\n" + 
				"<head>\r\n" + 
				"<meta charset=\"UTF-8\">\r\n" + 
				"<title>Insert title here</title>\r\n" + 
				"<style>\r\n" + 
				"        div {\r\n" + 
				"            margin: 10% auto;\r\n" + 
				"            height:400px;\r\n" +
				"            width:600px;\r\n" +
				"        }\r\n" + 
				"        legend {\r\n" + 
				"            font-size: 30px;\r\n" + 
				"        }\r\n" + 
				"        fieldset {\r\n" + 
				"            text-align: center;\r\n" + 
				"            height:100%;\r\n" +
				"            width:100%;\r\n" +
				"        }\r\n" + 
				"        span{color:blue; font-weight:600}"+
				"        a {text-decoration: none;}" +
				"    </style>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"    <div>\r\n" + 				
				"    <fieldset>\r\n" + 
				"        <legend>TravelMaker</legend>\r\n" + 
				"        <h1> 임시 비밀번호 발송 </h1>\r\n" + 
				"        <hr>\r\n" + 
				"        <p>"+id +" 님의 임시 비밀번호는 </p>\r\n" + 
				"        <p><span>  "+ pw +"  </span></p>\r\n" + 
				"        <p>입니다. 로그인 후, 정보수정에서 비밀번호를 수정해 주세요.</p>\r\n" + 
				"        <p>이용해주셔서 감사합니다.</p>\r\n" + 
                "        <a href=\"http://localhost:8080/WEB_SOCKET_0611/newlogin.jsp\">로그인으로 가기</a>" +
				"    </fieldset>\r\n" + 
				"</div>\r\n" +  
				"</body>\r\n" +  
				"</html>";
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 


		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
			message.setContent(content,"text/html;charset=utf-8");
			
			// Subject
			message.setSubject("[TravelMaker] 비밀번호 찾기 메일");

			// Text
			/*message.setText("");*/

			// send the message
			Transport.send(message);
			System.out.println("message sent!");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
	}
}