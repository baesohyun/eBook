package kr.co.jinibooks.domain;

public class MainNoticeListDomain {

	private String subject, w_day ;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getW_day() {
		return w_day;
	}

	public void setW_day(String w_day) {
		this.w_day = w_day;
	}

	@Override
	public String toString() {
		return w_day + " : " +subject ;
	}
	
	
	
}
