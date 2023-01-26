package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long board_No;
	private String title;
	private String content;
	private String writer;
	private Date write_Date;
	private Long click_Cnt;
	private String image;
}
