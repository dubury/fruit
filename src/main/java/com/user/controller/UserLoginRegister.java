package com.user.controller;

import com.admin.dao.IAdminDao;
import com.config.Config;
import com.untils.MyBatisTool;
import com.user.dao.IUserDao;
import com.user.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import java.io.IOException;

@Controller
@SessionAttributes(value = {"user"})
@RequestMapping(path = "/user")
public class UserLoginRegister {

    @RequestMapping(path = "/login.do")
    public String loginUser(User user, Model model) throws IOException {
        System.out.println("*******************************");
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        //4.使用SqlSession创建Dao接口的代理对象
        IUserDao userDao = session.getMapper(IUserDao.class);

        User us = userDao.findByName(user.getUsername());
        tool.destroy();
        if (us != null && us.getPassword().equals(user.getPassword())) {
            model.addAttribute("user", us.getUsername());
            return "redirect:/frontshop/index.jsp";
        } else
            return "redirect:/frontshop/user.jsp";
    }

    @RequestMapping(path = "/register.do")
    public String registerUser(User user) throws IOException {

        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        //4.使用SqlSession创建Dao接口的代理对象
        IUserDao userDao = session.getMapper(IUserDao.class);
        userDao.saveUser(user);
        tool.destroy();
        return "redirect:/frontshop/user.jsp";
    }
}
