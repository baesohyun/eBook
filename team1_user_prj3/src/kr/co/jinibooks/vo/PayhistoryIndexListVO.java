package kr.co.jinibooks.vo;

public class PayhistoryIndexListVO {
	
	private int currentPage, totalPage;
	private String url;
	
	public PayhistoryIndexListVO() {
	}

	public PayhistoryIndexListVO(int currentPage, int totalPage, String url) {
		super();
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.url = url;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
