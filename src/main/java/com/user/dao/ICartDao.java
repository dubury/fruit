package com.user.dao;

import com.user.domain.Cart;

public interface ICartDao {

    Cart select(Cart cart);
    Cart[] selectByName(String username);
    void insert(Cart cart);
    void update(Cart cart);
    void deleteById(Cart cart);
}
