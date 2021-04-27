package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.vo.LoginVO;

public class LoginDAO {

	private static LoginDAO ceDao;
	private static SqlSessionFactory ssf;

	private LoginDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	} // CpempDAO

	public static LoginDAO getInstance() {

		if (ceDao == null) {
			ceDao = new LoginDAO();
		} // end if

		return ceDao;
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

	public boolean selectAdmin(LoginVO lVO) throws SQLException {

		boolean flag= false;
		
		// MyBatis Handler ���
		try {
			SqlSession ss = getSessionFactory().openSession();

			// Query ���� : �� �� ��ȸ
			String name = ss.selectOne("selectAdmin", lVO);
			
			if (name != null) {
				flag=true;
			} // end if
			
			ss.close();

		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return flag;
	} // selectDname


} // class
