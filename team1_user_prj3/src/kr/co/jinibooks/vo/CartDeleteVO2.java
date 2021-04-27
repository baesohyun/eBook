package kr.co.jinibooks.vo;

public class CartDeleteVO2 {
	private String id;
	private String cartCode;
	public CartDeleteVO2(String id, String cartCode) {
		super();
		this.id = id;
		this.cartCode = cartCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCartCode() {
		return cartCode;
	}
	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}

	
	
}
