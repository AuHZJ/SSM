package com.briup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Train;
import com.briup.dao.TrainMapper;
import com.briup.exception.MyException;
import com.briup.service.ITrainService;

@Service("trainService")
public class TrainServiceImpl implements ITrainService{
	
	@Autowired
	private TrainMapper trainDao;



	@Override
	public Map<String, Object> findTrain(int pageNum, String name) {
		// TODO Auto-generated method stub
		int pageSize = 5;  //每页显示的数量
		int begin = pageSize*(pageNum-1);
		int end = pageSize*pageNum;
		Map<String,Object> m = new HashMap<>();
		List<Train> allTrain = trainDao.queryTrain(name);
		List<Train> someTrain = new ArrayList<>();
		for (int i = begin; i < allTrain.size(); i++) {
			if(i == end)
				break;
			someTrain.add(allTrain.get(i));
		}
		m.put("list", someTrain);
		m.put("pageSize", Math.ceil((double)allTrain.size()/pageSize));
		return m;
	}



	@Override
	public void deleteTrain(Integer id) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void updateTrain(HashMap<String, Object> map) throws MyException {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void insertTrain(HashMap<String, Object> map) throws MyException {
		// TODO Auto-generated method stub
		
	}

}
