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
	private Long[] bnoArr = { 458752l, 458751l, 458750l, 458749l, 458748l };
	// , 458747l, 458746l, 458745l, 458744l, 458743l };

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

//	@Test
	public void testMapper() {
		log.info("mapper..........." + mapper);
	}

//	@Test
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
	public void testRead() {
		Long rno = 5l;

		ReplyVO vo = mapper.read(rno);

		log.info(vo);
	}

//	@Test
	public void testDelet() {
		Long rno = 1l;

		mapper.delete(rno);
	}

//	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(2L);
		vo.setReply("update reply");

		mapper.update(vo);
	}

	@Test
	public void listTest() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);

		replies.forEach(reply -> log.info(reply));
	}
}
