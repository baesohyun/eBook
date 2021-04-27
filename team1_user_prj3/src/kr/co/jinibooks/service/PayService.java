package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.PayDAO;
import kr.co.jinibooks.domain.CashPointDomain;
import kr.co.jinibooks.domain.SelectPayDomain;
import kr.co.jinibooks.vo.CartPayVO;
import kr.co.jinibooks.vo.CashPointVO;
import kr.co.jinibooks.vo.PayedCartDeleteVO;
import kr.co.jinibooks.vo.paymentVO;

public class PayService {
	
	/**
	 * 결제할 도서들을 결제창에 조회
	 * @param code
	 * @param buy
	 * @return
	 */
	public List<SelectPayDomain> searchPayBook(CartPayVO cartData){
		List<SelectPayDomain> payBookList=null;
		PayDAO pDao=PayDAO.getInstance();
		try {
			System.out.println(cartData+"service");
			payBookList=pDao.selectPayBook(cartData);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return payBookList;
	}//searchPayBook
	
	//결제창의 도서 총금액 설정
	public int totalPrice(CartPayVO cartData) {
		List<SelectPayDomain> payList=null;
		
		PayDAO pDao=PayDAO.getInstance();
		int total=0;

		try {
			payList=pDao.selectPayBook(cartData);
			
			for(int i=0; i<payList.size();i++) {
				total+=payList.get(i).getPrice();
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		 
		 return total;
	}//totalPrice
	
	/**
	 * 사용자의 캐시와 포인트 조회
	 * @param id
	 * @return
	 */
	public CashPointDomain selectCashPoint(String id) {
		CashPointDomain cpd=null;
		
		PayDAO pDao=PayDAO.getInstance();
		try {
			cpd=pDao.selectCashPoint(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return cpd;
	}//selectCashPoint
	
	/**
	 * 결제되었을 때 DB 테이블에 추가
	 * @param pv
	 */
	public void addPay(paymentVO pv) {
		
		PayDAO pDao=PayDAO.getInstance();
		
		try {
			pDao.insertPay(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
	}//addPay
	
	/**
	 * 결제 후, 사용된 캐시와 포인트 수정
	 * @param cpvo
	 */
	public void modifyCashPoint(CashPointVO cpvo) {
		
		PayDAO pDao=PayDAO.getInstance();
		
		try {
			pDao.updateCashPoint(cpvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//modifyCashPoint
	
	public void deletePayedCart(PayedCartDeleteVO pcdvo) {
		
		PayDAO pDao=PayDAO.getInstance();
		
		try {
			pDao.deletePayedCart(pcdvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//deletePayedCart

}//class
