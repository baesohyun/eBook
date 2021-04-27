package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jinibooks.domain.BookSearchDomain;
import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;
import kr.co.jinibooks.service.CalcListService;
import kr.co.jinibooks.service.CalcMainService;
import kr.co.jinibooks.vo.IndexListVO;
import kr.co.jinibooks.vo.SearchBookVO;
import kr.co.jinibooks.vo.SearchCalcVO;

@Controller
public class BookCalcController {
	
	@RequestMapping(value="admin_calc_purchase.do", method= {GET,POST})
	public String purchaseListPage(SearchCalcVO scVO,  @RequestParam(required=false, defaultValue="1")String current_page, Model model) {
		
		//����ȭ�鿡�� �����͸� ����� �� �ֵ��� Model�� ����
		CalcListService cls=new CalcListService();
		
		//indexList���� �����ϴ� url�� current_page�� ��ȸ�� ���Ǵ� scVO�� �̸��� �ٸ��Ƿ� current_page�� �Ķ���ͷ� �ް� scVO�� �����Ͽ� ��ȸ�Ѵ�.
		scVO.setCurrentPage(Integer.parseInt(current_page));
		
		int totalCount=cls.totalCount(scVO);
		//System.out.println("--------------"+totalCount);
		int pageScale=cls.pageScale();
		int totalPage=cls.totalPage(pageScale, totalCount);
		int startNum=cls.startNum(pageScale, scVO.getCurrentPage()==0?1:scVO.getCurrentPage());
		int endNum=cls.endNum(pageScale, startNum);
		
		
		//���� ������ ��ȸ�� ���� �� �ְ� VO�� ����
		scVO.setStartNum(startNum);
		scVO.setEndNum(endNum);
		
		IndexListVO ilVO=new IndexListVO(scVO.getCurrentPage(), totalPage, "admin_calc_purchase.do");
		cls.indexList(ilVO);
		
		String indexList=cls.indexList(ilVO);
		
		List<PurchaseListDomain> puchaseList=cls.searchList(scVO);
		model.addAttribute("purchaseData", puchaseList);  //bookData?  ////////////
		model.addAttribute("indexList", indexList); //�ε�������Ʈ
		
		return "admin_calc_purchase";
	}//purchaseListPage
	
	@RequestMapping(value="admin_calc_rental.do", method= {GET,POST})
	public String rentalListPage(SearchCalcVO scVO,  @RequestParam(required=false, defaultValue="1")String current_page, Model model) {
		
		//����ȭ�鿡�� �����͸� ����� �� �ֵ��� Model�� ����
		CalcListService cls=new CalcListService();
		
		//indexList���� �����ϴ� url�� current_page�� ��ȸ�� ���Ǵ� scVO�� �̸��� �ٸ��Ƿ� current_page�� �Ķ���ͷ� �ް� scVO�� �����Ͽ� ��ȸ�Ѵ�.
		scVO.setCurrentPage(Integer.parseInt(current_page));
		
		int totalCount=cls.totalCount(scVO);
		//System.out.println("--------------"+totalCount);
		int pageScale=cls.pageScale();
		int totalPage=cls.totalPage(pageScale, totalCount);
		int startNum=cls.startNum(pageScale, scVO.getCurrentPage()==0?1:scVO.getCurrentPage());
		int endNum=cls.endNum(pageScale, startNum);
		
		
		//���� ������ ��ȸ�� ���� �� �ְ� VO�� ����
		scVO.setStartNum(startNum);
		scVO.setEndNum(endNum);
		
		IndexListVO ilVO=new IndexListVO(scVO.getCurrentPage(), totalPage, "admin_calc_rental.do");
		cls.indexList(ilVO);
		
		String indexList=cls.indexList(ilVO);
		
		List<RentalListDomain> rentalList=cls.searchRentalList(scVO);
		model.addAttribute("rentalData", rentalList);  //bookData?  ////////////
		model.addAttribute("indexList", indexList); //�ε�������Ʈ
		
		return "admin_calc_rental";
	}//rentalListPage
	
}//class
