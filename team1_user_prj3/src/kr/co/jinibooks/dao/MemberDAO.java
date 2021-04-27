package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import kr.co.jinibooks.domain.MemberInfoDomain;
import kr.co.jinibooks.vo.IDandEmailandTempPWVO;
import kr.co.jinibooks.vo.JoinVO;
import kr.co.jinibooks.vo.LoginVO;

@Component
public class MemberDAO {
    
	private static MemberDAO mDAO;
	private static SqlSessionFactory ssf;
	
	private MemberDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();	
	}//CpEmpDAO
	
	public static MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
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
	
	public boolean selectIDOverlap(String inputID) throws SQLException {
		boolean flag = false;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			String id = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectIDOverlap",inputID);
			if (id != null) {
				flag = true;
			}//end if
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return flag;
	}//selectIDOverlap
	
	public boolean selectEmailOverlap(String inputEmail) throws SQLException {
		boolean flag = false;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			String email = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectEmailOverlap",inputEmail);
			if (email != null) {
				flag = true;
			}//end if
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return flag;
	}//selectEmailOverlap
	
	public int insertJoin(JoinVO mVO) throws SQLException {
		int cnt = 0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			cnt = ss.insert("kr.co.jinibooks.dao.member_mapper.insertJoin",mVO);
			//transaction 처리
			ss.commit();
			//Handler를 사용 완료 했다면 종료합니다.
			ss.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return cnt;
	}//insertJoin
	
	public String selectIDPW(LoginVO lVO) throws SQLException {
		String name = null;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			name = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectIDPW",lVO);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return name;
	}//selectIDPW
	
	public String selectIDEmail(IDandEmailandTempPWVO idAndEmailAndTempPWVO) throws SQLException {
		String name = null;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			name = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectIDEmail",idAndEmailAndTempPWVO);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return name;
	}//selectIDEmail
	
	public String selectIDWithEmail(String inputEmail) throws SQLException {
		String outputID = "";
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			outputID = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectIDWithEmail",inputEmail);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return outputID;
	}//selectIDWithEmail
	
	public int updateTempPW(IDandEmailandTempPWVO idAndEmailAndTempPWVO) throws SQLException {
		int cnt = 0;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			System.out.println(idAndEmailAndTempPWVO.getInputID());
			System.out.println(idAndEmailAndTempPWVO.getInputEmail());
			System.out.println(idAndEmailAndTempPWVO.getTempPW());
			cnt = ss.update("kr.co.jinibooks.dao.member_mapper.updateTempPW", idAndEmailAndTempPWVO);
			System.out.println("업데이트 통과");
			ss.commit();
			System.out.println("커밋 통과");
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return cnt;
	}//updateTempPW

	public MemberInfoDomain selectMemberInfo(String id) throws SQLException {
		MemberInfoDomain mid = null;
		
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			mid = ss.selectOne("kr.co.jinibooks.dao.member_mapper.selectMemberInfo",id);
			
			ss.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return mid;
	}//selectMemberInfo
	
	public int updateLoginDate(String id) throws SQLException {
		int cnt = 0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻습니다.
			cnt = ss.update("kr.co.jinibooks.dao.member_mapper.updateLoginDate",id);
			//transaction 처리
			ss.commit();
			//Handler를 사용 완료 했다면 종료합니다.
			ss.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}//end catch
		
		return cnt;
	}//updateLoginDate
	
}//class
