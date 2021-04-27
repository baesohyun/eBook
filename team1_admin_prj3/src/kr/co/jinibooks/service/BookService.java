package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.BookDAO;
import kr.co.jinibooks.domain.BookListDomain;


public class BookService {
	
	public List<BookListDomain> searchAllBook() {
		List<BookListDomain> list=null;
		
		BookDAO dDao=BookDAO.getInstance();
		try {
			list=dDao.selectAllBook();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchAllBook

}//class
