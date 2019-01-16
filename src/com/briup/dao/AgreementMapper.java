package com.briup.dao;

import com.briup.bean.Agreement;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AgreementMapper {
    List<Agreement> queryAgr(HashMap<String,Object> map);
    Integer sum();
    void deleteAgr(Integer id);
    void updateAgr(Agreement agr);
    List<Agreement> AgrCheckByStaffId(HashMap<String,Object> map);
    List<Agreement> AgrCheckByAgrId(HashMap<String,Object> map);
    void insertAgr(Agreement agr);
    List<Agreement> findAgr(@Param("name") String name);
}
