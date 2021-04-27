package kr.co.jinibooks.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jinibooks.domain.BookListDomain;

public class UseMyBatisBook {
	
	public List<BookListDomain> mybatisBook() {
		
		List<BookListDomain> list=null;
		
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
			list=ss.selectList("selectAllBook");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//main

}
