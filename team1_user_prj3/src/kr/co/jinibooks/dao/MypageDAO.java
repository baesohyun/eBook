package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.BookDomain;

public class MypageDAO {
    
	private static MypageDAO mDAO;
	private static SqlSessionFactory ssf;
	
	private MypageDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();	
	}//CpEmpDAO
	
	public static MypageDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MypageDAO();
		}//end if
		return mDAO;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory() throws IOException {
		if(ssf == null) {
			Reader reader = null;
			try {
				//1. 설정용 xml을 스트림으로 연결
				reader = Resources.getResourceAsReader("kr/co/jinibooks/dao/mybatis-config.xml");
				//2. SqlSessionFactoryBuilder 생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				//3. SqlSessionFactory 얻기
				ssf = ssfb.build(reader);
			} finally {
				if(reader != null) {reader.close();}//end if
			}//end finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<BookDomain> selectpayBookList_5(String id) throws SQLException {
		List<BookDomain> list = null;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			list = ss.selectList("kr.co.jinibooks.dao.maypage_mapper.payBookList_5",id);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return list;
	}//selectpayBookList_5
	
	public List<BookDomain> selectpayBookList_All(String id) throws SQLException {
		List<BookDomain> list = null;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			list = ss.selectList("kr.co.jinibooks.dao.maypage_mapper.payBookList_All",id);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return list;
	}//selectpayBookList_All

	
}//class
