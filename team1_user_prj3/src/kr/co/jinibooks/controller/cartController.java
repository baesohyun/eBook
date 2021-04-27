package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jinibooks.domain.SearchCartListDomain;
import kr.co.jinibooks.service.SearchCartService;
import kr.co.jinibooks.vo.CartDeleteVO;
import kr.co.jinibooks.vo.CartInsertVO;
import kr.co.jinibooks.vo.SearchIdVO;

@Controller
public class cartController {
	
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
	
	//장바구니 이동
	@RequestMapping(value = "book_cartList.do", method = GET)
	public String bookCartProcess(HttpSession session, Model model, SearchIdVO siVO) {  //
		String destination = ChkLoginSession(session);
		if(destination == null) {
			SearchCartService scs= new SearchCartService();
			List<SearchCartListDomain> cartList=scs.selectCartList(siVO);
			model.addAttribute("cartList", cartList);
		    destination = "book_cart";
	    }//end if
	    return destination;
	}//bookCartProcess
	
	//장바구니  추가
	@RequestMapping(value="add_cart.do", method = GET)
	@ResponseBody
	public String addCartProcess(CartInsertVO  ciVO) {//CartInsertVO ciVO

		SearchCartService scs=new SearchCartService();
		JSONObject json=scs.addCart(ciVO);
	
		return json.toJSONString();
	}//bookCartProcess
	
	//장바구니  삭제
	@RequestMapping(value="remove_cart.do", method = POST)
	@ResponseBody
	public String removeCartProcess(CartDeleteVO cdVO) {
		
		System.out.println(cdVO);
		
		SearchCartService scs=new SearchCartService();
		JSONObject json=scs.removeCart(cdVO);
		
		return json.toJSONString();
	}//removeCartProcess

}//class
