package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;

@Component
@ToString
@Getter
public class SampleHotel {

	@Autowired // 스프링 4.3 이후에는 암시적으로 선언된다.
	private Chef chef;

	public SampleHotel(Chef chef) {
		this.chef = chef;
	}
}
