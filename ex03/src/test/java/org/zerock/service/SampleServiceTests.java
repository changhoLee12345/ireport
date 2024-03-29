package org.zerock.service;

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
public class SampleServiceTests {

	@Setter(onMethod_ = @Autowired)
	private SampleService service;

	@Test
	public void printA() throws Exception {
		service.printA();
		log.info(service.doAdd("123", "234"));
	}

	public void testAdd() throws Exception {
		log.info(service.doAdd("123", "234"));
	}

	public void testClass() {
		log.info("start.............................");
		log.info(service);
		log.info(service.getClass());
		log.info(service.getClass().getName());
		log.info("end.............................");
	}
}
