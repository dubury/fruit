package com.admin.dao;

import com.admin.domain.Admin;

public interface IAdminDao {

    Admin findByName(String name);
    boolean saveAdmin(Admin admin);

}
