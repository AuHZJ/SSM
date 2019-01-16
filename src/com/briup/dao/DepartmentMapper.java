package com.briup.dao;

import java.util.List;

import com.briup.bean.Department;

public interface DepartmentMapper {

	List<Department> findAllDep();
	Department findDepByName(String name) ;
	Department findDepById(int id) ;
	List<String> findPosition(String department);
}
