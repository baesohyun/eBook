package kr.co.jinibooks.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jinibooks.domain.NoticeListDomain;
import kr.co.jinibooks.service.NoticeBoardListService;
import kr.co.jinibooks.vo.BoardIndexListVO;
import kr.co.jinibooks.vo.NoticeSearchVO;
import kr.co.jinibooks.vo.NoticeVO;

@Controller
public class Notice_Controller {
	
	@RequestMapping(value="notice.do",method= {GET,POST})
	public String searchList(NoticeSearchVO nsVO, 
			@RequestParam(required = false, defaultValue = "1")String current_page, Model model) {
		//indexList에서 제공하는 url인 current_page가 조회에 사용되는 sVO의 currentPage와 다름으로 
		//current_page를 parameter로 받고 sVO에 set하여 줍니다.
		nsVO.setCurrentPage(Integer.parseInt(current_page));
		
		//모델2에서는 객체를 자신이 만들지만
		//프레임워크에서는 프레임 워크가 만들어 준다.
		//쿼리에서 VO가 null인지 확인할 필요가 없다.
		
		NoticeBoardListService bls = new NoticeBoardListService();
		int totalCount = bls.totalCount(nsVO);
		
		int pageScale = bls.pageScale();
		int totalPage = bls.totalPage(pageScale, totalCount);
		int startNum = bls.startNum(pageScale, nsVO.getCurrentPage());
		int endNum = bls.endNum(pageScale, startNum);
		
		
		//계산된 값으로 조회에 사용될 수 있게 VO에 설정합니다.
		nsVO.setStartNum(startNum);
		nsVO.setEndNum(endNum);
		
		List<NoticeListDomain> boardList = bls.searchList(nsVO);

		BoardIndexListVO ilVO = new BoardIndexListVO(nsVO.getCurrentPage(), totalPage, "notice.do");
		String indexList = bls.indexList(ilVO,nsVO);
		
		model.addAttribute("boardList", boardList);//게시물 리스트
		model.addAttribute("indexList", indexList);//인덱스 리스트
		
		return "board/user_notice";
//		return "day1202/list";
	}//searchList
	
	@RequestMapping(value = "detail.do",method = GET)
	public String noticedetail(@RequestParam(required = false,defaultValue = "N_000000")String num,Model model) {
		
		NoticeBoardListService bls=new NoticeBoardListService();
		NoticeListDomain bld=bls.searchNoticeDetail(num);
		model.addAttribute("notice_detail",bld);
		return "board/user_notice_detail";
	}//searchEmpData
	
	@RequestMapping(value = "modified_process.do", method = POST)
	public String InsertNoticeProcess(NoticeVO ceiVO, Model model) {
		
		
		//업무처리 클래스를 객체화
		NoticeBoardListService ces=new NoticeBoardListService();
		//업무처리
		boolean flag=ces.insertnotice(ceiVO);
		//view로 데이터 전달.
		model.addAttribute("insertFlag", flag);
		
		return "board/admin_notice_success";
	}//addEmpProcess
	
	@RequestMapping(value = "faq.do", method = {GET,POST})
	public String Faq() {
		
		return  "board/user_notice_faq";
	}//addEmpForm
	
	@RequestMapping(value = "delete_process.do", method = POST)
	public String DeleteNoticeProcess(NoticeVO ceiVO, Model model) {
		
		
		//업무처리 클래스를 객체화
		NoticeBoardListService ces=new NoticeBoardListService();
		//업무처리
		boolean flag=ces.deletenotice(ceiVO);
		//view로 데이터 전달.
		model.addAttribute("deleteFlag", flag);
		
		return "board/admin_notice_success";
	}//addEmpProcess
	
}//class
