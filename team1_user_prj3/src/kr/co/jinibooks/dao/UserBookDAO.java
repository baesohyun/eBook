package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.MainNoticeDomain;
import kr.co.jinibooks.domain.QuestionListDomain;
import kr.co.jinibooks.domain.SearchBookListDomain;
import kr.co.jinibooks.domain.SearchCartListDomain;
import kr.co.jinibooks.domain.SearchNewBookDomain;
import kr.co.jinibooks.domain.SearchRandomBookDomain;
import kr.co.jinibooks.domain.SelectCateBookDomain;
import kr.co.jinibooks.domain.SelectDetailBookDomain;
import kr.co.jinibooks.domain.cate_best_bookDomain;
import kr.co.jinibooks.domain.mainBookDomain;
import kr.co.jinibooks.domain.newBookDomain;
import kr.co.jinibooks.vo.CartDeleteVO;
import kr.co.jinibooks.vo.CartDeleteVO2;
import kr.co.jinibooks.vo.CartInsertVO;
import kr.co.jinibooks.vo.SearchBookPageVO;
import kr.co.jinibooks.vo.SearchIdVO;

public class UserBookDAO {
	private static UserBookDAO ubDao;
	private static SqlSessionFactory ssf;
	
	private UserBookDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static UserBookDAO getInstance() {
		if(ubDao==null) {
			ubDao=new UserBookDAO();
		}//end if
		return ubDao;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory() throws IOException{
		if(ssf==null) {
			Reader reader=null;
			try {
				//1. 설정용 xml을 스트림으로 연결
				reader=Resources.getResourceAsReader("kr/co/jinibooks/dao/mybatis-config.xml");
				//2. SqlSessionFactoryBuilder 생성
				SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
				//3. SqlSessionFactory 얻기
				ssf=ssfb.build(reader);
			}finally {
				if(reader!=null) {reader.close();}//end if
			}//end finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	///메인 시작////////////////////////////////////////////////////////
	
	/**
	 * 메인- 추천 도서1
	 * @return
	 * @throws SQLException
	 */
	public List<mainBookDomain> selectRecomendBook1() throws SQLException{
		List<mainBookDomain> recomendBookList1=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			recomendBookList1=ss.selectList("mainRecomendBook1");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return recomendBookList1;
	}//selectRecomendBook1
	
	
	/**
	 * 메인- 추천 도서2
	 * @return
	 * @throws SQLException
	 */
	public List<mainBookDomain> selectRecomendBook2() throws SQLException{
		List<mainBookDomain> recomendBookList2=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			recomendBookList2=ss.selectList("mainRecomendBook2");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return recomendBookList2;
	}//selectRecomendBook2
	
	
	/**
	 * 메인- 종합 베스트 top5
	 * @return
	 * @throws SQLException
	 */
	public List<mainBookDomain> selectTotalBestBook() throws SQLException{
		List<mainBookDomain> totalBestBookList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			totalBestBookList=ss.selectList("mainTotalBestBook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return totalBestBookList;
	}//selectTotalBestBook
	
	
	/**
	 * 메인- 인기 도서
	 * @return
	 * @throws SQLException
	 */
	public List<mainBookDomain> selectPopularBook() throws SQLException{
		List<mainBookDomain> popularBookList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			popularBookList=ss.selectList("mainPopularBook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return popularBookList;
	}//selectPopularBook
	
	
	/**
	 * 메인- 신간 도서
	 * @return
	 * @throws SQLException
	 */
	public List<mainBookDomain> selectMainNewBook() throws SQLException{
		List<mainBookDomain> mainNewBookList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			mainNewBookList=ss.selectList("mainNewbook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return mainNewBookList;
	}//selectMainNewBook
	
	
	/**
	 * 메인- 공지사항 리스트
	 * @return
	 * @throws SQLException
	 */
	public List<MainNoticeDomain> selectNotice() throws SQLException{
		List<MainNoticeDomain> mainNoticeList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			mainNoticeList=ss.selectList("mainNoticeList");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return mainNoticeList;
	}//selectNotice
	
	
	/**
	 * 메인- 자주하는 질문 리스트
	 * @return
	 * @throws SQLException
	 */
	public List<MainNoticeDomain> selectQuestion() throws SQLException{
		List<MainNoticeDomain> mainQuestionList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			mainQuestionList=ss.selectList("mainQuestionList");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return mainQuestionList;
	}//selectQuestion
	
/////메인 끝//////////////////////////	
	
	/**
	 * 이달의 신간 페이지 조회
	 * @return
	 * @throws SQLException
	 */
	public List<newBookDomain> selectNewBook() throws SQLException{
		List<newBookDomain> newBookList=null;
		
		try {
			SqlSession ss = getSessionFactory().openSession();
			newBookList=ss.selectList("newbook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return newBookList;
	}//selectNewBook
	
	
	/**
	 * 베스트 페이지 주간 조회
	 * @return
	 * @throws SQLException
	 */
	public List<cate_best_bookDomain> selectBestWeekBook() throws SQLException{
		List<cate_best_bookDomain> bestWeekBookList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			bestWeekBookList=ss.selectList("bestWeekBook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return bestWeekBookList;
	}//selectBestWeekBook
	
	/**
	 * 베스트 페이지 월간 조회
	 * @return
	 * @throws SQLException
	 */
	public List<cate_best_bookDomain> selectBestMonthBook() throws SQLException{
		List<cate_best_bookDomain> bestMonthBookList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			bestMonthBookList=ss.selectList("bestMonthBook");
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return bestMonthBookList;
	}//selectBestMonthBook
	
	///혜빈////////////////////////////////////////////////
	
	public List<SearchBookListDomain> selectBookList(SearchBookPageVO sbVO) throws SQLException{
		List<SearchBookListDomain> searchList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			searchList=ss.selectList("selectSearchBook",sbVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return searchList;
	}//selectBookList
	
	public SelectDetailBookDomain selectDetailBook(String code) throws SQLException{
		SelectDetailBookDomain sdbd=null; 
		try {
			SqlSession ss= getSessionFactory().openSession();
			sdbd=ss.selectOne("selectDetailBook",code);//book_code
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return sdbd;
	}//selectDetailBook
	
	public List<SelectCateBookDomain> selectCateList(String cate) throws SQLException{
		List<SelectCateBookDomain> selectCateList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			selectCateList=ss.selectList("selectCateBook",cate);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return selectCateList;
	}//selectCateList
	
	public List<SelectCateBookDomain> selectCateNew(String cate) throws SQLException{
		List<SelectCateBookDomain> selectCateList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			selectCateList=ss.selectList("selectCateNewBook",cate);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return selectCateList;
	}//selectCateList
	
	public List<SearchNewBookDomain> selectNewRange(SearchBookPageVO sbVO) throws SQLException{
		List<SearchNewBookDomain> newRangeList=null;
		try {
			SqlSession ss = getSessionFactory().openSession();
			newRangeList=ss.selectList("selectSearchNewBook",sbVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return newRangeList;
	}//selectNewRange
	
	public List<SearchBookListDomain> selectRatingRange(SearchBookPageVO sbVO) throws SQLException{
		List<SearchBookListDomain> ratingRangeList=null;
		try {
			SqlSession ss = getSessionFactory().openSession();
			ratingRangeList=ss.selectList("selectSearchRatingBook",sbVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return ratingRangeList;
	}//selectRatingRange
	
	/////////////////////////////cart/////////////////////////////////////////
	public List<SearchCartListDomain> selectCartList(SearchIdVO siVO) throws SQLException{
		List<SearchCartListDomain> cartList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			cartList=ss.selectList("selectBookCartList",siVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return cartList;
	}//selectCartList
	
//	CartInsertVO ciVO
	public int insertCart(CartInsertVO ciVO) throws SQLException{ 
		int cnt=0;
	
		try {
			SqlSession ss= getSessionFactory().openSession();
			cnt=ss.insert("insertCart",ciVO);
			ss.commit();
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return cnt;
	}//insertCart
	
	public int DeleteCart(CartDeleteVO cdVO) throws SQLException{ 
		int cnt=0;
		try {
			SqlSession ss = getSessionFactory().openSession();
			
			String id = cdVO.getId();
			String[] code = cdVO.getCartCode();
			
			for(int i=0; i<code.length; i++) {
				CartDeleteVO2 cdVO2 = new CartDeleteVO2(id,code[i]);
				cnt=ss.delete("deleteCart",cdVO2);
				ss.commit();
			}//end for
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return cnt;
	}//DeleteCart

	
	// 비슷한 도서 조회  2019-12-07 ///////////////-
	public List<SearchRandomBookDomain> randomBookList1(String cateCode) throws SQLException{
		List<SearchRandomBookDomain> randomList=null;
		try {
			SqlSession ss= getSessionFactory().openSession();
			randomList=ss.selectList("selectSimilarList1",cateCode);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return randomList;
	}//randomBook
	public List<SearchRandomBookDomain> randomBookList2(String cateCode) throws SQLException{
		List<SearchRandomBookDomain> randomList=null;
		try {
			SqlSession ss= getSessionFactory().openSession();
			randomList=ss.selectList("selectSimilarList2",cateCode);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return randomList;
	}//randomBook
	
	public int selectSearchCnt(SearchBookPageVO sbVO) throws SQLException{
		int cnt=0;
		try {
			SqlSession ss=getSessionFactory().openSession();
			cnt=ss.selectOne("selectSearchCnt",sbVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		
		return cnt;
	}
	
	public List<SearchNewBookDomain> selectNameRange(SearchBookPageVO sbVO) throws SQLException{
		List<SearchNewBookDomain> nameRangeList=null;
		try {
			SqlSession ss = getSessionFactory().openSession();
			nameRangeList=ss.selectList("selectSearchNameBook",sbVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return nameRangeList;
	}//selectNameRange
	
	
}//class
