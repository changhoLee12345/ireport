package com.yedam.myserver.city;

import java.util.List;

import lombok.Data;

@Data
public class modifyVO<T> {
	List<T> createdRows;
	List<T> updatedRows;
	List<T> deletedRows;
}
