package com.briup.service;

import com.briup.exception.MyException;

import java.util.HashMap;
import java.util.Map;

public interface ITrainTypeService {
    boolean TrainCheck(HashMap<String,Object>map);
    void deleteTrainType(Integer id) throws MyException;
    void updateTrainType(HashMap<String,Object> map) throws MyException;
    void inserTrainType(HashMap<String,Object>map) throws MyException;
	Map<String, Object> findTrainType(int pageNum, String name);
}
