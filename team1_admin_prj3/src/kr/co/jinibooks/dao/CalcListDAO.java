package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;
import kr.co.jinibooks.vo.SearchBookVO;
import kr.co.jinibooks.vo.SearchCalcVO;

public class CalcListDAO {
	
	private static CalcListDAO clDao;
	private static SqlSessionFactory ssf;
	
	private CalcListDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static CalcListDAO getInstance() {
		if(clDao == null) {
			clDao=new CalcListDAO();
		}//end if
		return clDao;
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
	
	public int selectTotalCount(SearchCalcVO scVO) throws SQLException{
		int cnt=0;
		//MyBatis Handler ���
		try {
			SqlSession ss=getSessionFactory().openSession();
			//���� ���� �� ��� �ޱ�
			cnt=ss.selectOne("kr.co.jinibooks.dao.CalcListMapper.selectTotalCount", scVO);  // selectTotalCount mapper���ִ� ���̵�
			//MyBatis Handler����
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}//selectTotalCount
	
	/////////////////////////////////////
	public int selectTotalCountR(SearchCalcVO scVO) throws SQLException{
		int cnt=0;
		//MyBatis Handler ���
		try {
			SqlSession ss=getSessionFactory().openSession();
			//���� ���� �� ��� �ޱ�
			cnt=ss.selectOne("kr.co.jinibooks.dao.CalcListMapper.selectTotalCountR", scVO);  // selectTotalCount mapper���ִ� ���̵�
			//MyBatis Handler����
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}//selectTotalCountR
	
	
	public List<PurchaseListDomain> selectPurchaseList(SearchCalcVO scVO) throws SQLException{
		List<PurchaseListDomain> list=null;
		System.out.println(scVO);
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("kr.co.jinibooks.dao.CalcListMapper.selectPurchaseList", scVO);
			System.out.println(list);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectPurchaseList
	
	public List<RentalListDomain> selectRentalList(SearchCalcVO scVO) throws SQLException{
		List<RentalListDomain> list=null;
		System.out.println(scVO);
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("kr.co.jinibooks.dao.CalcListMapper.selectRentalList", scVO);

			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectRentalList
	
}//class
