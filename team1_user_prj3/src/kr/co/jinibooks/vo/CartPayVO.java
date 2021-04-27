package kr.co.jinibooks.vo;

import java.util.Arrays;

public class CartPayVO {
	private String[] code,buy;

	public String[] getCode() {
		return code;
	}

	public void setCode(String[] code) {
		this.code = code;
	}

	public String[] getBuy() {
		return buy;
	}

	public void setBuy(String[] buy) {
		this.buy = buy;
	}

	@Override
	public String toString() {
		return "CartPayVO [code=" + Arrays.toString(code) + ", buy=" + Arrays.toString(buy) + "]";
	}

	
	
}
