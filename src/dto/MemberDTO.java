package dto;

public class MemberDTO {
	private int seq;
	private String userid;
	private String password;
	private String email;
	private String nickname;
	private String naver_id;
	private String naver_nickname;
	private String naver_email;
	private String kakao_id;
	private String kakao_nickname;
	private String kakao_email;
	private String modify_date;
	private String create_date;
	
	
	public MemberDTO() {}
	public MemberDTO(int seq, String userid, String password, String email, String nickname, String naver_id,
			String naver_nickname, String naver_email, String kakao_id, String kakao_nickname, String kakao_email,
			String modify_date, String create_date) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.nickname = nickname;
		this.naver_id = naver_id;
		this.naver_nickname = naver_nickname;
		this.naver_email = naver_email;
		this.kakao_id = kakao_id;
		this.kakao_nickname = kakao_nickname;
		this.kakao_email = kakao_email;
		this.modify_date = modify_date;
		this.create_date = create_date;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getNaver_id() {
		return naver_id;
	}
	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}
	public String getNaver_nickname() {
		return naver_nickname;
	}
	public void setNaver_nickname(String naver_nickname) {
		this.naver_nickname = naver_nickname;
	}
	public String getNaver_email() {
		return naver_email;
	}
	public void setNaver_email(String naver_email) {
		this.naver_email = naver_email;
	}
	public String getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}
	public String getKakao_nickname() {
		return kakao_nickname;
	}
	public void setKakao_nickname(String kakao_nickname) {
		this.kakao_nickname = kakao_nickname;
	}
	public String getKakao_email() {
		return kakao_email;
	}
	public void setKakao_email(String kakao_email) {
		this.kakao_email = kakao_email;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	
	
	
	
}
	