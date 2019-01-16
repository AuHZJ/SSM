package com.briup.dao;

import com.briup.bean.Train;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TrainMapper {
    List<Train> queryTrain(@Param("name") String name);
    Integer sum();
    void deleteTrain(Integer id);
    void updateTrain(HashMap<String,Object>map);
    void insertTrain(HashMap<String,Object>map);
}
