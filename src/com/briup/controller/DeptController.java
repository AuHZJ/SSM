package com.briup.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.bean.Department;
import com.briup.service.IDepartmentService;

@Controller
@RequestMapping("/manage")
public class DeptController {
	
	@Autowired
	private IDepartmentService deptService;

	@RequestMapping("/cascade")
	@ResponseBody
	public Map<String,Object> findAllDept(){
		Map<String,Object> map = new HashMap<>();
		List<Department> list = deptService.findAllDepartment();
		map.put("pos", list);
		return map;
	}
	
	@RequestMapping("/position")
	@ResponseBody
	public Map<String,Object> findPosition(String department){
		Map<String,Object> map = new HashMap<>();
		List<String> position = deptService.findPosition(department);
		map.put("pos", position);
		return map;
	}
}
