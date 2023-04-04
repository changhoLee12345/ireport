package org.zerock.sample;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Chef {
	public Chef() {
		System.out.println("Chef() call.");
	}
}
