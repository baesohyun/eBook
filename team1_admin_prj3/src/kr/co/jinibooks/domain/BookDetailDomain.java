package kr.co.jinibooks.domain;

public class BookDetailDomain {
	//책 상세보기 에서 가져올 컬럼들
	
	private String img, category_code, title, author, translator, company, sale_class, sale_state, intro, 	review,	author_intro, 	book_index	;	
	private int sale_price, rental_price;
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getAuthor_intro() {
		return author_intro;
	}
	public void setAuthor_intro(String author_intro) {
		this.author_intro = author_intro;
	}
	public String getBook_index() {
		return book_index;
	}
	public void setBook_index(String book_index) {
		this.book_index = book_index;
	}
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
	
	
	


}
