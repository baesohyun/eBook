package kr.co.jinibooks.vo;

import java.util.Arrays;

public class CartDeleteVO {
	private String id;
	private String[] cartCode;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String[] getCartCode() {
		return cartCode;
	}
	public void setCartCode(String[] cartCode) {
		this.cartCode = cartCode;
	}

	

}
