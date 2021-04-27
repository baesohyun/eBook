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
		//1. Stream을 사용하여 설정 XML연결
		Reader reader=null;
		try {
			reader=Resources.getResourceAsReader(resource);
			//2. SqlSessionFactoryBuilder생성
			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			//3.SqlSessionFactory 얻기
			SqlSessionFactory ssf=ssfb.build(reader);
			//4.스트림 끊기
			reader.close();
			//5. MyBatis Handler 얻기
			SqlSession ss=ssf.openSession();
			//6. Handler를 사용하여 mapper에 있는 XML의 id에 해당하는 node를 찾아 
			//파싱하여 쿼리를 수행하고 수행 결과를 Domain에 저장한 후 list에 담아서 반환한다.
			list=ss.selectList("selectAllBook");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}//main

}
