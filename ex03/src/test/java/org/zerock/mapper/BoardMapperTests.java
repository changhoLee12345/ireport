package org.zerock.mapper;

import java.util.List;

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
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

//	@Test
	public void testGetList() {
		boardMapper.getList().forEach(board -> log.info(board));
	}

//	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("new title");
		board.setContent("new content");
		board.setWriter("newbie");

		boardMapper.insert(board);
		log.info(board);
	}

//	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("new title");
		board.setContent("new content");
		board.setWriter("newbie");

		boardMapper.insertSelectKey(board);
		log.info(board);
	}

//	@Test
	public void testRead() {
		BoardVO board = boardMapper.read(3L);
		log.info(board);
	}

//	@Test
	public void testDelete() {
		log.info("Delete Cnt: " + boardMapper.delete(3L));
	}

//	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();

		board.setBno(4L);
		board.setTitle("modify title");
		board.setContent("modify content");

		int cnt = boardMapper.update(board);
		log.info("Update Cnt: " + cnt);
	}

//	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(5);

		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}

	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("새로");
		cri.setType("TCW");
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
}
