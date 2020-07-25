package com.user.dao;

import com.user.domain.RecHotEntity;

import java.util.List;

public interface IBuyDao {

    List<RecHotEntity> recommend();
    List<RecHotEntity> hot();
    List<RecHotEntity> all();
}
