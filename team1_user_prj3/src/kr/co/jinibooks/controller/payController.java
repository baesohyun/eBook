package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jinibooks.service.PayService;
import kr.co.jinibooks.vo.CartPayVO;
import kr.co.jinibooks.vo.CashPointVO;
import kr.co.jinibooks.vo.PayedCartDeleteVO;
import kr.co.jinibooks.vo.paymentVO;

@Controller
public class payController {
	String cartVal="";
	
	// 결제 창 이동
	@RequestMapping(value = "book_pay.do", method = { GET, POST })
	public String payBookForm(String cartValue, String id, CartPayVO cartData, Model model) {
		PayService ps = new PayService();
		cartVal=cartValue;
		System.out.println(cartData+"controller");
		//결제창으로 도서를 띄우기
		 model.addAttribute("payBook", ps.searchPayBook(cartData));
		 System.out.println("------"+cartData);
		//넘어온 결제창의 도서들을 총 금액설정
		 model.addAttribute("total", ps.totalPrice(cartData));
		 //사용자의 보유 캐시와 보유 포인트 조회
		 model.addAttribute("cashPoint", ps.selectCashPoint(id));


		return "book_pay";
	}// payBookForm

	// 결제 -> 결제 완료
	@RequestMapping(value = "book_paySuccess.do", method = POST)
	public String payBookProcess(CashPointVO cpvo, paymentVO pv, PayedCartDeleteVO pcdvo) {
		PayService ps = new PayService();
		System.out.println(pv);
		// 결제 (구매,대여) 테이블에 추가
		ps.addPay(pv);
		// 사용된 캐시와 포인트를 회원 테이블에 수정
		ps.modifyCashPoint(cpvo);
		
		if(cartVal!=null) {
			// 장바구니에 있던 도서가 결제되면 장바구니 테이블에 삭제
			ps.deletePayedCart(pcdvo);
		}//end if
	
		
		return "book_paySuccess";
	}// class

}// class
