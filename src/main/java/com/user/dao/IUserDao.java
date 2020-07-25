package com.user.dao;

import com.user.domain.User;

public interface IUserDao {

    User findByName(String username);
    boolean saveUser(User user);

}
