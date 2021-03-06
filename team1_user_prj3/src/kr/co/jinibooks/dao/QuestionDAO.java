package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.QuestionListDomain;
import kr.co.jinibooks.vo.QuestionSearchVO;
import kr.co.jinibooks.vo.QuestionVO;


public class QuestionDAO {
    
	private static QuestionDAO qDAO;
	private static SqlSessionFactory ssf;
	
	private QuestionDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();	
	}//SelectDAO
	
	public static QuestionDAO getInstance() {
		if (qDAO == null) {
			qDAO = new QuestionDAO();
		}//end if
		return qDAO;
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
	
	public int selectTotalCount(QuestionSearchVO sVO) throws SQLException {
		int cnt = 0;
		
		try {
			//Mybatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//쿼리 수행 후 결과 받기
			cnt = ss.selectOne("selectTotalCount2", sVO);
			//끊기
			ss.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return cnt;
	}//selectTotalCount
	
	public List<QuestionListDomain> selectBoardList(QuestionSearchVO sVO) throws SQLException {
		List<QuestionListDomain> list = null;
		
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("selectBoardList2", sVO);
			ss.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return list;
	}//selectBoardList
	
	
//	public BoardListDomain2 selectEmpDetail(String num)throws SQLException {
//		BoardListDomain2 edd=null;
//		
//		try {
//			SqlSession ss=getSessionFactory().openSession();
//			edd=ss.selectOne("selectEmpDetail",num);
//			ss.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return edd;
//	}//selectEmpDetail
//	
	public List<QuestionListDomain> multiColumnMultiRow(){
		List<QuestionListDomain> empList=null;
		
		try {
			//Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//입력되는 값 없이 모든 레코드를 조회
			empList=ss.selectList("multiColumnMultiRow",30);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return empList;
	}//multiColumnMultiRow
	
	public QuestionListDomain selectDetailNotice(String num)throws SQLException{
		
		QuestionListDomain bld=null;
		
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			bld=ss.selectOne("QuestionDetail",num);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return bld;
		
	}//
	
	public int insertNotice(QuestionVO ceiVO) throws SQLException {
		int cnt = 0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			cnt = ss.insert("QuestionInsert",ceiVO);
			//transaction처리
			ss.commit();
			//Handler를 사용 완료 했다면 종료한다.
			ss.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return cnt;
	}//insertCpEmp
	
	
	
}//class
