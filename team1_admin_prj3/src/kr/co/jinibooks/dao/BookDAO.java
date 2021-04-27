package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.BookDetailDomain;
import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.vo.BookInsertVO;
import kr.co.jinibooks.vo.BookUpdateVO;


public class BookDAO {
	
	private static BookDAO bDao;
	private static SqlSessionFactory ssf;
	
	private BookDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static BookDAO getInstance() {
		if(bDao == null) {
			bDao=new BookDAO();
		}//end if
		return bDao;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory() throws IOException {
		if(ssf==null) {
			Reader reader=null;
			
			try {
				//1. ������ xml�� ��Ʈ������ ����
				reader=Resources.getResourceAsReader("kr/co/jinibooks/dao/mybatis-config.xml");
				//2. SqlSessionFactoryBuilder ����
				SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
				//3. SqlSessionFactory ���
				ssf=ssfb.build(reader);
				
			}finally {
				if(reader !=null) {reader.close();} //end if
			}//end finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<BookListDomain> selectAllBook() throws SQLException {
		List<BookListDomain> list=null;
		
		//4. Handler���
		try {
			SqlSession ss=getSessionFactory().openSession();
			//parameterType �Ӽ��� ���� ������ ���̵� �ִ´�.
			list=ss.selectList("kr.co.jinibooks.dao.mapper.BookMapper.selectAllBook"); // mapper.xml���� ������ ID
			
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectAllBook
	
	public BookDetailDomain selectBookDetail(String book_code) throws SQLException{
		BookDetailDomain bdd=null;
		
		//MyBatis Handlers
		try {
			SqlSession ss=getSessionFactory().openSession();
			bdd=ss.selectOne("kr.co.jinibooks.dao.mapper.BookMapper.selectBookDetail", book_code);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return bdd;
	}//selectBookDetail
	
//	public List<BookListDomain> searchBookCondition(BookSearchVO bsVO) throws SQLException{
//		List<BookListDomain> list=null;
//
//		try {
//			SqlSession ss=getSessionFactory().openSession();
//			list=ss.selectList("searchBookCondition",bsVO);  //mapper.xml�� �������ִ� ID
//			ss.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}//end catch
//		
//		return list;
//	}//selectBookCondition
	
	public int updateBook(BookUpdateVO buVO)  throws SQLException {
		int cnt=0;
		
		try {
			//MyBatis Handler ���
			SqlSession ss=getSessionFactory().openSession();
			//���� �����ϰ�
			System.out.println(buVO);
			cnt=ss.update("kr.co.jinibooks.dao.mapper.BookMapper.updateBook",buVO);  //���ӽ����̽� ����� ID�� �����ϰ� ���
			//����� ���� Transaction�� �Ϸ�.
			if(cnt ==1) {
				ss.commit();
			}//end if
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	return cnt;
}//updateBook
	
	public int deleteBook(String book_code) throws SQLException{ 
		int cnt=0;
		
		try {
			//1. MyBatis Handler ���
			SqlSession ss=getSessionFactory().openSession();
			//2. ���� ����
			cnt=ss.delete("kr.co.jinibooks.dao.mapper.BookMapper.deleteBook",book_code);
		 
			//3. Transaction �Ϸ�
			if(cnt==1) { //���ڵ�� ����� ������ 1�Ǹ� ����
 				ss.commit();
			}//end if
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}//
	
	public int insertBook(BookInsertVO biVO) throws SQLException{
		int cnt=0;
			try {
				//4. MyBatis Handler ���
				SqlSession ss=getSessionFactory().openSession();
				//5. id�� �־� mapper xml���� �ش� ������ parsing�Ͽ� �����ϰ� ����� ��´�.
				cnt=ss.insert("kr.co.jinibooks.dao.mapper.BookMapper.insertBook", biVO);
				//transaction ó�� 
				ss.commit();
				
				//Handler�� ���Ϸ� �ߴٸ� �����Ѵ�
				ss.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		return cnt;
	}//insertCpEmp


}
