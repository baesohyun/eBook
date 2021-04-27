package kr.co.jinibooks.vo;

public class NoticeVO {
	
	private String w_day, id,subject,content, num;

	public String getW_day() {
		return w_day;
	}

	public void setW_day(String w_day) {
		this.w_day = w_day;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "NoticeVO [w_day=" + w_day + ", id=" + id + ", subject=" + subject + ", content=" + content + ", num="
				+ num + "]";
	}
	
	
	
	


	
} // class
