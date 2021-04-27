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
			//DAO���� Ŭ������ �����Ͽ� DB�� ������ �޴´�.
			UseMyBatisCalc umc=new UseMyBatisCalc();
			list=umc.mybatisPurchase();
			
			return list;
		}//selectPurchase
		
		public List<PurchaseListDomain> searchPurchaseCondition(SearchCalcVO scVO) {  //�˻����ǿ� ���� ���ų��� ��ȸ
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
			//DAO���� Ŭ������ �����Ͽ� DB�� ������ �޴´�.
			UseMyBatisCalc umc=new UseMyBatisCalc();
			list=umc.mybatisRental();
			
			return list;
		}//selectPurchase
		
		public List<RentalListDomain> searchRentalCondition(SearchCalcVO scVO) {  //�˻����ǿ� ���� ���ų��� ��ȸ
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

