package kr.co.jinibooks.vo;

/**
 * 게시물리스트와, 정산검색조건에 들어가는 값.
 * @author KANG
 */
public class SearchCalcVO {

	private String field, keyword, title, id;
	private int currentPage, startNum, endNum;
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	@Override
	public String toString() {
		return "SearchCalcVO [field=" + field + ", keyword=" + keyword + ", title=" + title + ", id=" + id
				+ ", currentPage=" + currentPage + ", startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
	
}
