package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.SearchMPMyBookPayDomain;
import kr.co.jinibooks.domain.SearchMPMyBookRentalDomain;

public class MyPageMyBookDAO {

	
	private static MyPageMyBookDAO mbDao;
	private static SqlSessionFactory ssf;
	
	private MyPageMyBookDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static MyPageMyBookDAO getInstance() {
		if(mbDao==null) {
			mbDao=new MyPageMyBookDAO();
		}//end if
		return mbDao;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory() throws IOException{
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
				if(reader!=null) {reader.close();}//end if
			}//end finally
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<SearchMPMyBookRentalDomain> selectRentalBook(String id) throws SQLException{
		List<SearchMPMyBookRentalDomain> rentalList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			rentalList=ss.selectList("selectMPMyBookRental",id);
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return rentalList;
	}//selectRentalBook
	
	public List<SearchMPMyBookPayDomain> selectPayBook(String id) throws SQLException{
		List<SearchMPMyBookPayDomain> payList=null;
		try {
			SqlSession ss=getSessionFactory().openSession();
			payList=ss.selectList("selectMPMyBookPay",id);
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return payList;
	}//selectPayBook
	
}//class
