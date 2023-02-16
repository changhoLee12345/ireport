package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

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
public class SampleTests {
	
	public SampleTests() {
		System.out.println("SampleTests()");
	}

	@Setter(onMethod_ = @Autowired)
	private Restaurant restaurant;

	@Test
	public void testExists() {
		assertNotNull(restaurant);
		log.info(restaurant);
		log.info("0000000000000");
		log.info(restaurant.getChef());
	}
}
