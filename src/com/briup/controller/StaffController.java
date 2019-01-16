package com.briup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.bean.Staff;
import com.briup.exception.MyException;
import com.briup.service.IStaffService;

@Controller
@RequestMapping("staff")
public class StaffController {
	
	@Autowired
	private IStaffService staffService;

	
	@RequestMapping("/login")
	public String login(Staff staff) {
		System.out.println(staff);
			if(staffService.exist(staff)) {
				System.out.println("员工登录");
			}else {
				System.out.println("不存在该员工！");
			}
		return "index";
	}
	
	@RequestMapping("findAllStaff") //staff/findAllStaff
	@ResponseBody
	public Map<String,Object> findAllStaff(int pageNum,String name) {
		Map<String,Object> m = new HashMap<>();
		if(name.equals(null)||name.equals("")) {
			m = staffService.findAllStaff(pageNum);
		}else {
			m = staffService.findStaffByName(name);
		}
			
		return m;
	}
	
	@RequestMapping("deleteStaff")
	@ResponseBody
	public Map<String,Object> delectStaff(int StaffId){
		System.out.println(StaffId);
		Map<String,Object> m = new HashMap<>();
		staffService.deleteStaff(StaffId);
		m.put("status", 200);
		return m;
	}
	
	@RequestMapping("updateStaff")
	@ResponseBody
	public Map<String,Object> updateStaff(int id,String name,String sex,String degree,String department,String position,String state,String username,String password) {
//		System.out.println(id+","+name+","+sex+","+degree+","+department+","+position+","+state+","+username+","+password);
//		d.setDept_name(department);
//		s.setId(id);
//		s.setName(name);
//		s.setSex(sex);
//		s.setDegree(degree);
//		s.setDepartment(d);
//		s.setPosition(position);
//		s.setState(state);
//		s.setUsername(username);
//		s.setPassword(password);
//		staffService.updateStaff(s);
		staffService.updateStaff(id,name,sex,degree,department,position,state,username,password);
		Map<String,Object> m = new HashMap<>();
		m.put("status", 200);
		return m;
	}
	
	@RequestMapping("insertStaff")
	@ResponseBody
	public Map<String,Object> insertStaff(String name,String sex,String degree,String department,String position,String state,String username,String password) throws MyException, Exception {
		staffService.insertStaff(name,sex,degree,department,position,state,username,password);
		Map<String,Object> m = new HashMap<>();
		m.put("status", 200);
		return m;
	}
}
