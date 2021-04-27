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
		//indexList���� �����ϴ� url�� current_page�� ��ȸ�� ���Ǵ� sVO�� currentPage�� �ٸ����� 
		//current_page�� parameter�� �ް� sVO�� set�Ͽ� �ݴϴ�.
		sVO.setCurrentPage(Integer.parseInt(current_page));
		
		//��2������ ��ü�� �ڽ��� ��������
		//�����ӿ�ũ������ ������ ��ũ�� ����� �ش�.
		//�������� VO�� null���� Ȯ���� �ʿ䰡 ����.
		
		QuestionBoardListService bls = new QuestionBoardListService();
		int totalCount = bls.totalCount(sVO);
		
		
		int pageScale = bls.pageScale();
		int totalPage = bls.totalPage(pageScale, totalCount);
		int startNum = bls.startNum(pageScale, sVO.getCurrentPage());
		int endNum = bls.endNum(pageScale, startNum);
		
		
		//���� ������ ��ȸ�� ���� �� �ְ� VO�� �����մϴ�.
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		
		List<QuestionListDomain> boardList = bls.searchList(sVO);

		IndexListVO ilVO = new IndexListVO(sVO.getCurrentPage(), totalPage, "question.do");
		String indexList = bls.indexList(ilVO,sVO);
		
		model.addAttribute("boardList", boardList);//�Խù� ����Ʈ
		model.addAttribute("indexList", indexList);//�ε��� ����Ʈ
		
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
	  
	  
	  //����ó�� Ŭ������ ��üȭ 
	QuestionBoardListService ces=new QuestionBoardListService(); 
	//����ó�� 
	boolean flag=ces.insertnotice(ceiVO); //view�� ������ ����.
	  model.addAttribute("insertFlag", flag);
	  
	  return "day1202/admin_question_success"; }//addEmpProcess
	  
	  
	  @RequestMapping(value = "delete_process2.do", method = POST) public String
	  DeleteNoticeProcess(QuestionVO ceiVO, Model model) {
	  
	  
	  //����ó�� Ŭ������ ��üȭ 
	QuestionBoardListService ces=new QuestionBoardListService(); //����ó�� 
	boolean flag=ces.deletenotice(ceiVO); //view�� ������ ����.
	  model.addAttribute("deleteFlag", flag);
	  
	  return "day1202/admin_question_success"; }//addEmpProcess

}//class
