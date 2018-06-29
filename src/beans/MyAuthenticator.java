package beans;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 메일 인증 클래스
public class MyAuthenticator extends Authenticator {

	private String userName;
	private String password;
	
	
	// 생성자
	public MyAuthenticator(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}


	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(userName, password);
	}
	
}
