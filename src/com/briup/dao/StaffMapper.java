package com.briup.dao;

import java.util.HashMap;
import java.util.List;

import com.briup.bean.Staff;

public interface StaffMapper extends BaseDao<Staff>{
	
    List<Staff> queryAll(HashMap<String,Object> map);
    Integer sum();
    void deleteStaff(int id);
    void updateStaff(int id,String name,String sex,String degree,String department,String position,String state,String username,String password);
    void insertStaff(String name,String sex,String degree,String department,String position,String state,String username,String password);
    List<Staff> checkUser(Staff staff);
    List<Staff> AgrCheck(HashMap<String,Object> map);
    String selectName(String username);
    Staff findStaffById(int id);
    List<Staff> findAllStaff();
    List<Staff> findStaffByName(String name);
}
