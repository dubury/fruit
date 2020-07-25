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

public class AllInfo {

    public List<RecHotEntity> all(HttpServletRequest request) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        IBuyDao allFruit = session.getMapper(IBuyDao.class);
        List<RecHotEntity> allEntities = allFruit.all();
        RecHotPictureService recHotPictureService = new RecHotPictureService();
        List<RecHotEntity> hots = recHotPictureService.downPicture(allEntities,request,"down_pic4");
        tool.destroy();
        return hots;
    }
}
