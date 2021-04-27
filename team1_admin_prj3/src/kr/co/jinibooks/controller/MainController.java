package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jinibooks.domain.MainNoticeListDomain;
import kr.co.jinibooks.service.LoginService;
import kr.co.jinibooks.service.selectService;
import kr.co.jinibooks.vo.LoginVO;

@Controller
public class MainController {

	@RequestMapping(value = "admin_login.do", method = GET)
	public String loginPage(Model model) {

		return "admin_login";
	}// mainPage

	/**
	 * �Է¹��� id, passwd ����
	 * 
	 * @param lVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "admin_login_process.do", method = POST)
	@ResponseBody
	public String loginProcess(LoginVO lVO, Model model) {

		LoginService ls = new LoginService();
		JSONObject json = ls.chkLogin(lVO);

		return json.toJSONString();
	}// mainPage

	
	/**
	 * �α��� �������� �� id�� pass������
	 * 
	 * @param lVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "admin_main.do", method = POST)
	public String adminMain(LoginVO lVO, Model model) {

		selectService ss=new selectService();
		List<MainNoticeListDomain> selectMainNoticeList = ss.selectMainNoticeList();
		
		
		// session�� �ֱ� ���� annotation �޾��ֱ�
		 model.addAttribute("adminId", lVO.getId()) ;

		 // ���ο� �ߴ� ����
		 model.addAttribute("selectCnt", ss.selectCnt()) ;
		 model.addAttribute("selectJoinCnt", ss.selectJoinCnt()) ;
		 model.addAttribute("selectAllCnt", ss.selectAllCnt()) ;
		 model.addAttribute("selectQNA", ss.selectQNA()) ;
		 model.addAttribute("selectOrderCnt", ss.selectOrderCnt()) ;
		 model.addAttribute("selectOrderPrice", ss.selectOrderPrice()) ;
		 model.addAttribute("selectMainNoticeList", ss.selectMainNoticeList()) ;
		 
		return "admin_main";
	} // loginProcess


}// class
