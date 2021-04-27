package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.MypageDAO;
import kr.co.jinibooks.domain.BookDomain;

public class MypageService {

	public List<BookDomain> searchPayBookList_5(String id){
		List<BookDomain> list = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		try {
			list = mDAO.selectpayBookList_5(id);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setCategory(cateCodeToEnglish(list.get(i).getCategory()));
			}//end for
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return list;
	}//searchPayBookList_5
	
	public List<BookDomain> searchPayBookList_All(String id){
		List<BookDomain> list = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		try {
			list = mDAO.selectpayBookList_All(id);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}//end catch
		
		return list;
	}//selectpayBookList_All
	
	public String cateCodeToEnglish(String cateCode) {
		String cateEnglish = null;
		switch (cateCode) {
			case "BC_000001": cateEnglish = "novel"; break;
			case "BC_000002": cateEnglish = "business_economy"; break;
			case "BC_000003": cateEnglish = "humanities"; break;
			case "BC_000004": cateEnglish = "self-improvement"; break;
			case "BC_000005": cateEnglish = "essay_poem"; break;
			case "BC_000006": cateEnglish = "travle"; break;
			case "BC_000007": cateEnglish = "science_it"; break;
			case "BC_000008": cateEnglish = "health_diet"; break;
			case "BC_000009": cateEnglish = "comic"; break;
	    }//end switch case
	    //System.out.println("카테고리 코드: "+cateCode);
	    //System.out.println("카테고리 명: "+cateEnglish);
		System.out.println(cateEnglish);
		
		return cateEnglish;
	}//cateCodeToEnglish
	
	public String cateCodeToKorean(String cateCode) {
		String cateKorean = null;
		switch (cateCode) {
			case "BC_000001": cateKorean = "소설"; break;
			case "BC_000002": cateKorean = "경영/경제"; break;
			case "BC_000003": cateKorean = "인문/사회/역시"; break;
			case "BC_000004": cateKorean = "자기계발"; break;
			case "BC_000005": cateKorean = "에세이/시"; break;
			case "BC_000006": cateKorean = "여행"; break;
			case "BC_000007": cateKorean = "과학/컴퓨터/IT"; break;
			case "BC_000008": cateKorean = "건강/다이어트"; break;
			case "BC_000009": cateKorean = "만화"; break;
	    }//end switch case
		//System.out.println("카테고리 코드: "+cateCode);
	    //System.out.println("카테고리 명: "+cateKorean);
		
		return cateKorean;
	}//cateCodeToKorean
	
}
