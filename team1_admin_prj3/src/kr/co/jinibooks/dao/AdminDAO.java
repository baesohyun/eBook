package kr.co.jinibooks.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.jinibooks.vo.AdminLoginVO;



/**
 * @author owner
 *
 */
public class AdminDAO {

	
	private static AdminDAO d_dao;

	private AdminDAO() {

	} // DiaryDAO

	public static AdminDAO getInstance() {
		if (d_dao == null) {
			d_dao = new AdminDAO();
		} // end if
		return d_dao;
	} // getInstance

	public Connection getConnection() throws SQLException {

		Connection conn = null;

		// 1. JNDI 사용 객체 생성
		try {
			Context ctx = new InitialContext();
			// 2. DataSource 얻기
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/book_dbcp");

			// 3. Connection 얻기
			conn = ds.getConnection();

		} catch (NamingException ne) {
			ne.printStackTrace();
		} // end catch
		return conn;

	} // getConnection

	public boolean login(AdminLoginVO alVO) throws SQLException {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 3. Connection 얻기
			conn = getConnection();

			// 4. 쿼리문 생성 객체 얻기
			String selected = "select id from test_login where id=? and pass=?";
			
			pstmt = conn.prepareStatement(selected);
			
			pstmt.setString(1, alVO.getId());
			pstmt.setString(2, alVO.getPasswd());

			// 5. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			flag = rs.next();

		} finally {
			// 6. 연결 끊기
			if (rs != null) { rs.close(); } // end if
			if (pstmt != null) { pstmt.close(); } // end if
			if (conn != null) { conn.close(); } // end if

		} // end finally

		return flag;
	} // end login

	
} // class
