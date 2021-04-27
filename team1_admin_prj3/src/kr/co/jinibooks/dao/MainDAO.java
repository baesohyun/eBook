package kr.co.jinibooks.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.jinibooks.vo.MainVO;

public class MainDAO {


		
		private static MainDAO mDAO;

		private MainDAO() {

		} // DiaryDAO

		public static MainDAO getInstance() {
			if (mDAO == null) {
				mDAO = new MainDAO();
			} // end if
			return mDAO;
		} // getInstance

		public Connection getConnection() throws SQLException {

			Connection conn = null;

			// 1. JNDI ��� ��ü ����
			try {
				Context ctx = new InitialContext();
				// 2. DataSource ���
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/book_dbcp");

				// 3. Connection ���
				conn = ds.getConnection();

			} catch (NamingException ne) {
				ne.printStackTrace();
			} // end catch
			return conn;

		} // getConnection
	

		// ���� �湮�� ��
		public int todayVisit(MainVO mVO) throws SQLException {
			int cnt = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
			// 3. 
			conn = getConnection() ;
			
			// 4. 
			StringBuilder selectCnt = new StringBuilder() ;
			selectCnt
			.append("	select count(*) cnt	")
			.append("	from member"	)
			.append("	where recent_date = to_char(sysdate, 'yyyy-mm-dd')	");
			
			pstmt = conn.prepareStatement(selectCnt.toString()) ;
			
			// 5. 
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) {
				cnt = rs.getInt("todayVisit") ;
			} // end if
			
			} finally {
			// 6. 
			if ( rs != null ) { rs.close(); } // end if
			if ( pstmt != null ) { pstmt.close(); } // end if
			if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return cnt ;
		} // todayVisit
		
		
		// ���� ȸ������ ��
		public int todayJoin(MainVO mVO) throws SQLException {
			int cnt = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
				// 3. 
				conn = getConnection() ;
				
				// 4. 
				StringBuilder selectCnt = new StringBuilder() ;
				selectCnt
				.append("	select count(*) cnt	")
				.append("	from member"	)
				.append("	where join_date = to_char(sysdate, 'yyyy-mm-dd')	");
				
				pstmt = conn.prepareStatement(selectCnt.toString()) ;
				
				// 5. 
				rs = pstmt.executeQuery() ;
				
				if (rs.next()) {
					cnt = rs.getInt("todayJoin") ;
				} // end if
				
			} finally {
				// 6. 
				if ( rs != null ) { rs.close(); } // end if
				if ( pstmt != null ) { pstmt.close(); } // end if
				if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return cnt ;
		} // todayVisit
		
		
		// �� ȸ�� ��
		public int totalJoin(MainVO mVO) throws SQLException {
			int cnt = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
				// 3. 
				conn = getConnection() ;
				
				// 4. 
				StringBuilder selectCnt = new StringBuilder() ;
				selectCnt
				.append("	select count(*) cnt	")
				.append("	from member"	) ;
				
				pstmt = conn.prepareStatement(selectCnt.toString()) ;
				
				// 5. 
				rs = pstmt.executeQuery() ;
				
				if (rs.next()) {
					cnt = rs.getInt("totalJoin") ;
				} // end if
				
			} finally {
				// 6. 
				if ( rs != null ) { rs.close(); } // end if
				if ( pstmt != null ) { pstmt.close(); } // end if
				if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return cnt ;
		} // todayVisit
		
	
		// �������� 1:1 ���� ��
		public int qnaCnt(MainVO mVO) throws SQLException {
			int cnt = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
				// 3. 
				conn = getConnection() ;
				
				// 4. 
				StringBuilder selectCnt = new StringBuilder() ;
				selectCnt
				.append("	select count(*) cnt	")
				.append("	from qna	"	)
				.append("	where ���� N���ٵ� �亯�� ���� ���ö	");
				
				pstmt = conn.prepareStatement(selectCnt.toString()) ;
				
				// 5. 
				rs = pstmt.executeQuery() ;
				
				if (rs.next()) {
					cnt = rs.getInt("qnaCnt") ;
				} // end if
				
			} finally {
				// 6. 
				if ( rs != null ) { rs.close(); } // end if
				if ( pstmt != null ) { pstmt.close(); } // end if
				if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return cnt ;
		} // todayVisit
		
		
		// ���� �ֹ� �Ǽ�
		public int orderCnt(MainVO mVO) throws SQLException {
			int cnt = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
				// 3. 
				conn = getConnection() ;
				
				// 4. 
				StringBuilder selectCnt = new StringBuilder() ;
				selectCnt
				.append("	select count(*) cnt	")
				.append("	from orderList?(�Ƹ���)"	)
				.append("	where order_date = to_char(sysdate, 'yyyy-mm-dd')	");
				
				pstmt = conn.prepareStatement(selectCnt.toString()) ;
				
				// 5. 
				rs = pstmt.executeQuery() ;
				
				if (rs.next()) {
					cnt = rs.getInt("orderCnt") ;
				} // end if
				
			} finally {
				// 6. 
				if ( rs != null ) { rs.close(); } // end if
				if ( pstmt != null ) { pstmt.close(); } // end if
				if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return cnt ;
		} // todayVisit
		
		
		// ���� �� ���� �ݾ�
		public int todayPurchase(MainVO mVO) throws SQLException {
			int amount = 0 ;
			
			Connection conn = null ;
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			try {
				// 3. 
				conn = getConnection() ;
				
				// 4. 
				StringBuilder selectCnt = new StringBuilder() ;
				selectCnt
				.append("	select todayPurchaseAmount(���� ���)	") // for�� �����ߵǳ�
				.append("	from order"	)
				.append("	where order_date = to_char(sysdate, 'yyyy-mm-dd')	");
				
				pstmt = conn.prepareStatement(selectCnt.toString()) ;
				
				// 5. 
				rs = pstmt.executeQuery() ;
				
				if (rs.next()) {
					amount = rs.getInt("todayPurchase") ;
				} // end if
				
			} finally {
				// 6. 
				if ( rs != null ) { rs.close(); } // end if
				if ( pstmt != null ) { pstmt.close(); } // end if
				if ( conn != null ) { conn.close(); } // end if
				
			} // end finally
			
			return amount ;
		} // todayVisit
		
		
		// �������� 5~7��

	
}
