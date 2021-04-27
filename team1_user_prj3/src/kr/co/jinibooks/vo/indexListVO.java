package kr.co.jinibooks.vo;

public class indexListVO {
	
	private int currentPage, totalPage;
	private String url, pageView,keyword;
	
	public indexListVO() {
		super();
	}

	public indexListVO(int currentPage, int totalPage, String url, String pageView, String keyword) {
		super();
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.url = url;
		this.pageView = pageView;
		this.keyword = keyword;
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

	public String getPageView() {
		return pageView;
	}

	public void setPageView(String pageView) {
		this.pageView = pageView;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

		
}
