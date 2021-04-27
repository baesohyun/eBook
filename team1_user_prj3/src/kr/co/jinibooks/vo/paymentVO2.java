package kr.co.jinibooks.vo;

public class paymentVO2 {
	
	private int useCash,usePoint;
	private String id, payMethod,payDay, bookCode;
	private String buyClass;
	
	
	public paymentVO2(int useCash, int usePoint, String id, String payMethod, String payDay, String bookCode,
			String buyClass) {
		super();
		this.useCash = useCash;
		this.usePoint = usePoint;
		this.id = id;
		this.payMethod = payMethod;
		this.payDay = payDay;
		this.bookCode = bookCode;
		this.buyClass = buyClass;
	}


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


	public String getBookCode() {
		return bookCode;
	}


	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}


	public String getBuyClass() {
		return buyClass;
	}


	public void setBuyClass(String buyClass) {
		this.buyClass = buyClass;
	}


	@Override
	public String toString() {
		return "paymentVO2 [useCash=" + useCash + ", usePoint=" + usePoint + ", id=" + id + ", payMethod=" + payMethod
				+ ", payDay=" + payDay + ", bookCode=" + bookCode + ", buyClass=" + buyClass + "]";
	}

	

	
	
	
	
	


	

	
	

}
