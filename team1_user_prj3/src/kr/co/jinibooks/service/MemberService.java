package kr.co.jinibooks.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.jinibooks.dao.MemberDAO;
import kr.co.jinibooks.domain.MemberInfoDomain;
import kr.co.jinibooks.vo.IDandEmailandTempPWVO;
import kr.co.jinibooks.vo.JoinVO;
import kr.co.jinibooks.vo.LoginVO;
import kr.co.sist.util.cipher.DataEncrypt;

@Component
public class MemberService {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired(required = false)
	private MemberDAO mDAO;
	
	public JSONObject searchIDOverlap(String inputID) {
		JSONObject json = new JSONObject();
		
		boolean result_flag;
		try {
			result_flag = mDAO.selectIDOverlap(inputID);
			
			// 찾아낸 데이터로 JSONObject 생성
			json.put("result_flag", result_flag);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return json;
	}//searchIDOverlap
	
	public JSONObject searchEmailOverlap(String inputEmail) {
		JSONObject json = new JSONObject();
		
		boolean result_flag;
		try {
			result_flag = mDAO.selectEmailOverlap(inputEmail);
			
			// 찾아낸 데이터로 JSONObject 생성
			json.put("result_flag", result_flag);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return json;
	}//searchEmailOverlap
	
	public JSONObject addJoin(JoinVO jVO){
		JSONObject json = new JSONObject();
		boolean flag = false;
		
		try {
			//JoinVO의 비밀번호 암호화
			String key ="1111111111111111";
			DataEncrypt de = new DataEncrypt(key);
			
			String encryptPW = de.encryption(jVO.getInputPW());
			jVO.setInputPW(encryptPW);
		
			// JoinVO의 성별 null 값 처리
			if (jVO.getGender() == null) {
				jVO.setGender("-");
				;
			}//end if
		
		    //DAO를 사용하여 
			//쿼리문을 수행하고 결과를 얻는다.
			int cnt = mDAO.insertJoin(jVO);
			if(cnt == 1) {
				flag = true;
			}//end if
		} catch (UnsupportedEncodingException uee) {
			uee.printStackTrace();
		} catch (NoSuchAlgorithmException nsae) {
			nsae.printStackTrace();
		} catch (GeneralSecurityException gse) {
			gse.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		json.put("joinFlag", flag);
		
		return json;
	}//addCpEmp
	
	public JSONObject searchIDPW(LoginVO lVO) {
		System.out.println("서비스에서 lVO 확인: "+ lVO);
		JSONObject json = new JSONObject();
		
		String result_name;
		try {
			//비밀번호 암호화
			String key ="1111111111111111";
			DataEncrypt de = new DataEncrypt(key);
			
			String encryptPW = de.encryption(lVO.getInputPW());
			lVO.setInputPW(encryptPW);

			System.out.println(lVO);
			result_name = mDAO.selectIDPW(lVO);
			//System.out.println(result_name);
			
			// 찾아낸 데이터로 JSONObject 생성
			json.put("result_flag", result_name != null ? true : false);
		} catch (NoSuchAlgorithmException nsae) {
			nsae.printStackTrace();
		} catch (UnsupportedEncodingException uee) {
			uee.printStackTrace();
		} catch (GeneralSecurityException gse) {
			gse.printStackTrace();	
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return json;
	}//searchIDPW
	
	public JSONObject searchIDEMail(IDandEmailandTempPWVO idAndEmailVO) {
		JSONObject json = new JSONObject();
		
		String result_name;
		try {
			result_name = mDAO.selectIDEmail(idAndEmailVO);
			//System.out.println(result_name);
			
			// 찾아낸 데이터로 JSONObject 생성
			json.put("result_flag", result_name != null ? true : false);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return json;
	}//searchIDEMail
	
	public JSONObject searchIDWithEmail(String inputEmail) {
		JSONObject json = new JSONObject();
		
		String outputID;
		try {
			outputID = mDAO.selectIDWithEmail(inputEmail);
			//System.out.println("서비스: "+outputID);
			
			// 찾아낸 데이터로 JSONObject 생성
			json.put("outputID", outputID);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return json;
	}//searchIDWithEmail
	
	public JSONObject modifyPW(IDandEmailandTempPWVO idAndEmailAndTempPWVO) {
		JSONObject json = new JSONObject();
		
		//비밀번호를 새로 만들고(8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.)
		String tempPW = getRamdomPassword(8);
		//System.out.println("tempPW: "+tempPW);
		
		//암호화 하여 DB에 기록하고
		String encryptPW = "";
		try {
			String key ="1111111111111111";
			DataEncrypt de = new DataEncrypt(key);
			encryptPW = de.encryption(tempPW);
			//System.out.println("encryptPW: "+encryptPW);

			idAndEmailAndTempPWVO.setTempPW(encryptPW);
			
			boolean flag = (mDAO.updateTempPW(idAndEmailAndTempPWVO)==1);
			json.put("flag", flag);
			
		} catch (UnsupportedEncodingException uee) {
			uee.printStackTrace();
		} catch (NoSuchAlgorithmException nsae) {
			nsae.printStackTrace();
		} catch (GeneralSecurityException gse) {
			gse.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch

		//이메일로 보내고
		sendPWMail(idAndEmailAndTempPWVO.getInputEmail(),idAndEmailAndTempPWVO.getInputID(),tempPW);
		
		//결과를 알려 줍니다.
		return json;
	}//modifyPW
	
	private String getRamdomPassword(int len) { 
		//char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		String abc = "abcdefghijklmnopqrstuvwxyz";
		String ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String special = "`~!@#$%^&*()-=_+{}[];:'\'<>,./?|\\";
		String total = abc.concat(ABC).concat(special);
		
		int idx = 0; 
		StringBuilder sb = new StringBuilder(); 
		//System.out.println("charSet.length :::: "+charSet.length); 
		for (int i = 0; i < len; i++) { 
			idx = (int) (total.length() * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			//System.out.println("idx :::: "+idx); 
			sb.append(total.charAt(idx)); 
		}//end for
		return sb.toString(); 
	}//getRamdomPassword
	//출처: https://mkil.tistory.com/331 [나비와꽃기린]
	
	public void sendIDMail(String outputID, String inputEmail) {
		//System.out.println("메일 보내기 시작");
		
		String setfrom = "jinibooks1212@gmail.com"; // 보내는 사람 이메일
		String tomail = inputEmail; // 받는 사람 이메일
		String title = "지니북스 - 고객님의 아이디를 알려드립니다."; // 제목
		StringBuilder content = new StringBuilder();
		content
		.append("회원님, 안녕하세요!\r\n") 
		.append("아이디를 잊으셨나요?\r\n") 
		.append("회원님의 아이디를 안내해드립니다.\r\n") 
		.append("\r\n") 
		.append(outputID+"\r\n") 
		.append("\r\n") 
		.append("항상 지니북스를 사랑해주시는 고객님께 감사드리며,\r\n") 
		.append("보다 나은 지니북스가 되기 위해 최선을 다하겠습니다.\r\n") 
		.append("\r\n") 
		.append("지니북스 드림 ^^"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content.toString()); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e);
			//System.out.println("메일 보내기 에러");
		}//end catch
		
		//System.out.println("메일 보내기 끝");
	}//sendIDMail
	
	public void sendPWMail(String inputEmail, String inputID, String tempPW) {
		//System.out.println("메일 보내기 시작");
		
		String setfrom = "jinibooks1212@gmail.com"; // 보내는 사람 이메일
		String tomail = inputEmail; // 받는 사람 이메일
		String title = "리디북스 - "+inputID+" 님의 새 비밀번호 설정을 안내해드립니다."; // 제목
		StringBuilder content = new StringBuilder();
		content
		.append("회원님, 안녕하세요!\r\n") 
		.append("회원님의 임시 비밀번호를 안내해드립니다.\r\n") 
		.append("\r\n") 
		.append(tempPW+"\r\n") 
		.append("\r\n") 
		.append("항상 지니북스를 사랑해주시는 고객님께 감사드리며,\r\n") 
		.append("보다 나은 지니북스가 되기 위해 최선을 다하겠습니다.\r\n") 
		.append("\r\n") 
		.append("지니북스 드림 ^^"); // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content.toString()); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e);
			//System.out.println("메일 보내기 에러");
		}//end catch
		
		//System.out.println("메일 보내기 끝");
	}//sendPWMail
	
	public MemberInfoDomain searchMemberInfo(String id) {
		MemberInfoDomain mid = null;
		
		try {
			mid = mDAO.selectMemberInfo(id);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
				
		return mid;		
	}//searchMemberInfo
	
	public void modifyLoginDate(String id){
		//boolean flag = false;
		
		try {
		    //DAO를 사용하여 
			//쿼리문을 수행하고 결과를 얻는다.
			int cnt = mDAO.updateLoginDate(id);
			if(cnt == 1) {
				//flag = true;
			}//end if
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		//return flag;
	}//modifyLoginDate

}
