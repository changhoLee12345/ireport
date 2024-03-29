package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.RootConfig;
import org.zerock.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootConfig.class })
@Log4j
public class TimeMapperTests {
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;

	@Test
	public void testGetTime() {
		log.info("1=> " + timeMapper.getClass().getName());
		log.info("2=> " + timeMapper.getTime());
		log.info("3=> " + timeMapper.getTime2());
	}
}
