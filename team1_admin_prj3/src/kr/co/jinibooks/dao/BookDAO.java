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
				//1. 설정용 xml을 스트림으로 연결
				reader=Resources.getResourceAsReader("kr/co/jinibooks/dao/mybatis-config.xml");
				//2. SqlSessionFactoryBuilder 생성
				SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
				//3. SqlSessionFactory 얻기
				ssf=ssfb.build(reader);
				
			}finally {
				if(reader !=null) {reader.close();} //end if
			}//end finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<BookListDomain> selectAllBook() throws SQLException {
		List<BookListDomain> list=null;
		
		//4. Handler얻기
		try {
			SqlSession ss=getSessionFactory().openSession();
			//parameterType 속성이 없기 때문에 아이디만 넣는다.
			list=ss.selectList("kr.co.jinibooks.dao.mapper.BookMapper.selectAllBook"); // mapper.xml에서 설정한 ID
			
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
//			list=ss.selectList("searchBookCondition",bsVO);  //mapper.xml에 정해져있는 ID
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
			//MyBatis Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//쿼리 수행하고
			System.out.println(buVO);
			cnt=ss.update("kr.co.jinibooks.dao.mapper.BookMapper.updateBook",buVO);  //네임스페이스 사용해 ID를 유일하게 사용
			//결과에 따라 Transaction을 완료.
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
			//1. MyBatis Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//2. 쿼리 수행
			cnt=ss.delete("kr.co.jinibooks.dao.mapper.BookMapper.deleteBook",book_code);
		 
			//3. Transaction 완료
			if(cnt==1) { //북코드로 지우기 떄문에 1건만 삭제
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
				//4. MyBatis Handler 얻기
				SqlSession ss=getSessionFactory().openSession();
				//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻는다.
				cnt=ss.insert("kr.co.jinibooks.dao.mapper.BookMapper.insertBook", biVO);
				//transaction 처리 
				ss.commit();
				
				//Handler를 사용완료 했다면 종료한다
				ss.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		return cnt;
	}//insertCpEmp


}
