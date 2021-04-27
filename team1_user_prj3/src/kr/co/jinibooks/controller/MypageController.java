package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jinibooks.domain.BookDomain;
import kr.co.jinibooks.domain.MypagePayhistoryDomain;
import kr.co.jinibooks.domain.SearchMPMyBookPayDomain;
import kr.co.jinibooks.domain.SearchMPMyBookRentalDomain;
import kr.co.jinibooks.service.MemberService;
import kr.co.jinibooks.service.MyPageMyBookService;
import kr.co.jinibooks.service.MypagePayHistoryService;
import kr.co.jinibooks.service.MypageService;
import kr.co.jinibooks.vo.LoginVO;
import kr.co.jinibooks.vo.pageVO;

@Controller
@Component
public class MypageController {
	
	@Autowired(required = false)
	private MemberService memberService;
	
	/**
	 * 로그인 여부 확인
	 * @return
	 */
	private String ChkLoginSession(HttpSession session) {
		String destination = null;
		
		if((String)session.getAttribute("user_id") == null) {
			destination = "redirect:/member/login.do";
		}//end if
		return destination;
	}//ChkLoginSession
	
	@RequestMapping(value="member/mypage/main.do",method=GET)
	public String main(HttpSession session, Model model) {
		String destination = ChkLoginSession(session);
		if(destination == null) {
			MypageService ms = new MypageService();
			List<BookDomain> list = ms.searchPayBookList_5("user1");
			
			model.addAttribute("payBookList_5", list);
			System.out.println(list);
			
			destination = "member/mypage/main";
		}//end if
		return destination;
	}//main
	
	//////////////////////////////////////////////////////////
	@RequestMapping(value="member/mypage/pay_book.do",method=GET)
	public String MyBookList(HttpSession session, Model model, String id) {
	String destination = ChkLoginSession(session);
	if(destination == null) {
	MyPageMyBookService mbs= new MyPageMyBookService();
	List<SearchMPMyBookRentalDomain> rentalList =mbs.selectRentalBook(id);
	List<SearchMPMyBookPayDomain> payList =mbs.selectPayBook(id);
	MypageService ms = new MypageService();
	List<BookDomain> list = ms.searchPayBookList_All("user1");
	
	model.addAttribute("selectRantal", rentalList);
	model.addAttribute("selectPay", payList);
	
	model.addAttribute("payBookList_All", list);
	destination = "member/mypage/payBook";
	}//end if
	return destination;
	}//MyBookList

	@RequestMapping(value="member/mypage/recommend.do",method=GET)
	public String recommend(HttpSession session, Model model) {
		String destination = ChkLoginSession(session);
		if(destination == null) {
		
			destination = "member/mypage/recommend";
		}//end if
		return destination;
	}//recommend

	@RequestMapping(value="member/mypage/pay_history.do",method=GET)
	public String payHistory(String id, pageVO pvo, @RequestParam(required = false, defaultValue = "1")String current_page, 
			HttpSession session, Model model) {
		
		//pvo.setCurrentPage(Integer.parseInt(current_page));
		
		String destination = ChkLoginSession(session);
		if(destination == null) {
			MypagePayHistoryService pphs=new MypagePayHistoryService();
			
			//int totalCount=pphs.totalCount(id);
			//int pageScale = pphs.pageScale();
			//int totalPage = pphs.totalPage(pageScale, totalCount);
			//int startNum = pphs.startNum(pageScale, pvo.getCurrentPage());
			//int endNum = pphs.endNum(pageScale, startNum);
			
			//pvo.setStartNum(startNum);
			//pvo.setEndNum(endNum);
			
			List<MypagePayhistoryDomain> list = pphs.searchpayHistory(id);
			
			//PayhistoryIndexListVO pilVO=new PayhistoryIndexListVO(pvo.getCurrentPage(),totalPage,"member/mypage/pay_history.do");
			//String indexList=pphs.indexList(pilVO, pvo);
			
			model.addAttribute("payhistoryData", list);
			//model.addAttribute("indexList", indexList); //인덱스 리스트
		
			destination = "member/mypage/payHistory";
		}//end if
		return destination;
	}//payHistory

	@RequestMapping(value="member/mypage/charge_cash.do",method=GET)
	public String chargeCash(HttpSession session, Model model) {
		String destination = ChkLoginSession(session);
		if(destination == null) {
		
			destination = "member/mypage/charge_cash";
		}//end if
		return destination;
	}//chargeCash

	@RequestMapping(value="member/mypage/info.do",method= {GET,POST})
	public String info(@RequestParam(required = false, defaultValue = "")String inputPW, HttpSession session, Model model) {
		String destination = ChkLoginSession(session);
		if(destination == null) {
			
			//세션 id와 입력 받은 pw로 회원 조회하여 flag에 넣는다.
			String loginID = (String)session.getAttribute("user_id");
			
			JSONObject json = memberService.searchIDPW(new LoginVO(loginID, inputPW));
			boolean result_flag = (boolean)json.get("result_flag");
			
			model.addAttribute("result_flag", result_flag);
			model.addAttribute("memberInfo", memberService.searchMemberInfo(loginID));
			
			destination = "member/mypage/info";
		}//end if
		return destination;
	}//info
	
}
