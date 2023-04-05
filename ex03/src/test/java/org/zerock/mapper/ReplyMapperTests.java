package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = { 2490387L, 2490386L, 2490385L, 2490384L, 2490383L };

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test
	public void testList2() {
		Criteria cri = new Criteria(3, 10);
		List<ReplyVO> list = mapper.getListWithPaging(cri, 2490387L);
		list.forEach(reply -> log.info(reply));
	}

	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> list = mapper.getListWithPaging(cri, 2490387L);
		list.forEach(reply -> log.info(reply));
	}

	public void testUpdate() {
		Long rno = 18L;

		ReplyVO vo = mapper.read(rno);
		vo.setReply("reply update");

		log.info(mapper.update(vo));
	}

	public void testDelete() {
		Long rno = 21L;
		log.info(mapper.delete(rno));
	}

	public void testRead() {
		Long rno = 22L;
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
	}

	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("reply test " + i);
			vo.setReplyer("replyer" + i);

			mapper.insert(vo);
		});
	}

//	@Test
	public void testMapper() {
		log.info(mapper);
	}
}
