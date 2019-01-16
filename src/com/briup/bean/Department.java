package com.briup.bean;


import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * 员工部门类
 *
 */
@Component
public class Department implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//部门id
	private Integer dept_id;
	//部门名字
	private String dept_name;

	public Department() {
	
	}

	public Integer getDept_id() {
		return dept_id;
	}

	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "Department [dept_id=" + dept_id + ", dept_name=" + dept_name + "]";
	}
	
	

}
