package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.BookListDomain;
import kr.co.jinibooks.domain.PurchaseListDomain;
import kr.co.jinibooks.domain.RentalListDomain;

public class UseMyBatisCalc {
	
	public List<PurchaseListDomain> mybatisPurchase() {
		
		List<PurchaseListDomain> list=null;
		
		String resource="kr/co/jinibooks/dao/mybatis-config.xml";
		//1. Stream�� ����Ͽ� ���� XML����
		Reader reader=null;
		try {
			reader=Resources.getResourceAsReader(resource);
			//2. SqlSessionFactoryBuilder����
			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			//3.SqlSessionFactory ���
			SqlSessionFactory ssf=ssfb.build(reader);
			//4.��Ʈ�� ����
			reader.close();
			//5. MyBatis Handler ���
			SqlSession ss=ssf.openSession();
			//6. Handler�� ����Ͽ� mapper�� �ִ� XML�� id�� �ش��ϴ� node�� ã�� 
			//�Ľ��Ͽ� ������ �����ϰ� ���� ����� Domain�� ������ �� list�� ��Ƽ� ��ȯ�Ѵ�.
			list=ss.selectList("selectAllCalc");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//mybatisPurchase
	
	public List<RentalListDomain> mybatisRental() {
		
		List<RentalListDomain> list=null;
		
		String resource="kr/co/jinibooks/dao/mybatis-config.xml";
		//1. Stream�� ����Ͽ� ���� XML����
		Reader reader=null;
		try {
			reader=Resources.getResourceAsReader(resource);
			//2. SqlSessionFactoryBuilder����
			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			//3.SqlSessionFactory ���
			SqlSessionFactory ssf=ssfb.build(reader);
			//4.��Ʈ�� ����
			reader.close();
			//5. MyBatis Handler ���
			SqlSession ss=ssf.openSession();
			//6. Handler�� ����Ͽ� mapper�� �ִ� XML�� id�� �ش��ϴ� node�� ã�� 
			//�Ľ��Ͽ� ������ �����ϰ� ���� ����� Domain�� ������ �� list�� ��Ƽ� ��ȯ�Ѵ�.
			list=ss.selectList("selectAllRental");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//mybatisPurchase

}
