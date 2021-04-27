package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.MyPageMyBookDAO;
import kr.co.jinibooks.domain.SearchMPMyBookPayDomain;
import kr.co.jinibooks.domain.SearchMPMyBookRentalDomain;

public class MyPageMyBookService {

	public List<SearchMPMyBookRentalDomain> selectRentalBook(String id){
		List<SearchMPMyBookRentalDomain> rentalList=null;
		MyPageMyBookDAO mbDao=MyPageMyBookDAO.getInstance();
		
		try {
			rentalList=mbDao.selectRentalBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return rentalList;
	}//selectRentalBook
	
	public List<SearchMPMyBookPayDomain> selectPayBook(String id){
		List<SearchMPMyBookPayDomain> payList=null;
		MyPageMyBookDAO mbDao=MyPageMyBookDAO.getInstance();
		
		try {
			payList=mbDao.selectPayBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return payList;
	}//selectPayBook
	
}//class
