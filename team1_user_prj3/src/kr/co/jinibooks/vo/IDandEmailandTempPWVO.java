package kr.co.jinibooks.vo;

public class IDandEmailandTempPWVO {
	
	private String inputID, inputEmail, tempPW;

	public String getInputID() {
		return inputID;
	}

	public void setInputID(String inputID) {
		this.inputID = inputID;
	}

	public String getInputEmail() {
		return inputEmail;
	}

	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}

	public String getTempPW() {
		return tempPW;
	}

	public void setTempPW(String tempPW) {
		this.tempPW = tempPW;
	}

	@Override
	public String toString() {
		return "IDandEmailandTempPWVO [inputID=" + inputID + ", inputEmail=" + inputEmail + ", tempPW=" + tempPW + "]";
	}
	
}
