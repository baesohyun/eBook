package kr.co.jinibooks.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.SQLException;

import org.json.simple.JSONObject;

import kr.co.jinibooks.dao.LoginDAO;
import kr.co.jinibooks.vo.LoginVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class LoginService {

	public JSONObject chkLogin(LoginVO lVO) {

		LoginDAO lDAO = LoginDAO.getInstance();
		boolean flag = false;
		JSONObject json = null;

		try {
			
			String inputPass = lVO.getPasswd() ;
			DataEncrypt temp = new DataEncrypt("1111111111111111") ;
				lVO.setPasswd(temp.encryption(inputPass) );
			
			flag = lDAO.selectAdmin(lVO);

			json = new JSONObject();

			// 찾아낸 데이터로 JSONObject 생성
			json.put("result", flag);

		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		return json;
	} // chkLogin

} // class
