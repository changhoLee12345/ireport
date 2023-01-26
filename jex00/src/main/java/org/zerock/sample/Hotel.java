package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Hotel {

	private Chef chef;
	
	public Hotel(Chef chef) {
		this.chef = chef;
	}
}