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
 * XxxAction�� ��ü�� �����ϰ� ȣ���Ͽ� ��������(Business Logic)�� �����ϰ� 
 * Model���� XxxDAO�� ����Ͽ� DB������ ����ϴ� ��
 * @author owner
 */
public class CalcListService {
	
	/**
	 * �˻����� �޾Ƽ� �˻����� ���ٸ� ��ü���� ������ ��ȸ�ϰ�, 
	 * �˻� ���� �ִٸ� �˻����� �ش��ϴ� ���� ������ ��ȸ�ϴ� ��.
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
	 * �� ȭ�鿡 ������ �Խù��� ��
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}//pageScale

	/**
	 * �� �������� �����ֱ� ���� �ʿ��� �������� �� 
	 * @param pageScale ��ȭ�鿡 ������ �Խù��� ��
 	 * @param totalCount �ѰԽù��� ��
	 * @return
	 */
	public int totalPage(int pageScale, int totalCount) {
		int totalPage=totalCount/pageScale ; //��� �Խù��� �����ֱ� ���� �� ������ ��
	 	if( totalCount%pageScale != 0 ) { // pageScale�� �� �������� ������ ������ �Խù��� �����ֱ� ���� ���� �� �ʿ��ϴ�.
			totalPage++;
		} 
		//int totalPage=(int)Math.ceil( (double)totalCount / pageScale );
		
		return totalPage;
	}//totalPage
	
	/**
	 * �������� ���۹�ȣ�� ���ϴ� ��
	 * @param pageScale
	 * @param currentPage
	 * @return
	 */
	public int startNum(int pageScale, int currentPage) {
		int startNum=currentPage*pageScale-pageScale+1;
		
		return startNum;
	}//startNum
	
	/** �������� ����ȣ�� ���ϴ� ��
	 * @param pageScale
	 * @param startNum
	 * @return
	 */
	public int endNum(int pageScale, int startNum) {
		int endNum=startNum+pageScale-1;
		
		return endNum;
	}//endNum
	
	  /**
	 * �˻����� ���۹�ȣ, ����ȣ�� �ش��ϴ� �Խù��� ����Ʈ ��ȸ
	 * @param srVO ���۹�ȣ, ����ȣ�� ����
	 * @param sVO Ű����, �÷���, ���������� ��ȣ�� ���� VO  (MyBatis������ �ΰ������յ�)
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
	 * �˻����� ���۹�ȣ, ����ȣ�� �ش��ϴ� �Խù��� ����Ʈ ��ȸ
	 * @param srVO ���۹�ȣ, ����ȣ�� ����
	 * @param sVO Ű����, �÷���, ���������� ��ȣ�� ���� VO  (MyBatis������ �ΰ������յ�)
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
	int pagenumber; // ȭ�鿡 ������ ������ �ε��� ��
	int startpage; // ȭ�鿡 ������ ���������� ��ȣ
	int endpage; // ȭ�鿡 ������ ������������ ��ȣ
	int curpage; // �̵��ϰ��� �ϴ� ������ ��ȣ

	String strList=""; // ���ϵ� ������ �ε��� ����Ʈ

	pagenumber = 10; // �� ȭ���� ������ �ε��� �� 

	// ���� ��������ȣ ���ϱ�
	startpage = (( ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

	// ������ ��������ȣ ���ϱ�
	endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

	// �� ������ ���� ���� ������������ ��ȣ���� ������� 

	// �� ������ ���� ������������ ��ȣ�� ��


	if ( ilVO.getTotalPage() <= endpage){
		endpage = ilVO.getTotalPage();
	}//end if

	// ù��° ������ �ε��� ȭ���� �ƴѰ��
	if ( ilVO.getCurrentPage() > pagenumber) {
		curpage = startpage - 1; // ���������� ��ȣ���� 1 ���� �������� �̵�
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

	// ���������� ��ȣ���� ������������ ��ȣ���� ȭ�鿡 ǥ��
	curpage = startpage;

	while (curpage <= endpage){
		if (curpage == ilVO.getCurrentPage()) {
			strList = strList + "<li class=\"page-item\"><a class='page-link' title='����������'>"+ilVO.getCurrentPage()+"</a></li>";
		} else {
			strList = strList +"<li class=\"page-item\"><a class=\"page-link\" href="+ilVO.getUrl()+"?current_page="+curpage+">"+curpage+"</a></li>";
		}//end else

		curpage++;
	}//end while

//	strList = strList + " ... ";

	// �ڿ� �������� �� �ִ°��
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
