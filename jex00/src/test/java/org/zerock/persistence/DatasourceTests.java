package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.RootConfig;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootConfig.class })
@Log4j
public class DatasourceTests {

	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;

	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testExists() {
		try (Connection conn = dataSource.getConnection(); //
				SqlSession session = sqlSessionFactory.openSession(); //
		) {
			log.info(session);
			log.info(conn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
