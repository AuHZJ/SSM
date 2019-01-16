package com.briup.service;


import com.briup.bean.Staff;
import com.briup.exception.MyException;

import java.util.HashMap;
import java.util.Map;

public interface IStaffService {
    public void deleteStaff(int id);
    public void updateStaff(int id,String name,String sex,String degree,String department,String position,String state,String username,String password);
    public void insertStaff(String name,String sex,String degree,String department,String position,String state,String username,String password) throws MyException, Exception;
    boolean checkStaff(Staff staff);
    boolean exist(Staff staff);
    boolean checkAgrStaff(HashMap<String,Object> map) throws MyException;
	public Map<String,Object> findStaff(int pageNum, String name);
	public Map<String,Object> findStaffByName(String name);
	public Staff findStaffById(int id);
	public Map<String,Object> findAllStaff(int pageNum);
}
