package com.briup.dao;

import com.briup.bean.Alter;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AlterMapper {
    List<Alter> queryAlter(HashMap<String,Object> map);
    Integer sum();
    void deleteAlter(Integer id);
    void updateAlter(Alter alter);
    void insertAlter(Alter alter);
    List<Alter> findAllAlter();
    List<Alter> findAlterByName(@Param("name") String name);
}
