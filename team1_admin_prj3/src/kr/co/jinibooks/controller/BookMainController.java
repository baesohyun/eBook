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
		//메인화면에서 데이터를 사용할 수 있도록 Model에 설정
		BookListService bls=new BookListService();
		
		//sbVO=new SearchVO();
		//indexList에서 제공하는 url인 current_page가 조회에 사용되는 sbVO의 이름과 다르므로 current_page를 파라메터로 받고 sbVO에 설정하여 조회한다.
		sbVO.setCurrentPage(Integer.parseInt(current_page));
		//sbVO.setSale_price(sale_price);
		
		int totalCount=bls.totalCount(sbVO);
		//System.out.println("--------------"+totalCount);
		int pageScale=bls.pageScale();
		int totalPage=bls.totalPage(pageScale, totalCount);
		int startNum=bls.startNum(pageScale, sbVO.getCurrentPage()==0?1:sbVO.getCurrentPage());
		int endNum=bls.endNum(pageScale, startNum);
		
		//계산된 값으로 조회에 사용될 수 있게 VO에 설정
		sbVO.setStartNum(startNum);
		sbVO.setEndNum(endNum);
		
		IndexListVO ilVO=new IndexListVO(sbVO.getCurrentPage(), totalPage, "admin_book_list.do");
		//bls.indexList(ilVO);
		
		String indexList=bls.indexList(ilVO, sbVO, request);
		
		List<BookListDomain> bookList=bls.searchList(sbVO);
		model.addAttribute("bookData", bookList);  //?
		model.addAttribute("indexList", indexList); //인덱스리스트
		
		return "admin_book_list";
	}//bookListPage
	
	@RequestMapping(value="admin_book_detail_modify.do", method=GET) //링크를 타고 method를 부를때 요청방식 : GET
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
		model.addAttribute("deleteFlag", json);  // "deleteFlag' 이거 어디랑 연결..?
		
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

		//업무처리클래스를 객체화
		BookMainService bms=new BookMainService();
		//업무처리
		JSONObject json=bms.addBook(biVO,multipartFile);

		return json.toJSONString();
	}//addBookData
	
}//class
