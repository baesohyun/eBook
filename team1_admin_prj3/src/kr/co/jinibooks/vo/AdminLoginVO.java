package kr.co.jinibooks.vo;

public class AdminLoginVO {

	private String id, passwd ;

	
	// useBean tag�� �⺻ �����ڸ� ����� �� �ִ�.
	public AdminLoginVO() {
	} // LoginVO

	
	public String getId() {
		return id;
	} // getId

	public String getPasswd() {
		return passwd;
	} // getPasswd

	public void setId(String id) {
		this.id = id;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	
	
	
	
} // class
