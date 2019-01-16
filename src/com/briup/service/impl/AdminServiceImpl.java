package com.briup.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Administrator;
import com.briup.dao.AdmMapper;
import com.briup.service.IAdmService;

@Service("adminService")
public class AdminServiceImpl implements IAdmService{

	@Autowired
	private AdmMapper adminDao;
	
	@Override
	public boolean checkAdm(Administrator adminstrator) {
		// TODO Auto-generated method stub
		Administrator check = adminDao.check(adminstrator);
		if (check!=null) {
			return true;
		}
		return false;
	}

	@Override
	public void insertAdm(Administrator adminstrator) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean exist(String username) {
		// TODO Auto-generated method stub
		Administrator exist = adminDao.exist(username);
		if (exist!=null) {
			System.out.println(exist);
			return true;
		}
		return false;
	}

	@Override
	public void delete(Administrator administrator) {
		// TODO Auto-generated method stub
		
	}

}
