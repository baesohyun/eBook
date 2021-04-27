package kr.co.jinibooks.vo;

public class SearchBookPageVO {
	private String  title,keyword;
	private int currentPag, startNum, endNum;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCurrentPag() {
		return currentPag;
	}
	public void setCurrentPag(int currentPag) {
		this.currentPag = currentPag;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
}
