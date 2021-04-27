package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.MainNoticeListDomain;

public class MainSelectDAO {

	private static MainSelectDAO mDao;
	private static SqlSessionFactory ssf;

	private MainSelectDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	} // CpempDAO

	public static MainSelectDAO getInstance() {

		if (mDao == null) {
			mDao = new MainSelectDAO();
		} // end if

		return mDao;
	} // getInstance

	public SqlSessionFactory getSessionFactory() throws IOException {

		if (ssf == null) {

			Reader reader = null;
			try {
				// MyBatis ���
				// 1. ������ xml�� Stream���� ����
				reader = Resources.getResourceAsReader("kr/co/jinibooks/dao/mybatis-config.xml");

				// 2. SqlSessionFactoryBuilder ����
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();

				// 3. SqlSessionFactory ���
				ssf = ssfb.build(reader);

			} finally {
				if (reader != null) {
					reader.close();
				} // end if
			} // end finally

		} // end if

		return ssf;
	} // getSessionFactory

	public int selectCnt() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			cnt = ss.selectOne("selectCnt");
			ss.close();
//			System.out.println("selectCnt: "+cnt);

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	public int selectJoinCnt() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			cnt = ss.selectOne("selectJoinCnt");
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	public int selectAllCnt() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			cnt = ss.selectOne("selectAllCnt");
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	public int selectQNA() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			cnt = ss.selectOne("selectQNA");
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	public int selectOrderCnt() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			cnt = ss.selectOne("selectOrderCnt");
//			System.out.println("selectOrderCnt:"+cnt);
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	public int selectOrderPrice() throws SQLException {

		int cnt = 0;

		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
//			System.out.println("ss: "+ss);
			cnt = ss.selectOne("selectOrderPrice");
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	} //

	// �������� 
	public List<MainNoticeListDomain> selectMainNoticeList() throws SQLException {

		List<MainNoticeListDomain> list = null;

		try {
			// 3. Handler ���
			SqlSession ss = getSessionFactory().openSession();

			list = ss.selectList("selectMainNoticeList"); // ParameterType �Ӽ��� �����Ƿ� id�� �ִ´�.
			ss.close();

		} catch (IOException ioe) {
			ioe.printStackTrace();
		} // end catch

		return list;
	} // selectMainNoticeList

	/*
	 * public String selectDname(int deptno) throws SQLException {
	 * 
	 * String dname="" ;
	 * 
	 * // MyBatis Handler ��� try { SqlSession ss =getSessionFactory().openSession();
	 * 
	 * // Query ���� : �� �� ��ȸ dname=ss.selectOne("singleColumn", deptno) ; ss.close();
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } // end catch
	 * 
	 * return dname ; } // selectDname
	 * 
	 * 
	 * public DeptDomain2 selectDeptInfo(int deptno) throws SQLException {
	 * 
	 * DeptDomain2 dd=null ;
	 * 
	 * // MyBatis Handler ��� try { SqlSession ss =getSessionFactory().openSession();
	 * 
	 * // Query ���� : �� �� ��ȸ dd=ss.selectOne("multiColumn", deptno) ; ss.close();
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } // end catch
	 * 
	 * return dd ; } // selectDeptInfo
	 * 
	 * 
	 * public List<Integer> singleColumnMultiRow() { List<Integer> empList = null;
	 * 
	 * try { SqlSession ss = getSessionFactory().openSession(); // �ԷµǴ� �� ���� ��� ���ڵ带
	 * ��ȸ empList=ss.selectList("singleColumnMultiRow");
	 * 
	 * ss.close();
	 * 
	 * } catch (IOException se) { se.printStackTrace(); } // end catch
	 * 
	 * return empList ; } // singleColumnMultiRow
	 * 
	 * 
	 * public List<EmpDomain> multiColumnMultiRow() { List<EmpDomain> empList =
	 * null;
	 * 
	 * try { SqlSession ss = getSessionFactory().openSession(); // �ԷµǴ� �� ���� ��� ���ڵ带
	 * ��ȸ empList=ss.selectList("multiColumnMultiRow", 30);
	 * 
	 * ss.close();
	 * 
	 * } catch (IOException se) { se.printStackTrace(); } // end catch
	 * 
	 * return empList ; } // multiColumnMultiRow
	 * 
	 * 
	 * public List<String> selectLike(String content) throws SQLException {
	 * 
	 * List<String> list=null;
	 * 
	 * try { // MyBatis Handler ��� SqlSession ss =
	 * getSessionFactory().openSession();
	 * 
	 * // ���� ���� list=ss.selectList("like", content);
	 * 
	 * // ���� ���� ss.close();
	 * 
	 * } catch (IOException se) { se.printStackTrace(); } // end catch
	 * 
	 * return list ; } // selectLike
	 */
}
