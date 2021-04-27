package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.UserBookDAO;
import kr.co.jinibooks.domain.MainNoticeDomain;
import kr.co.jinibooks.domain.QuestionListDomain;
import kr.co.jinibooks.domain.cate_best_bookDomain;
import kr.co.jinibooks.domain.mainBookDomain;
import kr.co.jinibooks.domain.newBookDomain;

public class UserBookService {
	
	//////메인 시작////////////////////////////////////
	/**
	 * 메인- 추천 도서1
	 * @return
	 */
	public List<mainBookDomain> searchRecomendBook1(){
		List<mainBookDomain> recomendBookList1=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			recomendBookList1=ubDao.selectRecomendBook1();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return recomendBookList1;
	}//searchRecomendBook1
	
	/**
	 * 메인- 추천 도서2
	 * @return
	 */
	public List<mainBookDomain> searchRecomendBook2(){
		List<mainBookDomain> recomendBookList2=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			recomendBookList2=ubDao.selectRecomendBook2();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return recomendBookList2;
	}//searchRecomendBook1
	
	/**
	 * 메인- 종합 베스트 top5
	 * @return
	 */
	public List<mainBookDomain> searchTotalBestBook(){
		List<mainBookDomain> totalBestBookList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			totalBestBookList=ubDao.selectTotalBestBook();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return totalBestBookList;
	}//searchTotalBestBook
	
	/**
	 * 메인- 인기 도서
	 * @return
	 */
	public List<mainBookDomain> searchPopularBook(){
		List<mainBookDomain> popularBookList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			popularBookList=ubDao.selectPopularBook();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return popularBookList;
	}//searchPopularBook
	
	/**
	 * 메인- 신간 도서
	 * @return
	 */
	public List<mainBookDomain> searchMainNewBook(){
		List<mainBookDomain> mainNewBookList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			mainNewBookList=ubDao.selectMainNewBook();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return mainNewBookList;
	}//searchMainNewBook
	
	/**
	 * 메인- 공지사항 리스트
	 * @return
	 */
	public List<MainNoticeDomain> searchNotice(){
		List<MainNoticeDomain> mainNoticeList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			mainNoticeList=ubDao.selectNotice();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return mainNoticeList;
	}//searchNotice
	
	/**
	 * 메인- 자주하는 질문 리스트
	 * @return
	 */
	public List<MainNoticeDomain> searchQuestion(){
		List<MainNoticeDomain> mainQuestionList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			mainQuestionList=ubDao.selectQuestion();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return mainQuestionList;
	}//searchQuestion
	
	
	//////메인 끝////////////////////////////////////
	
	/**
	 * 이달의 신간 페이지 조회
	 * @return
	 */
	public List<newBookDomain> searchNewBook(){
		List<newBookDomain> newBookList=null;
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			String intro=null;
			
			newBookList=ubDao.selectNewBook();
			
			for(int i=0; i<newBookList.size(); i++) {
				intro=newBookList.get(i).getIntro();
				if(intro.length()>301) {
					intro=intro.substring(0, 300)+"...";
					newBookList.get(i).setIntro(intro);
				}//end if
			}//end for
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return newBookList;
	}//searchNewBook
	
	/**
	 * 베스트 페이지 주간 조회
	 * @return
	 */
	public List<cate_best_bookDomain> searchWeekBestBook(){
		List<cate_best_bookDomain> bestWeekBookList=null;
		
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			bestWeekBookList=ubDao.selectBestWeekBook();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return bestWeekBookList;
	}//searchWeekBestBook
	
	/**
	 * 베스트 페이지 월간 조회
	 * @return
	 */
	public List<cate_best_bookDomain> searchMonthBestBook(){
		List<cate_best_bookDomain> bestMonthBookList=null;
		
		
		UserBookDAO ubDao=UserBookDAO.getInstance();
		try {
			bestMonthBookList=ubDao.selectBestMonthBook();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return bestMonthBookList;
	}//searchWeekBestBook

}//class
