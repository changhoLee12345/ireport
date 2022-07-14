package com.yedam.myserver.excel.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.myserver.excel.vo.DeptSearchVO;

public interface DeptService {
	public List<Map<String, Object>> getDeptListMap(DeptSearchVO vo);
}
