package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.NoticeDAO;
import kr.co.jinibooks.domain.NoticeListDomain;
import kr.co.jinibooks.vo.BoardIndexListVO;
import kr.co.jinibooks.vo.NoticeSearchVO;
import kr.co.jinibooks.vo.NoticeVO;

/**
 * XxxAction이 객체를 생성하고 호출하여 업무로직(Business Logic)을 수행하고 Model단의 XxxDAO를 사용하여 DB
 * 업무 사용하는 일.
 * 
 * @author owner
 */
public class NoticeBoardListService {

	/**
	 * 검색값을 받아서 검색 값이 없다면 전체글의 갯수를 조회하고, 검색 값이 있다면 검색값에 해당하는 글의 갯수를 조회하는 일.
	 * 
	 * @param sv
	 * @return
	 */
	public int totalCount(NoticeSearchVO nsVO) {
		int totalCnt = 0;
		NoticeDAO nDAO = NoticeDAO.getInstance();
		try {
			totalCnt = nDAO.selectTotalCount(nsVO);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		return totalCnt;
	}// totalCount

	/**
	 * 한 화면에 보여줄 게시물의 수
	 * 
	 * @return
	 */
	public int pageScale() {
		int pageScale = 10;
		return pageScale;
	}// pageScale

	/**
	 * 총 페이지를 보여주기 위해 필요한 페이지 수
	 * 
	 * @param pageScale  한화면에 보여줄 게시물의 수
	 * @param totalCount 총게시물의 수
	 * @return
	 */
	public int totalPage(int pageScale, int totalCount) {
		int totalPage = totalCount / pageScale;// 모든 게시물을 보여주기위한 총 페이지 수

		if (totalCount % pageScale != 0) {// pageScale로 딱 떨어지지 않으면 나머지 게시물을 보여주기위해 한장 더 필요하다.
			totalPage++;
		} // end if
			// int totalPage=(int)Math.ceil( (double)totalCount / pageScale);

		return totalPage;
	}// totalPage

	/**
	 * 페이지 시작번호 구하는 일
	 * 
	 * @param pageScale
	 * @param currentPage
	 * @return
	 */
	public int startNum(int pageScale, int currentPage) {
		int startNum = currentPage * pageScale - pageScale + 1;

		return startNum;
	}// startNum

	/**
	 * 페이지의 끝번호 구하는 일
	 * 
	 * @param pageScale
	 * @param startNum
	 * @return
	 */
	public int endNum(int pageScale, int startNum) {
		int endNum = startNum + pageScale - 1;
		return endNum;
	}// endNum

	/**
	 * 검색값과 시작번호, 끝번호에 해당하는 게시물의 리스트 조회
	 * 
	 * @param srVO 시작번호, 끝번호를 가진 VO
	 * @param sVO  키워드, 컬럼명, 현재페이지 번호가진 VO
	 * @return
	 */
	public List<NoticeListDomain> searchList(NoticeSearchVO sVO) {
		List<NoticeListDomain> list = null;
		
	    NoticeDAO s_dao3=NoticeDAO.getInstance(); 
	    try{
		    list=s_dao3.selectBoardList(sVO);
//		    if(list !=null) {
//		    	String temp="";
//		    	for (int i = 0; i < list.size(); i++) {
//					temp=list.get(i).getNum().substring(2) ;
//					list.get(i).setNum(temp);
//				}//end if
//		    }//end if 
		} catch (SQLException sqle) {
		    sqle.printStackTrace(); 
		}//end catch

		return list;
	}// searchList

	// 현재 게시판의 페이지 인덱스 설정
	public String indexList(BoardIndexListVO ilVO,NoticeSearchVO sVO) {
		int pagenumber; // 화면에 보여질 페이지 인덱스 수
		int startpage; // 화면에 보여질 시작페이지 번호
		int endpage; // 화면에 보여질 마지막페이지 번호
		int curpage; // 이동하고자 하는 페이지 번호

		String strList = ""; // 리턴될 페이지 인덱스 리스트

		pagenumber = 10; // 한 화면의 페이지 인덱스 수

		// 시작 페이지번호 구하기
		startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우

		// 총 페이지 수가 마지막페이지 번호가 됨
		
		String field=sVO.getField()!=null?sVO.getField():"";
		String keyword=sVO.getKeyword()!=null?sVO.getKeyword():"";
		String params="&field="+field+"&keyword="+keyword;

		if (ilVO.getTotalPage() <= endpage) {
			endpage = ilVO.getTotalPage();
		} // end if

		// 첫번째 페이지 인덱스 화면이 아닌경우
		if (ilVO.getCurrentPage() > pagenumber) {
			curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동
			strList = strList + "<li class=\"page-item\"><a class=\"page-link\" href=" + ilVO.getUrl()
					+ "?current_page=" + curpage +params+ " aria-label=\"Previous\">\r\n"
					+ "        <span aria-hidden=\"true\">&laquo;</span></a></li>";
		} else {
			strList = strList + "<li class=\"page-item\">\r\n"
					+ "      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\r\n"
					+ "        <span aria-hidden=\"true\">&laquo;</span>\r\n" + "      </a>\r\n" + "    </li>";
		} // end else

		// strList = strList + " ..;

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;

		while (curpage <= endpage) {
			if (curpage == ilVO.getCurrentPage()) {
				strList = strList + "<li class=\"page-item\"><a class=\"page-link\" title='현재페이지'>"
						+ ilVO.getCurrentPage() + "</a></li>";
			} else {
				strList = strList + "<li class=\"page-item\"><a class=\"page-link\" href=" + ilVO.getUrl()
						+ "?current_page=" + curpage+ params + ">" + curpage + "</a></li>";
			} // end else

			curpage++;
		} // end while

		// strList = strList + " ... ";

		// 뒤에 페이지가 더 있는경우
		if (ilVO.getTotalPage() > endpage) {
			curpage = endpage + 1;
			strList = strList + "<li class=\"page-item\">\r\n" + "      <a class=\"page-link\" href=" + ilVO.getUrl()
					+ "?current_page=" + curpage+params + " aria-label=\"Next\">\r\n"
					+ "        <span aria-hidden=\"true\">&raquo;</span></a></li>";
		} else {
			strList = strList + "<li class=\"page-item\">\r\n"
					+ "      <a class=\"page-link\" href=\"#\" aria-label=\"Next\">\r\n"
					+ "        <span aria-hidden=\"true\">&raquo;</span>\r\n" + "      </a>\r\n" + "    </li>";
		} // end else

		return strList;
	}// indexList
	
	public List<NoticeListDomain> multiColumnMultiRow(){
		List<NoticeListDomain> list=null;
		
		NoticeDAO sDao3=NoticeDAO.getInstance();
		list=sDao3.multiColumnMultiRow();
		
		return list;
	}//multiColumnMultiRow
	
	public NoticeListDomain searchNoticeDetail(String num) {
		NoticeListDomain bld=null;
		NoticeDAO nDAO= NoticeDAO.getInstance();
		try {
			bld=nDAO.selectDetailNotice(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bld;
	}//searchNoticeDetail
	
	public boolean insertnotice(NoticeVO ceiVO){
		boolean flag = false;
		
		//DAO를 사용하여 
		NoticeDAO ceDAO = NoticeDAO.getInstance();
		try {
			//쿼리문을 수행하고 결과를 얻는다.
			int cnt = ceDAO.insertNotice(ceiVO);
			if(cnt == 1) {
				flag = true;
			}//end if
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return flag;
	}//addCpEmp
	

	
	public boolean deletenotice(NoticeVO ceiVO){
		boolean flag = false;
		
		//DAO를 사용하여 
		NoticeDAO ceDAO = NoticeDAO.getInstance();
		try {
			//쿼리문을 수행하고 결과를 얻는다.
			int cnt = ceDAO.deleteNotice(ceiVO);
			if(cnt == 1) {
				flag = true;
			}//end if
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return flag;
	}//addCpEmp

}// class
