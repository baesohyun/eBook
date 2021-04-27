package kr.co.jinibooks.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.jinibooks.dao.UserBookDAO;
import kr.co.jinibooks.domain.SearchCartListDomain;
import kr.co.jinibooks.vo.CartDeleteVO;
import kr.co.jinibooks.vo.CartInsertVO;
import kr.co.jinibooks.vo.SearchIdVO;

public class SearchCartService {
	
	public List<SearchCartListDomain> selectCartList(SearchIdVO siVO){
		List<SearchCartListDomain> cartList=null;
		UserBookDAO bDao=UserBookDAO.getInstance();
		try {
			cartList=bDao.selectCartList(siVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return cartList;
	}//selectCartList
	
	//CartInsertVO ciVO
	public JSONObject addCart(CartInsertVO ciVO) {
		JSONObject json= new JSONObject();
		boolean flag=false;
		UserBookDAO bDao= UserBookDAO.getInstance();
		
		try {
			int cnt=bDao.insertCart(ciVO);
			if(cnt==1) {
				flag=true;
			}//end if
			
			json.put("flag", flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return json;
	}//addCart
	
	public JSONObject removeCart(CartDeleteVO cdVO) {
		JSONObject json=new JSONObject();
		boolean flag=false;
		UserBookDAO bDao= UserBookDAO.getInstance();
		try {
			int cnt=bDao.DeleteCart(cdVO);
			if(cnt==1) {
				flag=true;
			}//end if
			json.put("deleteFlag", flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return json;
	}//addCart

}//class
