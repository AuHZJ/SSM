package com.briup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Alter;
import com.briup.dao.AlterMapper;
import com.briup.service.IAlterService;

@Service("alterService")
public class AlterServiceImpl implements IAlterService{
	
	@Autowired
	private AlterMapper alterDao;

	@Override
	public void deleteAlter(Integer id) {
		// TODO Auto-generated method stub
		alterDao.deleteAlter(id);
	}

	@Override
	public void updateAlter(Alter alter) {
		// TODO Auto-generated method stub
		alterDao.updateAlter(alter);
	}

	@Override
	public void insertAlter(Alter alter) {
		// TODO Auto-generated method stub
//		System.out.println(alter);
		alterDao.insertAlter(alter);
	}

	@Override
	public Map<String, Object> findAlter(int pageNum, String name) {
		// TODO Auto-generated method stub
		int pageSize = 5; //每页显示5条
		int begin = pageSize*(pageNum-1);
		int end = pageSize*pageNum;
		Map<String,Object> map = new HashMap<String,Object>();
		List<Alter> list = new ArrayList<>();
		List<Alter> manyAlter = new ArrayList<>();
		if(name.equals("")||name.equals(null)) {
			list = alterDao.findAllAlter();
		}else {
			list = alterDao.findAlterByName(name);
		}
		for (int i = begin; i < list.size(); i++) {
			if(i == end)
				break;
			manyAlter.add(list.get(i));
		}
		map.put("list", manyAlter);
		map.put("pageSize", Math.ceil((double)list.size()/pageSize)); //页数，向上取整
		return map;
	}

}
