package com.briup.service;


import com.briup.exception.MyException;

import java.util.HashMap;

import java.util.Map;

public interface ITrainService {
    void deleteTrain(Integer id);
    void updateTrain(HashMap<String,Object>map) throws MyException;
    void insertTrain(HashMap<String,Object>map) throws MyException;
	Map<String, Object> findTrain(int pageNum, String name);
}
