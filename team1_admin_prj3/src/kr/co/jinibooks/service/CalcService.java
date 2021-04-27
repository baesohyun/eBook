package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.CalcDAO;
import kr.co.jinibooks.domain.PurchaseListDomain;


public class CalcService {
	
	public List<PurchaseListDomain> searchAllPurchase() {
		List<PurchaseListDomain> list=null;
		
		CalcDAO cDao=CalcDAO.getInstance();
		try {
			list=cDao.selectAllPurchase();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllPurchase

}//class
