package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

//	@Test
	public void getListTest() {
		mapper.getList().forEach(board -> log.info(board));
	}

//	@Test
	public void insertTest() {
		BoardVO board = new BoardVO();
		board.setTitle("title test");
		board.setContent("content test");
		board.setWriter("newbie");

		mapper.insert(board);

		log.info(board);
	}

//	@Test
	public void insertSelectTest() {
		BoardVO board = new BoardVO();
		board.setTitle("title test");
		board.setContent("content test");
		board.setWriter("newbie");

		mapper.insertSelectKey(board);

		log.info(board);
	}

//	@Test
	public void readTest() {
		BoardVO board = mapper.read(1L);
		log.info(board);
	}

//	@Test
	public void deleteTest() {
		log.info("delete count: " + mapper.delete(1L));
	}

	@Test
	public void updateTest() {
		BoardVO board = new BoardVO();
		board.setBoard_No(2L);
		board.setTitle("test1L");
		board.setContent("content1L");
		board.setWriter("writer5L");
		int count = mapper.update(board);

		log.info(">>>>>>>>>>>>>update cnt: " + count);
	}

}