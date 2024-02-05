package org.zerock.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testInsertMember() {
		String sql = "insert into tbl_member(userid, userpw, username) values(?,?,?)";

		for (int i = 0; i < 100; i++) {
			Connection conn = null;
			PreparedStatement psmt = null;

			try {
				conn = ds.getConnection();
				psmt = con.preparedStatement(sql);
				psmt.setString(2, pwencoder.encode("pw" + i));
				if (i < 80) {
					psmt.setString(1, "user" + i);
					psmt.setString(3, "user auth: " + i);

				} else if (i < 90) {
					psmt.setString(1, "manager" + i);
					psmt.setString(3, "manager auth: " + i);

				} else {
					psmt.setString(1, "admin" + i);
					psmt.setString(3, "admin auth: " + i);

				}
				psmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (psmt != null)
						psmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {

				}
			}
		} // end of for.
	} // end of testInsert.
}
