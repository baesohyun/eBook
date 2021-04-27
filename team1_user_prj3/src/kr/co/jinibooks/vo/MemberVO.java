package kr.co.jinibooks.vo;

public class MemberVO {
	
	private String inputID, inputPW, inputEmail, inputName, gender;
	private int  inputBirthYear;
	
	public String getInputID() {
		return inputID;
	}
	public void setInputID(String inputID) {
		this.inputID = inputID;
	}
	public String getInputPW() {
		return inputPW;
	}
	public void setInputPW(String inputPW) {
		this.inputPW = inputPW;
	}
	public String getInputEmail() {
		return inputEmail;
	}
	public void setInputEmail(String inputEmail) {
		this.inputEmail = inputEmail;
	}
	public String getInputName() {
		return inputName;
	}
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getInputBirthYear() {
		return inputBirthYear;
	}
	public void setInputBirthYear(int inputBirthYear) {
		this.inputBirthYear = inputBirthYear;
	}

	@Override
	public String toString() {
		return "JoinVO [inputID=" + inputID + ", inputPW=" + inputPW + ", inputEmail=" + inputEmail + ", inputName="
				+ inputName + ", gender=" + gender + ", inputBirthYear=" + inputBirthYear + "]";
	}

}
