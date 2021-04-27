package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jinibooks.domain.QuestionListDomain;
import kr.co.jinibooks.service.QuestionBoardListService;
import kr.co.jinibooks.vo.IndexListVO;
import kr.co.jinibooks.vo.QuestionSearchVO;
import kr.co.jinibooks.vo.QuestionVO;

@Controller
public class Question_Controller {
	
	@RequestMapping(value="question.do",method= {GET,POST})
	public String searchList(QuestionSearchVO sVO, 
			@RequestParam(required = false, defaultValue = "1")String current_page, Model model) {
		//indexList에서 제공하는 url인 current_page가 조회에 사용되는 sVO의 currentPage와 다름으로 
		//current_page를 parameter로 받고 sVO에 set하여 줍니다.
		sVO.setCurrentPage(Integer.parseInt(current_page));
		
		//모델2에서는 객체를 자신이 만들지만
		//프레임워크에서는 프레임 워크가 만들어 준다.
		//쿼리에서 VO가 null인지 확인할 필요가 없다.
		
		QuestionBoardListService bls = new QuestionBoardListService();
		int totalCount = bls.totalCount(sVO);
		
		
		int pageScale = bls.pageScale();
		int totalPage = bls.totalPage(pageScale, totalCount);
		int startNum = bls.startNum(pageScale, sVO.getCurrentPage());
		int endNum = bls.endNum(pageScale, startNum);
		
		
		//계산된 값으로 조회에 사용될 수 있게 VO에 설정합니다.
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		List<QuestionListDomain> boardList = bls.searchList(sVO);

		IndexListVO ilVO = new IndexListVO(sVO.getCurrentPage(), totalPage, "question.do");
		String indexList = bls.indexList(ilVO,sVO);
		
		model.addAttribute("boardList", boardList);//게시물 리스트
		model.addAttribute("indexList", indexList);//인덱스 리스트
		
		return "day1202/admin_question";
//		return "day1202/list";
	}//searchList
	
	
	  @RequestMapping(value = "detail2.do",method = GET) public String
	  noticedetail(@RequestParam(required = false,defaultValue = "i_000000")String
	  num,Model model) {
	 
	  QuestionBoardListService bls=new QuestionBoardListService(); 
	  QuestionListDomain  bld=bls.searchNoticeDetail(num);
	  model.addAttribute("question_detail",bld);
	  return "day1202/admin_question_modified"; }//searchEmpData
	  
	  @RequestMapping(value = "modified_process2.do", method = POST) public String
	  InsertNoticeProcess(QuestionVO ceiVO, Model model) {
	  
	  
	  //업무처리 클래스를 객체화 
	QuestionBoardListService ces=new QuestionBoardListService(); 
	//업무처리 
	boolean flag=ces.insertnotice(ceiVO); //view로 데이터 전달.
	  model.addAttribute("insertFlag", flag);
	  
	  return "day1202/admin_question_success"; }//addEmpProcess
	  
	  
	  @RequestMapping(value = "delete_process2.do", method = POST) public String
	  DeleteNoticeProcess(QuestionVO ceiVO, Model model) {
	  
	  
	  //업무처리 클래스를 객체화 
	QuestionBoardListService ces=new QuestionBoardListService(); //업무처리 
	boolean flag=ces.deletenotice(ceiVO); //view로 데이터 전달.
	  model.addAttribute("deleteFlag", flag);
	  
	  return "day1202/admin_question_success"; }//addEmpProcess

}//class
