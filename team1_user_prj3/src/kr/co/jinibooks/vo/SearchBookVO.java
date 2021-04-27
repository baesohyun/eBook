package kr.co.jinibooks.vo;

public class SearchBookVO {
	private String  keyword, categoryName;
	private int  currentPage;
	
	
	public SearchBookVO() {
		super();
	}


	public SearchBookVO(String keyword, String categoryName, int currentPage) {
		super();
		this.keyword = keyword;
		this.categoryName = categoryName;
		this.currentPage = currentPage;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	

}
