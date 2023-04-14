package com.yedam.myserver.emp.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Employee {

	private Integer department_id;
	private Integer manager_id;
	private Integer commission_pct;
	private Integer salary;
	private String job_id;
	private Date hire_date;
	private String phone_number;
	private String email;
	private String last_name;
	private String first_name;
	private Integer employee_id;
	private String department_name;

}
