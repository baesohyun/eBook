package kr.co.jinibooks.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jinibooks.dao.BookDAO;
import kr.co.jinibooks.dao.UseMyBatisBook;
import kr.co.jinibooks.domain.BookDetailDomain;
import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.vo.BookInsertVO;
import kr.co.jinibooks.vo.BookUpdateVO;

public class BookMainService {
	
		public List<BookListDomain> selectBook() {
			List<BookListDomain> list=null;
			//DAO���� Ŭ������ �����Ͽ� DB�� ������ �޴´�.
			UseMyBatisBook um=new UseMyBatisBook();
			list=um.mybatisBook();
			
			return list;
		}//selectBook
		
		public BookDetailDomain searchOneBook(String book_code) {
			BookDetailDomain bdd=null;
			
			BookDAO bDao=BookDAO.getInstance();
			
			try {
				bdd=bDao.selectBookDetail(book_code);
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return bdd;
		}//searchOneBook
		
		
		public JSONObject modifyBook(BookUpdateVO buVO, MultipartFile multipartFile) {
			boolean flag=false;
			JSONObject json=new JSONObject();
			
			buVO.setImg(multipartFile.getOriginalFilename());
			
			//���� ������
			//1. ī�װ� �ڵ� �����ͼ� �ش� ���� �̸� ã��
			String cateCode = buVO.getCategory_code();
			String cate = cateCodeToEnglish(cateCode);
			
			System.out.println("C:/dev/workspace/team1_admin_prj3/WebContent/common/images/book/"+cate+"/"+multipartFile.getOriginalFilename());

			//2. ��� ����
			File file = new File("C:/dev/workspace/team1_admin_prj3/WebContent/common/images/book/"+cate+"/"+multipartFile.getOriginalFilename());
			
			try {
				//3. ���� ������
				multipartFile.transferTo(file);
			} catch (IllegalStateException ise) {
				ise.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}//end catch
			
			BookDAO bDao=BookDAO.getInstance();
			try {
				int temp=bDao.updateBook(buVO);
				flag=temp==1;  //1�̸�	 true
				System.out.println(temp);
				json.put("updateResult", flag);
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return json;
		}//modifyBook
		
		public JSONObject removeBook(String book_code) {
			boolean flag=false;
			
			JSONObject json=new JSONObject();
			
			BookDAO bDao=BookDAO.getInstance();
			
			try {
				int temp=bDao.deleteBook(book_code);
				flag=temp==1;  //1�̸� true
				System.out.println(temp);
				json.put("deleteResult", flag);
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return json;
		}//modifyBook
		
		public JSONObject addBook(BookInsertVO biVO, MultipartFile multipartFile) {
			boolean flag=false;
			JSONObject json=new JSONObject();
			
			//BookInsertVO�� img�� null�̱� ������ ���ϸ��� ������ set�Ͽ� �ݴϴ�.
			biVO.setImg(multipartFile.getOriginalFilename());
			
			//���� ������
			//1. ī�װ� �ڵ� �����ͼ� �ش� ���� �̸� ã��
			String cateCode = biVO.getCategory_code();
			String cate = cateCodeToEnglish(cateCode);

			System.out.println("C:/dev/workspace/team1_admin_prj3/WebContent/common/images/book/"+cate+"/"+multipartFile.getOriginalFilename());
			
			//2. ��� ����
			File file = new File("C:/dev/workspace/team1_admin_prj3/WebContent/common/images/book/"+cate+"/"+multipartFile.getOriginalFilename());
			
			try {
				//3. ���� ������
				multipartFile.transferTo(file);
			} catch (IllegalStateException ise) {
				ise.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}//end catch
			
			//DAO�� ����Ͽ�
			BookDAO bDao=BookDAO.getInstance();
			try {
				//�������� �����ϰ� ����� ��´�.
				int temp=bDao.insertBook(biVO);
				flag=temp==1;  //1�̸� true
				System.out.println(temp);
				json.put("insertResult", flag);
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return json;
		}//addBook
		
		public String cateCodeToEnglish(String cateCode) {
			String cateEnglish = null;
			switch (cateCode) {
				case "BC_000001": cateEnglish = "novel"; break;
				case "BC_000002": cateEnglish = "business"; break;
				case "BC_000003": cateEnglish = "humanities"; break;
				case "BC_000004": cateEnglish = "self-improvement"; break;
				case "BC_000005": cateEnglish = "essay_poem"; break;
				case "BC_000006": cateEnglish = "travle"; break;
				case "BC_000007": cateEnglish = "science_it"; break;
				case "BC_000008": cateEnglish = "health_diet"; break;
				case "BC_000009": cateEnglish = "comic"; break;
		    }//end switch case
		    //System.out.println("ī�װ� �ڵ�: "+cateCode);
		    //System.out.println("ī�װ� ��: "+cateEnglish);
			System.out.println(cateEnglish);
			
			return cateEnglish;
		}//cateCodeToEnglish
		
		public String cateCodeToKorean(String cateCode) {
			String cateKorean = null;
			switch (cateCode) {
				case "BC_000001": cateKorean = "�Ҽ�"; break;
				case "BC_000002": cateKorean = "�濵/����"; break;
				case "BC_000003": cateKorean = "�ι�/��ȸ/����"; break;
				case "BC_000004": cateKorean = "�ڱ���"; break;
				case "BC_000005": cateKorean = "������/��"; break;
				case "BC_000006": cateKorean = "����"; break;
				case "BC_000007": cateKorean = "����/��ǻ��/IT"; break;
				case "BC_000008": cateKorean = "�ǰ�/���̾�Ʈ"; break;
				case "BC_000009": cateKorean = "��ȭ"; break;
		    }//end switch case
			//System.out.println("ī�װ� �ڵ�: "+cateCode);
		    //System.out.println("ī�װ� ��: "+cateKorean);
			
			return cateKorean;
		}//cateCodeToKorean
		

}//class

