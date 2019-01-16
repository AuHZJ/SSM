package com.briup.dao;

import com.briup.bean.TrainType;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TrainTypeMapper {
    List<TrainType> TrainCheck(HashMap<String,Object> map);
    List<TrainType> queryTrainType(@Param("name") String name);
    Integer sum();
    void deleteTrainType(Integer id);
    void updateTrainType(HashMap<String,Object> map);
    void insertTrainType(HashMap<String,Object> map);
}
