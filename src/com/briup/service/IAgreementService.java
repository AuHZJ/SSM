package com.briup.service;


import com.briup.bean.Agreement;
import com.briup.exception.MyException;

import java.util.HashMap;
import java.util.Map;

public interface IAgreementService {
    void deleteAgr(Integer id);
    void updateAgr(Agreement agr);
    boolean AgrCheckByStaffId(HashMap<String,Object> map) throws Exception;
    boolean AgrCheckByAgrId(HashMap<String,Object> map) throws Exception;
    void  insertAgr(Agreement agr) throws MyException;
	Map<String, Object> findAgreement(int pageNum, String name);
}
