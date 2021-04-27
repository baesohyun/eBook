package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;
import kr.co.jinibooks.vo.SearchCalcVO;


public class CalcDAO {
	
	private static CalcDAO cDao;
	private static SqlSessionFactory ssf;
	
	private CalcDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static CalcDAO getInstance() {
		if(cDao == null) {
			cDao=new CalcDAO();
		}//end if
		return cDao;
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
	
	public List<PurchaseListDomain> selectAllPurchase() throws SQLException {
		List<PurchaseListDomain> list=null;
		
		//4. Handler얻기
		try {
			SqlSession ss=getSessionFactory().openSession();
			//parameterType 속성이 없기 때문에 아이디만 넣는다.
			list=ss.selectList("kr.co.jinibooks.dao.mapper.CalcMapper.selectAllCalc"); // mapper.xml에서 설정한 ID
			
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectAllPurchase
	
	public List<RentalListDomain> selectAllRental() throws SQLException {
		List<RentalListDomain> list=null;
		
		//4. Handler얻기
		try {
			SqlSession ss=getSessionFactory().openSession();
			//parameterType 속성이 없기 때문에 아이디만 넣는다.
			list=ss.selectList("kr.co.jinibooks.dao.mapper.CalcMapper.selectAllRental"); // mapper.xml에서 설정한 ID
			
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectAllRental
	
//	public List<PurchaseListDomain> selectCalcCondition(SearchCalcVO scVO) throws SQLException{  //구매 정산 검색 조건
//		List<PurchaseListDomain> list=null;
//
//		try {
//			SqlSession ss=getSessionFactory().openSession();
//			list=ss.selectList("kr.co.jinibooks.dao.mapper.CalcMapper.selectCalcCondition",scVO);  
//			ss.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}//end catch
//		
//		return list;
//	}//selectCalcCondition
//	
//	public List<RentalListDomain> selectRentalCondition(SearchCalcVO scVO) throws SQLException{  //대여 정산 검색 조건
//		List<RentalListDomain> list=null;
//		
//		try {
//			SqlSession ss=getSessionFactory().openSession();
//			list=ss.selectList("kr.co.jinibooks.dao.mapper.CalcMapper.selectRentalCondition",scVO);  
//			ss.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}//end catch
//		
//		return list;
//	}//selectRentalCondition

}
