package kr.co.jinibooks.vo;

import java.util.Arrays;

public class paymentVO {
	
	private int useCash,usePoint;
	private String id, payMethod,payDay;
	private String[] bookCode, buyClass;
	public int getUseCash() {
		return useCash;
	}
	public void setUseCash(int useCash) {
		this.useCash = useCash;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayDay() {
		return payDay;
	}
	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}
	public String[] getBookCode() {
		return bookCode;
	}
	public void setBookCode(String[] bookCode) {
		this.bookCode = bookCode;
	}
	public String[] getBuyClass() {
		return buyClass;
	}
	public void setBuyClass(String[] buyClass) {
		this.buyClass = buyClass;
	}
	@Override
	public String toString() {
		return "paymentVO [useCash=" + useCash + ", usePoint=" + usePoint + ", id=" + id + ", payMethod=" + payMethod
				+ ", payDay=" + payDay + ", bookCode=" + Arrays.toString(bookCode) + ", buyClass="
				+ Arrays.toString(buyClass) + "]";
	}
	
	
	
	


	

	
	

}
