package com.briup.service;


import java.util.Map;

import com.briup.bean.Alter;

public interface IAlterService {
    void deleteAlter(Integer id);
    void updateAlter(Alter alter);
    void insertAlter(Alter alter);
	Map<String, Object> findAlter(int pageNum, String name);
}
