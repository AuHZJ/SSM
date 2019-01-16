package com.briup.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.briup.service.ITrainService;

@Controller
@RequestMapping("Tra")
public class TrainController {
	
	@Autowired
	private ITrainService trainService; 
	
	@RequestMapping("page")
	@ResponseBody
	public Map<String,Object> findTrainType(int pageNum, String name){
		Map<String,Object> m = new HashMap<>();
		m = trainService.findTrain(pageNum, name);
		m.put("status", 200);
		return m;
	}

}
