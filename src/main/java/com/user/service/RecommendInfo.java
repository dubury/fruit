package com.user.service;

import com.config.Config;
import com.untils.MyBatisTool;
import com.user.dao.IBuyDao;
import com.user.domain.RecHotEntity;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class RecommendInfo {

    public List<RecHotEntity> recommend(HttpServletRequest request) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        IBuyDao recommendFruit = session.getMapper(IBuyDao.class);
        List<RecHotEntity> recommendEntities = recommendFruit.recommend();
        RecHotPictureService recHotPictureService = new RecHotPictureService();
        List<RecHotEntity> recommends = recHotPictureService.downPicture(recommendEntities,request,"down_pic2");
        tool.destroy();
        return recommends;
    }

}
