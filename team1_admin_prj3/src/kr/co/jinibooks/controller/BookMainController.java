package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jinibooks.domain.BookDetailDomain;
import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.service.BookListService;
import kr.co.jinibooks.service.BookMainService;
import kr.co.jinibooks.vo.BookInsertVO;
import kr.co.jinibooks.vo.BookUpdateVO;
import kr.co.jinibooks.vo.IndexListVO;
import kr.co.jinibooks.vo.SearchBookVO;

@Controller
public class BookMainController {
	@RequestMapping(value="admin_book_list.do", method= {GET,POST})
	public String bookListPage(SearchBookVO sbVO, @RequestParam(required=false, defaultValue="1")String current_page, HttpServletRequest request, Model model) {
		
		//@RequestParam(required=false, defaultValue="0")int sale_price, //////////////////
		//����ȭ�鿡�� �����͸� ����� �� �ֵ��� Model�� ����
		BookListService bls=new BookListService();
		
		//sbVO=new SearchVO();
		//indexList���� �����ϴ� url�� current_page�� ��ȸ�� ���Ǵ� sbVO�� �̸��� �ٸ��Ƿ� current_page�� �Ķ���ͷ� �ް� sbVO�� �����Ͽ� ��ȸ�Ѵ�.
		sbVO.setCurrentPage(Integer.parseInt(current_page));
		//sbVO.setSale_price(sale_price);
		
		int totalCount=bls.totalCount(sbVO);
		//System.out.println("--------------"+totalCount);
		int pageScale=bls.pageScale();
		int totalPage=bls.totalPage(pageScale, totalCount);
		int startNum=bls.startNum(pageScale, sbVO.getCurrentPage()==0?1:sbVO.getCurrentPage());
		int endNum=bls.endNum(pageScale, startNum);
		
		//���� ������ ��ȸ�� ���� �� �ְ� VO�� ����
		sbVO.setStartNum(startNum);
		sbVO.setEndNum(endNum);
		
		IndexListVO ilVO=new IndexListVO(sbVO.getCurrentPage(), totalPage, "admin_book_list.do");
		//bls.indexList(ilVO);
		
		String indexList=bls.indexList(ilVO, sbVO, request);
		
		List<BookListDomain> bookList=bls.searchList(sbVO);
		model.addAttribute("bookData", bookList);  //?
		model.addAttribute("indexList", indexList); //�ε�������Ʈ
		
		return "admin_book_list";
	}//bookListPage
	
	@RequestMapping(value="admin_book_detail_modify.do", method=GET) //��ũ�� Ÿ�� method�� �θ��� ��û��� : GET
	public String searchBookData(String book_code, Model model) {
		
		BookMainService bms=new BookMainService();
		BookDetailDomain bdd=bms.searchOneBook(book_code);
		
		model.addAttribute("bookDetailData", bdd);
		model.addAttribute("cateKorean", bms.cateCodeToKorean(bdd.getCategory_code()));
		model.addAttribute("cateEnglish", bms.cateCodeToEnglish(bdd.getCategory_code()));
		
		return "admin_book_detail_modify";
	}//searchBookData    
	
	@RequestMapping(value="admin_book_detail_modify_process.do", method=POST)
	@ResponseBody
	public String modifyBookData(BookUpdateVO buVO, @RequestParam("upfile") MultipartFile multipartFile) {
		
		BookMainService bms=new BookMainService();
		JSONObject json=bms.modifyBook(buVO ,multipartFile);
		
		return json.toJSONString();
	}//modifyBookData
	
	@RequestMapping(value="admin_book_delete_process.do", method=POST)
	@ResponseBody
	public String removeBookData(String book_code, Model model) {
		
		BookMainService bms=new BookMainService();
		JSONObject json=bms.removeBook(book_code);
		model.addAttribute("deleteFlag", json);  // "deleteFlag' �̰� ���� ����..?
		
		return json.toJSONString();
	}//removeBookData
	
	@RequestMapping(value="admin_book_regist.do", method=GET)
	public String addBookForm() {
		
		return "admin_book_regist";
	}//addEmpForm
	
	@RequestMapping(value="admin_book_regist_process.do", method=POST)
	@ResponseBody
	//public String addBookData(BookInsertVO biVO, MultipartHttpServletRequest request) {
	public String addBookData(BookInsertVO biVO, @RequestParam("upfile") MultipartFile multipartFile) {

		//����ó��Ŭ������ ��üȭ
		BookMainService bms=new BookMainService();
		//����ó��
		JSONObject json=bms.addBook(biVO,multipartFile);

		return json.toJSONString();
	}//addBookData
	
}//class
