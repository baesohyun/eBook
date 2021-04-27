package kr.co.jinibooks.domain;

// E-book 리스트 조회 후 결과 컬럼명
public class BookListDomain {

	private int sale_price, rental_price;
	private String book_code,  sale_class, category_code,title, author, input_date,  sale_state;
	
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getRental_price() {
		return rental_price;
	}
	public void setRental_price(int rental_price) {
		this.rental_price = rental_price;
	}
	public String getBook_code() {
		return book_code;
	}
	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}
	public String getSale_class() {
		return sale_class;
	}
	public void setSale_class(String sale_class) {
		this.sale_class = sale_class;
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
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getSale_state() {
		return sale_state;
	}
	public void setSale_state(String sale_state) {
		this.sale_state = sale_state;
	}
	
	@Override
	public String toString() {
		return "BookListDomain [sale_price=" + sale_price + ", rental_price=" + rental_price + ", book_code="
				+ book_code + ", sale_class=" + sale_class + ", category_code=" + category_code + ", title=" + title
				+ ", author=" + author + ", input_date=" + input_date + ", sale_state=" + sale_state + "]";
	}
	
}
