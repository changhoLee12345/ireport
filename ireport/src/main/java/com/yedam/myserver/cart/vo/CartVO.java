package com.yedam.myserver.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private String no; // 순번
	private String product_nm; // 상품번호
	private int price; // 가격
	private int qty; // 수량

}
