package org.zerock.persistence;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {

	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;

	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;

	public void testConnection() {
		log.info("start: " + System.currentTimeMillis());
		try {
			Connection conn = dataSource.getConnection();
			log.info(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		log.info("end  : " + System.currentTimeMillis());
	}

	@Test
	public void testMybatis() {

		log.info("start: " + System.currentTimeMillis());
		try {
			SqlSession session = sqlSessionFactory.openSession();
			Connection conn = session.getConnection();
			log.info(session);
			log.info(conn);
			log.info("end  : " + System.currentTimeMillis());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
