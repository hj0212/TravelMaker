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
	final String user   = "winhae@gmail.com";	// ���̹� ���̵�
	final String password  = "";	// ���̹� ���




	
	
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

		String mailTo = email;  //�����ڸ����ּ�
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

			// Subject
			message.setSubject("[TravelMaker] �ӽú�й�ȣ �߼�");

			// Text
			message.setText("----------TravelMaker-----------"
					+ id +" ���� �ӽ� ��й�ȣ�� "
							+ "["   + pw +   "]�Դϴ�. "
							+ "�ش� ��й�ȣ�� �α��� ��, ��й�ȣ�� �������ּ���.");

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