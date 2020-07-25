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

public class HotInfo {

    public List<RecHotEntity> hot(HttpServletRequest request) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        IBuyDao hotFruit = session.getMapper(IBuyDao.class);
        List<RecHotEntity> hotEntities = hotFruit.hot();
        RecHotPictureService recHotPictureService = new RecHotPictureService();
        List<RecHotEntity> hots = recHotPictureService.downPicture(hotEntities,request,"down_pic3");
        tool.destroy();
        return hots;
    }
}
