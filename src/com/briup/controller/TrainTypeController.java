package com.briup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.service.ITrainTypeService;

@Controller
@RequestMapping("Type")
public class TrainTypeController {
	
	@Autowired
	private ITrainTypeService trainTypeService; 
	
	@RequestMapping("page")
	@ResponseBody
	public Map<String,Object> findTrainType(int pageNum, String name){
		Map<String,Object> m = new HashMap<>();
		m = trainTypeService.findTrainType(pageNum, name);
		m.put("status", 200);
		return m;
	}

}
