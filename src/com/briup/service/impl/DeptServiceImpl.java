package com.briup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Department;
import com.briup.dao.DepartmentMapper;
import com.briup.service.IDepartmentService;

@Service("deptService")
public class DeptServiceImpl implements IDepartmentService{
	
	@Autowired
	private DepartmentMapper deptDao;

	@Override
	public List<Department> findAllDepartment() {
		// TODO Auto-generated method stub
		List<Department> list = deptDao.findAllDep();
//		System.out.println(list);
		return list;
	}

	@Override
	public Department findDepartmentById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Department findDepartmentByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> findPosition(String department) {
		// TODO Auto-generated method stub
		List<String> list = deptDao.findPosition(department);
		return list;
	}

}
