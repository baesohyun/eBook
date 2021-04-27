package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.UserBookDAO;
import kr.co.jinibooks.domain.SearchBookListDomain;
import kr.co.jinibooks.domain.SearchNewBookDomain;
import kr.co.jinibooks.domain.SearchRandomBookDomain;
import kr.co.jinibooks.domain.SelectCateBookDomain;
import kr.co.jinibooks.domain.SelectDetailBookDomain;
import kr.co.jinibooks.vo.SearchBookPageVO;

public class SearchBookService {
	public List<SearchBookListDomain> searchBookList(SearchBookPageVO sbVO){
		List<SearchBookListDomain> searchList=null;
		UserBookDAO bDao= UserBookDAO.getInstance();
		 String intro="";
		try {
			searchList= bDao.selectBookList(sbVO);
			
			 for(int i=0; i<searchList.size(); i++) { 
			 	intro=searchList.get(i).getIntro(); 
				 if(intro.length()>120) {
					 intro=intro.substring(0,120)+"..."; 
					 searchList.get(i).setIntro(intro);
				 }//end if
			 }//end for
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return searchList;
	}//searchBookList
	
	public SelectDetailBookDomain selectDetailBook(String code) {
		SelectDetailBookDomain sdbd=null;
		UserBookDAO dDao=UserBookDAO.getInstance();
		try {
			sdbd= dDao.selectDetailBook(code);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return sdbd;
	}//selectDetailBook
	
	public List<SelectCateBookDomain> selectCateList(String cate){
		List<SelectCateBookDomain> selectCateList=null;
		UserBookDAO bDao= UserBookDAO.getInstance();
		try {
			selectCateList= bDao.selectCateList(cate);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return selectCateList;
	}//selectCateList
	
	public List<SelectCateBookDomain> selectCateNew(String cate){
		List<SelectCateBookDomain> selectCateList=null;
		UserBookDAO bDao= UserBookDAO.getInstance();
		try {
			selectCateList= bDao.selectCateNew(cate);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return selectCateList;
	}//selectCateList
	
	
	public List<SearchNewBookDomain> selectNewRange(SearchBookPageVO sbVO){
		 List<SearchNewBookDomain> newRangeList=null;
		 UserBookDAO bDao=UserBookDAO.getInstance();
		 String intro="";
		 try {
			newRangeList=bDao.selectNewRange(sbVO);
			 for(int i=0; i<newRangeList.size(); i++) { 
				 	intro=newRangeList.get(i).getIntro(); 
					 if(intro.length()>120) {
						 intro=intro.substring(0,120)+"..."; 
						 newRangeList.get(i).setIntro(intro);
					 }//end if
				 }//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		 return newRangeList;
	}//selectNewRange
	
	public List<SearchBookListDomain> selectRatingRange(SearchBookPageVO sbVO){
		List<SearchBookListDomain> ratingRangeList=null;
		UserBookDAO bDao=UserBookDAO.getInstance();
		String intro="";
		try {
			ratingRangeList=bDao.selectRatingRange(sbVO);
			for(int i=0; i<ratingRangeList.size(); i++) { 
				intro=ratingRangeList.get(i).getIntro(); 
				if(intro.length()>120) {
					intro=intro.substring(0,120)+"..."; 
					ratingRangeList.get(i).setIntro(intro);
				}//end if
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return ratingRangeList;
	}//selectRatingRange
	
	// 비슷한 도서 조회  2019-12-07 ///////////////-
	public List<SearchRandomBookDomain> randomBookList1(String cateCode){
		List<SearchRandomBookDomain> list=null;
		UserBookDAO bDao=UserBookDAO.getInstance();
		String title="";
		try {
			list= bDao.randomBookList1(cateCode);
			for(int i=0; i<list.size(); i++) { 
				title=list.get(i).getTitle();
				if(title.length()>8) {
					title=title.substring(0,8)+"..."; 
					list.get(i).setTitle(title);
				}//end if
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//randomBook
	public List<SearchRandomBookDomain> randomBookList2(String cateCode){
		List<SearchRandomBookDomain> list=null;
		UserBookDAO bDao=UserBookDAO.getInstance();
		String title="";
		try {
			list= bDao.randomBookList2(cateCode);
			for(int i=0; i<list.size(); i++) { 
				title=list.get(i).getTitle();
				if(title.length()>8) {
					title=title.substring(0,8)+"..."; 
					list.get(i).setTitle(title);
				}//end if
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//randomBook
	public List<SearchNewBookDomain> selectNameRange(SearchBookPageVO sbVO){
		List<SearchNewBookDomain> nameRangeList=null;
		UserBookDAO bDao=UserBookDAO.getInstance();
		String intro="";
		try {
			nameRangeList=bDao.selectNameRange(sbVO);
			for(int i=0; i<nameRangeList.size(); i++) { 
				intro=nameRangeList.get(i).getIntro(); 
				if(intro.length()>120) {
					intro=intro.substring(0,120)+"..."; 
					nameRangeList.get(i).setIntro(intro);
				}//end if
			}//end for
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return nameRangeList;
	}//selectNameRange

}//class
