package com.admin.dao;

import com.admin.domain.Fruit;

import java.util.List;

public interface ICommodityDao {

    List<Fruit> findAll();
    boolean saveFruit(Fruit fruit);
    Fruit findById(int id);
    void updateInfo(Fruit fruit);
    boolean deleteInfo(int id);
}
