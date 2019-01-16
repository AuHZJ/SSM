package com.briup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Staff;
import com.briup.dao.StaffMapper;
import com.briup.exception.MyException;
import com.briup.service.IStaffService;

@Service("staffService")
public class StaffServiceImpl implements IStaffService{
	
	@Autowired
	private StaffMapper staffDao;

	@Override
	public void deleteStaff(int id) {
		// TODO Auto-generated method stub
		staffDao.deleteStaff(id);
		
	}

	@Override
	public void updateStaff(int id,String name,String sex,String degree,String department,String position,String state,String username,String password) {
		// TODO Auto-generated method stub
		staffDao.updateStaff(id,name,sex,degree,department,position,state,username,password);
		
	}

	@Override
	public void insertStaff(String name,String sex,String degree,String department,String position,String state,String username,String password) throws MyException, Exception {
		// TODO Auto-generated method stub
		staffDao.insertStaff(name,sex,degree,department,position,state,username,password);
	}

	@Override
	public boolean checkStaff(Staff staff) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkAgrStaff(HashMap<String, Object> map) throws MyException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> findStaff(int pageNum, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String,Object> findStaffByName(String name) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<>();
		List<Staff> list = staffDao.findStaffByName(name);
		map.put("staffList",list);
		map.put("pageSize", 1);
		return map;
	}

	@Override
	public Staff findStaffById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean exist(Staff staff) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String,Object> findAllStaff(int pageNum) {
		// TODO Auto-generated method stub
		int pageSize = 5;  //每页显示的数量
		int begin = pageSize*(pageNum-1);
		int end = pageSize*pageNum;
		List<Staff> allStaff = staffDao.findAllStaff();
		List<Staff> manyStaff = new ArrayList<>();
		Map<String,Object> map = new HashMap<>();
		for (int i = begin; i < allStaff.size(); i++) {
			if(i == end)
				break;
			manyStaff.add(allStaff.get(i));
		}
		map.put("staffList", manyStaff);
		map.put("pageSize", Math.ceil((double)allStaff.size()/pageSize)); //页数，向上取整
		return map;
	}

}
