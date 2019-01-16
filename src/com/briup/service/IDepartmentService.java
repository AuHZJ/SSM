package com.briup.service;


import java.util.List;

import com.briup.bean.Department;

public interface IDepartmentService {
	List<Department> findAllDepartment();
	Department findDepartmentById(int id);
	Department findDepartmentByName(String name);
	List<String> findPosition(String department);
}
