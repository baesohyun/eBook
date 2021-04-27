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
	

		// 오늘 방문자 수
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
		
		
		// 오늘 회원가입 수
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
		
		
		// 총 회원 수
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
		
	
		// 미응답한 1:1 질문 수
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
				.append("	where 뭔가 N일텐데 답변이 씌앙 김우철	");
				
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
		
		
		// 오늘 주문 건수
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
				.append("	from orderList?(아마도)"	)
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
		
		
		// 오늘 총 구매 금액
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
				.append("	select todayPurchaseAmount(졸라 기네)	") // for문 돌려야되나
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
		
		
		// 공지사항 5~7개

	
}
