package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.CalcDAO;
import kr.co.jinibooks.dao.UseMyBatisCalc;
import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;
import kr.co.jinibooks.vo.SearchCalcVO;

public class CalcMainService {
	
		public List<PurchaseListDomain> selectPurchase() {
			List<PurchaseListDomain> list=null;
			//DAO단의 클래스를 생성하여 DB의 정보를 받는다.
			UseMyBatisCalc umc=new UseMyBatisCalc();
			list=umc.mybatisPurchase();
			
			return list;
		}//selectPurchase
		
		public List<PurchaseListDomain> searchPurchaseCondition(SearchCalcVO scVO) {  //검색조건에 따른 구매내역 조회
			List<PurchaseListDomain> list=null;
			
			CalcDAO cDao=CalcDAO.getInstance();
			
			try {
				list=cDao.selectAllPurchase();
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return list;
		}//searchPurchaseCondition 
		
		public List<RentalListDomain> selectRental() {
			List<RentalListDomain> list=null;
			//DAO단의 클래스를 생성하여 DB의 정보를 받는다.
			UseMyBatisCalc umc=new UseMyBatisCalc();
			list=umc.mybatisRental();
			
			return list;
		}//selectPurchase
		
		public List<RentalListDomain> searchRentalCondition(SearchCalcVO scVO) {  //검색조건에 따른 구매내역 조회
			List<RentalListDomain> list=null;
			
			CalcDAO cDao=CalcDAO.getInstance();
			
			try {
				list=cDao.selectAllRental();
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return list;
		}//searchRentalCondition
		

}//class

