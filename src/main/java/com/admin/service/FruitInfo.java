package com.admin.service;

import com.admin.dao.ICommodityDao;
import com.admin.domain.Fruit;
import com.config.Config;
import com.untils.MyBatisTool;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;
import java.util.List;

public class FruitInfo {

    public List<Fruit> findAllFruit() throws IOException {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICommodityDao commodityDao = session.getMapper(ICommodityDao.class);
        List<Fruit> fruits = commodityDao.findAll();
        return fruits;
    }

}
