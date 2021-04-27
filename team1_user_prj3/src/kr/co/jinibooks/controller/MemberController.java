package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.jinibooks.service.MemberService;
import kr.co.jinibooks.vo.IDandEmailandTempPWVO;
import kr.co.jinibooks.vo.JoinVO;
import kr.co.jinibooks.vo.LoginVO;

@SessionAttributes("user_id")
@Controller
@Component
public class MemberController {

	@Autowired(required = false)
	private MemberService memberService;
	
	@RequestMapping(value="member/join.do",method=GET)
	public String userJoin(Model model) {
		
		return "member/join";
	}//termsOfUse
	
	@RequestMapping(value="member/id_chk.do",method=POST)
	@ResponseBody
	public String idChk(String inputID) {
		//System.out.println(inputID);
		
		//서비스를 사용하여 업무처리 결과를 받는다
		JSONObject json = memberService.searchIDOverlap(inputID);
		//System.out.println(json);
		
		return json.toJSONString();
	}//idChk
	
	@RequestMapping(value="member/email_chk.do",method=POST)
	@ResponseBody
	public String emailChk(String inputEmail) {
		//System.out.println(inputEmail);
		
		//서비스를 사용하여 업무처리 결과를 받는다
		JSONObject json = memberService.searchEmailOverlap(inputEmail);
		//System.out.println(json);
		
		return json.toJSONString();
	}//idChk
	
	@RequestMapping(value="member/id_and_email_chk.do",method=POST)
	@ResponseBody
	public String idAndEmailChk(IDandEmailandTempPWVO idAndEmailAndTempPWVO) {
		System.out.println(idAndEmailAndTempPWVO);
		
		//서비스를 사용하여 업무처리 결과를 받는다
		JSONObject json = memberService.searchIDEMail(idAndEmailAndTempPWVO);
		//System.out.println(json);
		
		return json.toJSONString();
	}//idAndEmailChk
	
	@RequestMapping(value="member/terms_of_use.do",method=GET)
	public String termsOfUse(Model model) {
		
		return "member/terms_of_use";
	}//termsOfUse

	@RequestMapping(value="member/privacy.do",method=GET)
	public String privacy(Model model) {
		
		return "member/privacy";
	}//privacy
	
	@RequestMapping(value="member/join_process.do",method=POST)
	@ResponseBody
	public String joinProcess(JoinVO jVO,  Model model) {
		
		System.out.println(jVO);
		
		JSONObject json = memberService.addJoin(jVO);
		
		return json.toJSONString();
	}//joinProcess
	
	@RequestMapping(value="member/modify_process.do",method=POST)
	@ResponseBody
	public String modifyProcess(JoinVO jVO,  Model model) {
		
		System.out.println(jVO);
		
		JSONObject json = memberService.addJoin(jVO);
		
		return json.toJSONString();
	}//modifyProcess

	@RequestMapping(value="member/join_success.do",method=GET)
	public void joinSuccess() {
		
	}//joinSuccess

	@RequestMapping(value="member/login.do",method=GET)
	public String login(Model model) {
		
		return "member/login";
	}//login
	
	@RequestMapping(value="member/login_process.do",method=POST)
	@ResponseBody
	public String loginProcess(LoginVO lVO, Model model) {
		
		//System.out.println(lVO);
		
		JSONObject json = memberService.searchIDPW(lVO);
		
		//id와 pw가 유효하면 session에 id를 넣어 줍니다.
		if((boolean)json.get("result_flag")) {
			model.addAttribute("user_id", lVO.getInputID());
		}//end if
		
		//member 테이블에 로그인 데이터를 update 합니다.
		memberService.modifyLoginDate(lVO.getInputID());
		
		return json.toJSONString();
	}//loginProcess
	
	@RequestMapping(value="member/id_search.do",method=GET)
	public void idSearch() {
		
	}//idSearch

	@RequestMapping(value="member/id_search_process.do",method=POST)
	@ResponseBody
	public String idSearchProcess(String inputEmail) {
		//System.out.println(inputEmail);
		
		//서비스를 사용하여 업무처리 결과를 받는다
		JSONObject json = memberService.searchIDWithEmail(inputEmail);
		//System.out.println(json);
		
		return json.toJSONString();
	}//idSearchProcess

	@RequestMapping(value="member/id_search_success.do",method=POST)
	public void idSearchSuccess(String outputID, String inputEmail, Model model) {
		//System.out.println(outputID);
		
		//사용자의 이메일에 아이디를 보내 줍니다.
		memberService.sendIDMail(outputID, inputEmail);

		//아이디를 숨기고 model에 넣어 줍니다.
		int length = outputID.length();
		String coveredID = outputID.substring(0, 2);
		for (int i = 0; i < length-2; i++) {
			coveredID = coveredID.concat("*");
		}//end for
		
		model.addAttribute("coveredID", coveredID);
		
	}//idSearchSuccess
	
	@RequestMapping(value="member/pw_search.do",method=GET)
	public void pwSearch() {
		
	}//pwSearch
	
	@RequestMapping(value="member/pw_search_process.do",method=POST)
	@ResponseBody
	public String pwSearchProcess(IDandEmailandTempPWVO idAndEmailAndTempPWVO) {
		//System.out.println(idAndEmailAndTempPWVO);
		
		//서비스를 사용하여 업무처리 결과를 받는다
		JSONObject json = memberService.modifyPW(idAndEmailAndTempPWVO);
		//System.out.println(json);
		
		return json.toJSONString();
	}//pwSearchProcess

	@RequestMapping(value="member/pw_search_success.do",method=POST)
	public void pwSearchSuccess(String inputEmail, Model model) {
		
		model.addAttribute("inputEmail", inputEmail);
		
	}//pwSearchSuccess
	
	@RequestMapping(value="member/logout_process.do",method=POST)
	@ResponseBody
	public String loginoutProcess(HttpServletRequest request, SessionStatus ss) {
		
		String header = request.getHeader("REFERER");
//		System.out.println(header);
		
		int idx = header.indexOf("team1_user_prj3");
//		System.out.println(idx);
		
		int idx2 = idx +"team1_user_prj3".length();
//		System.out.println(header.substring(idx2));
		
		JSONObject json = new JSONObject();
		boolean flag = false;
		ss.setComplete();
		json.put("flag", !flag);
		json.put("target", header.substring(idx2));
		
		//return "redirect:"+header.substring(idx2);
		return json.toJSONString();
	}//loginoutProcess

}//class
