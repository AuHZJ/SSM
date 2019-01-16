package com.briup.dao;

import com.briup.bean.Page;

import java.util.List;

public interface BaseDao<T> {

    void insert(T film);

    int deleteById(Long id);
    
    int update(T dto);

    List<T> query(Page<T> dto);

}
