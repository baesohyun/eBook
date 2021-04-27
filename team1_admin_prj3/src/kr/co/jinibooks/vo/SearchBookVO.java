package kr.co.jinibooks.vo;

/**
 * 게시물리스트와 Ebook검색조건에 들어가는 값
 * @author KANG
 */
public class SearchBookVO {

	//p.code, p.id, b.title, p.use_cash, p.use_point, b.sale_price-(p.use_cash+p.use_point) total_price, p.pay_method, p.pay_date
	private String field, keyword, category_code, title,	author, sale_class, sale_state, input_date; 
	private int currentPage, startNum, endNum, sale_price;
	
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
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSale_class() {
		return sale_class;
	}
	public void setSale_class(String sale_class) {
		this.sale_class = sale_class;
	}
	public String getSale_state() {
		return sale_state;
	}
	public void setSale_state(String sale_state) {
		this.sale_state = sale_state;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
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
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	@Override
	public String toString() {
		return "SearchVO [field=" + field + ", keyword=" + keyword + ", category_code=" + category_code + ", title="
				+ title + ", author=" + author + ", sale_class=" + sale_class + ", sale_state=" + sale_state
				+ ", input_date=" + input_date + ", currentPage=" + currentPage + ", startNum=" + startNum + ", endNum="
				+ endNum + ", sale_price=" + sale_price + "]";
	}

	
	


	
	
	
	
}
