package com.briup.service;


import com.briup.bean.Administrator;

public interface IAdmService {
    boolean checkAdm(Administrator adminstrator);
    void  insertAdm(Administrator adminstrator);
	boolean exist(String username);
	void delete(Administrator administrator);
}
