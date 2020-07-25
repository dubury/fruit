package com.untils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.InputStream;

@Component
public class MyBatisTool {
    InputStream in;
    SqlSession session;

    @Autowired
    public MyBatisTool() {
    }

    public SqlSession init() throws IOException {
        //1.读取配置文件
        in = Resources.getResourceAsStream("mybatis/SqlMapConfig.xml");
        //2.创建SqlSessionFactory工厂
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(in);
        //3.使用工厂生产SqlSession对象
        session = factory.openSession();
        return session;
    }

    public void destroy() throws IOException {
        session.commit();   //提交事务
        //6.释放资源
        session.close();
        in.close();
    }
}
