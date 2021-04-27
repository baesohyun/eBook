package kr.co.jinibooks.domain;

/**
 * 구매내역 리스트에 띄워주는 값
 * @author owner
 */
public class RentalListDomain {
	
	private int use_cash, use_point, total_price;
	private String code, id, title, pay_method, pay_date, rental_start, rental_end;
	
	public int getUse_cash() {
		return use_cash;
	}
	public void setUse_cash(int use_cash) {
		this.use_cash = use_cash;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getRental_start() {
		return rental_start;
	}
	public void setRental_start(String rental_start) {
		this.rental_start = rental_start;
	}
	public String getRental_end() {
		return rental_end;
	}
	public void setRental_end(String rental_end) {
		this.rental_end = rental_end;
	}
	@Override
	public String toString() {
		return "rentalListDomain [use_cash=" + use_cash + ", use_point=" + use_point + ", total_price=" + total_price
				+ ", code=" + code + ", id=" + id + ", title=" + title + ", pay_method=" + pay_method + ", pay_date="
				+ pay_date + ", rental_start=" + rental_start + ", rental_end=" + rental_end + "]";
	}
	
	
}
