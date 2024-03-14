package org.zerock.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		long start = System.currentTimeMillis();
		try {
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "book_ex",
					"book_ex");
			log.info(conn);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();

		log.info((end - start) + "ms");
	}
}
