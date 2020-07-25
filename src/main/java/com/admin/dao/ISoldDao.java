package com.admin.dao;

import com.admin.domain.Sold;

public interface ISoldDao {

    void saveSold(int id);
    void addSold(Sold sold);
    Sold[] sold_all();
}
