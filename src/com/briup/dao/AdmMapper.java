package com.briup.dao;

import com.briup.bean.Administrator;

public interface AdmMapper {
    Administrator exist(String username);
    Administrator check(Administrator administrator);
    void insertAdm(Administrator administrator);
    void deleteAdm(String admin_username);
}
