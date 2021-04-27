package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.jinibooks.dao.MainSelectDAO;
import kr.co.jinibooks.domain.MainNoticeListDomain;

public class selectService {

	public int selectCnt() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectCnt();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} // selectCnt

	
	public int selectJoinCnt() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectJoinCnt();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} // selectJoinCnt

	
	public int selectAllCnt() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectAllCnt();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} // selectAllCnt

	
	public int selectQNA() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectQNA();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} // selectQNA

	
	public int selectOrderCnt() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectOrderCnt();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} // selectOrderCnt
	

	public int selectOrderPrice() {

		int cnt = 0;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			cnt = msDao.selectOrderPrice();

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return cnt;
	} //selectOrderPrice
	

	public List<MainNoticeListDomain> selectMainNoticeList() {

		List<MainNoticeListDomain> list = null;

		MainSelectDAO msDao = MainSelectDAO.getInstance();

		try {
			list = msDao.selectMainNoticeList();

			String temp = "";
			for (int i = 0; i < list.size(); i++) {
				temp = String.valueOf(list.get(i).getSubject());
			} // end for

		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return list;
	} // selectMainNoticeList

}
