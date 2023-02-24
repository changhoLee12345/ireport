package org.zerock.service;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

//	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);
	}

//	@Test
	public void testRegister() {

		BoardVO board = new BoardVO();
		board.setTitle("new title");
		board.setContent("new content");
		board.setWriter("newbie");

		service.register(board);
		log.info("생성된 게시물의 번호는 " + board.getBno());
	}

//	@Test
	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
		Criteria cri = new Criteria();
		service.getList(cri).forEach(board -> log.info(board));

	}

	@Test
	public void testGet() {
		log.info(service.get(1L));
	}

	@Test
	public void testDelete() {
		log.info("remove...." + service.remove(2L));
	}

	@Test
	public void testUpdate() {

		BoardVO board = service.get(1L);

		if (board == null)
			return;

		board.setTitle("updat title");
		log.info("modify ..." + service.modify(board));
	}
}
