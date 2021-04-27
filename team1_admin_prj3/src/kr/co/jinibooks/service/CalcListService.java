package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.BookListDAO;
import kr.co.jinibooks.dao.CalcListDAO;
import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;
import kr.co.jinibooks.vo.SearchBookVO;
import kr.co.jinibooks.vo.SearchCalcVO;
import kr.co.jinibooks.vo.IndexListVO;

/**
 * XxxAction이 객체를 생성하고 호출하여 업무로직(Business Logic)을 수행하고 
 * Model단의 XxxDAO를 사용하여 DB업무를 사용하는 일
 * @author owner
 */
public class CalcListService {
	
	/**
	 * 검색값을 받아서 검색값이 없다면 전체글의 갯수를 조회하고, 
	 * 검색 값이 있다면 검색값에 해당하는 글의 갯수를 조회하는 일.
	 * @param sv
	 * @return
	 */
	public int totalCount(SearchCalcVO scVO) {
		int totalCnt=0;
		CalcListDAO clDao=CalcListDAO.getInstance();
		try {
			totalCnt=clDao.selectTotalCount(scVO);
			System.out.println("totalCnt="+totalCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return totalCnt;
	}//totalCount
	
	/**
	 * 한 화면에 보여줄 게시물의 수
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}//pageScale

	/**
	 * 총 페이지를 보여주기 위해 필요한 ㅣ페이지 수 
	 * @param pageScale 한화면에 보여줄 게시물의 수
 	 * @param totalCount 총게시물의 수
	 * @return
	 */
	public int totalPage(int pageScale, int totalCount) {
		int totalPage=totalCount/pageScale ; //모든 게시물을 보여주기 위한 총 페이지 수
	 	if( totalCount%pageScale != 0 ) { // pageScale로 딱 떨어지지 않으면 나머지 게시물을 보여주기 위해 한장 더 필요하다.
			totalPage++;
		} 
		//int totalPage=(int)Math.ceil( (double)totalCount / pageScale );
		
		return totalPage;
	}//totalPage
	
	/**
	 * 페이지의 시작번호를 구하는 일
	 * @param pageScale
	 * @param currentPage
	 * @return
	 */
	public int startNum(int pageScale, int currentPage) {
		int startNum=currentPage*pageScale-pageScale+1;
		
		return startNum;
	}//startNum
	
	/** 페이지의 끝번호를 구하는 일
	 * @param pageScale
	 * @param startNum
	 * @return
	 */
	public int endNum(int pageScale, int startNum) {
		int endNum=startNum+pageScale-1;
		
		return endNum;
	}//endNum
	
	  /**
	 * 검색값과 시작번호, 끝번호에 해당하는 게시물의 리스트 조회
	 * @param srVO 시작번호, 끝번호를 가진
	 * @param sVO 키워드, 컬럼명, 현재페이지 번호를 가진 VO  (MyBatis에서는 두개가통합됨)
	 * @return
	 */
	public List<PurchaseListDomain> searchList(SearchCalcVO scVO)  {
		  List<PurchaseListDomain> list=null;
		  
		  CalcListDAO clDao=CalcListDAO.getInstance();
		  try {
			list=clDao.selectPurchaseList(scVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		  
		  return list;
	  }//searchList
	
	/**
	 * 검색값과 시작번호, 끝번호에 해당하는 게시물의 리스트 조회
	 * @param srVO 시작번호, 끝번호를 가진
	 * @param sVO 키워드, 컬럼명, 현재페이지 번호를 가진 VO  (MyBatis에서는 두개가통합됨)
	 * @return
	 */
	public List<RentalListDomain> searchRentalList(SearchCalcVO scVO)  {
		List<RentalListDomain> list=null;
		
		CalcListDAO clDao=CalcListDAO.getInstance();
		try {
			list=clDao.selectRentalList(scVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchList
	
	
	public String indexList(IndexListVO ilVO) {
	int pagenumber; // 화면에 보여질 페이지 인덱스 수
	int startpage; // 화면에 보여질 시작페이지 번호
	int endpage; // 화면에 보여질 마지막페이지 번호
	int curpage; // 이동하고자 하는 페이지 번호

	String strList=""; // 리턴될 페이지 인덱스 리스트

	pagenumber = 10; // 한 화면의 페이지 인덱스 수 

	// 시작 페이지번호 구하기
	startpage = (( ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

	// 마지막 페이지번호 구하기
	endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

	// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 

	// 총 페이지 수가 마지막페이지 번호가 됨


	if ( ilVO.getTotalPage() <= endpage){
		endpage = ilVO.getTotalPage();
	}//end if

	// 첫번째 페이지 인덱스 화면이 아닌경우
	if ( ilVO.getCurrentPage() > pagenumber) {
		curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동
		strList = strList + "<li class=\"page-item\"><a class=\"page-link\"  href="+ilVO.getUrl()+"?current_page="+curpage+" aria-label=\"Previous\">\r\n" + 
				"		        <span aria-hidden=\"true\">&laquo;</span></a></li>";
	}else{                                        
		strList = strList + "<li class=\"page-item\">\r\n" + 
				"		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n" + 
				"		        <span aria-hidden=\"true\">&laquo;</span>\r\n" + 
				"		      </a>\r\n" + 
				"		    </li>";
	}//end else

//	strList = strList + " ... ";

	// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
	curpage = startpage;

	while (curpage <= endpage){
		if (curpage == ilVO.getCurrentPage()) {
			strList = strList + "<li class=\"page-item\"><a class='page-link' title='현재페이지'>"+ilVO.getCurrentPage()+"</a></li>";
		} else {
			strList = strList +"<li class=\"page-item\"><a class=\"page-link\" href="+ilVO.getUrl()+"?current_page="+curpage+">"+curpage+"</a></li>";
		}//end else

		curpage++;
	}//end while

//	strList = strList + " ... ";

	// 뒤에 페이지가 더 있는경우
	if ( ilVO.getTotalPage() > endpage) {
		curpage = endpage + 1; 
		strList = strList + "<li class=\"page-item\">\r\n" + 
				"		      <a class=\"page-link\"  href="+ilVO.getUrl()+"?current_page="+curpage+" aria-label=\"Next\">\r\n" + 
						"		        <span aria-hidden=\"true\">&raquo;</span></a>";
	}else{
		strList = strList + "<li class=\"page-item\">\r\n" + 
				"		      <a class=\"page-link\" href=\"#\" aria-label=\"Next\">\r\n" + 
				"		        <span aria-hidden=\"true\">&raquo;</span>\r\n" + 
				"		      </a>\r\n" + 
				"		    </li>";
	}//end else

	return strList;
	}//indexList


}//class
