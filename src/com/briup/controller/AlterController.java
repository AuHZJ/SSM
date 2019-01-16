package com.briup.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.bean.Alter;
import com.briup.bean.Staff;
import com.briup.service.IAlterService;

@Controller
@RequestMapping("/alter")
public class AlterController {
	
	@Autowired
	private IAlterService alterService;
	
	
	@RequestMapping("/findAlter")
	@ResponseBody
	public Map<String,Object> findAlter(int pageNum,String name){
		Map<String,Object> map = new HashMap<String,Object>();
		map = alterService.findAlter(pageNum, name);
		map.put("status", 200);
		return map;
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Map<String,Object> insertAlter(int StaffId,String alter2,Date Btime2,Date Etime2){
//		System.out.println(StaffId+","+alter2+","+Btime2+","+Etime2);
		
		java.sql.Date btime2=new java.sql.Date(Btime2.getTime());
		java.sql.Date etime2=new java.sql.Date(Etime2.getTime());
		
		Staff s = new Staff();
		Alter a = new Alter();
		
		s.setId(StaffId);
		
		a.setStaff(s);
		a.setAlter_btime(btime2);
		a.setAlter_etime(etime2);
		a.setAlter_content(alter2);
		
		alterService.insertAlter(a);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", 200);
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Map<String,Object> updateAlter(int selectId,String alter,Date Btime,Date Etime){
		
		java.sql.Date btime = new java.sql.Date(Btime.getTime());
		java.sql.Date etime = new java.sql.Date(Etime.getTime());
		
		Alter a = new Alter();
		
		a.setAlterId(selectId);
		a.setAlter_btime(btime);
		a.setAlter_etime(etime);
		a.setAlter_content(alter);
		
		alterService.updateAlter(a);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", 200);
		return map;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> deleteAlter(int selectId){
		
		alterService.deleteAlter(selectId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", 200);
		return map;
	}

}
