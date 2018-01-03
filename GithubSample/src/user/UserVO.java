package user;
//정민수정
public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_contact;
	
	//정민 생성자 추가
	public UserVO(String user_id, String user_pw, String user_email, String user_context) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.user_contact = user_context;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_contact() {
		return user_contact;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}
	
	
}
