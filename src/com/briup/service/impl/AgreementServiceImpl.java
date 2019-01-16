package com.briup.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Agreement;
import com.briup.dao.AgreementMapper;
import com.briup.exception.MyException;
import com.briup.service.IAgreementService;

@Service("agreementService")
public class AgreementServiceImpl implements IAgreementService{
	
	@Autowired
	private AgreementMapper agreementDao;

	@Override
	public void deleteAgr(Integer id) {
		// TODO Auto-generated method stub
		agreementDao.deleteAgr(id);
	}

	@Override
	public void updateAgr(Agreement agr) {
		// TODO Auto-generated method stub
		agreementDao.updateAgr(agr);
	}

	@Override
	public boolean AgrCheckByStaffId(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean AgrCheckByAgrId(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertAgr(Agreement agr) throws MyException {
		// TODO Auto-generated method stub
		agreementDao.insertAgr(agr);
	}

	@Override
	public Map<String, Object> findAgreement(int pageNum, String name) {
		// TODO Auto-generated method stub
		int pageSize = 5;  //每页显示的数量
		int begin = pageSize*(pageNum-1);
		int end = pageSize*pageNum;
		Map<String,Object> map = new HashMap<String,Object>();
		List<Agreement> agr = new ArrayList<>();
		agr = agreementDao.findAgr(name);
		List<Agreement> manyAgr = new ArrayList<>();
		for (int i = begin; i < agr.size(); i++) {
			if(i == end)
				break;
			manyAgr.add(agr.get(i));
		}
		
		map.put("list", manyAgr);
		map.put("pageSize", Math.ceil((double)agr.size()/pageSize));
		return map;
	}

}
