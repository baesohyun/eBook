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
import kr.co.jinibooks.vo.SearchBookVO;

public class BookListDAO {
	
	private static BookListDAO blDao;
	private static SqlSessionFactory ssf;
	
	private BookListDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}
	
	public static BookListDAO getInstance() {
		if(blDao == null) {
			blDao=new BookListDAO();
		}//end if
		return blDao;
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
	
	public int selectTotalCount(SearchBookVO sbVO) throws SQLException{
		int cnt=0;
		//MyBatis Handler ���
		try {
			SqlSession ss=getSessionFactory().openSession();
			//���� ���� �� ��� �ޱ�
			cnt=ss.selectOne("kr.co.jinibooks.dao.BookListMapper.selectTotalCount", sbVO);  // selectTotalCount mapper3���ִ� ���̵�
			//MyBatis Handler����
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}//selectTotalCount
	
	
	public List<BookListDomain> selectBoardList(SearchBookVO sbVO) throws SQLException{
		List<BookListDomain> list=null;
		//System.out.println(sbVO);
		try {
			SqlSession ss=getSessionFactory().openSession();
			list=ss.selectList("kr.co.jinibooks.dao.BookListMapper.selectBookList", sbVO);
			ss.close();
			
			System.out.println(list);
			
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectBoardList
	
}//class
