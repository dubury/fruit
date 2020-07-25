package com.admin.controller;

import com.admin.dao.IAdminDao;
import com.admin.domain.Admin;
import com.config.Config;
import com.untils.MyBatisTool;
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
@SessionAttributes(value = {"admin"})
@RequestMapping(path = "/admin")
public class AdminLoginRegister {

    @RequestMapping(path = "/login.do")
    public String loginAdmin(Admin admin, Model model) throws IOException {

        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        //4.使用SqlSession创建Dao接口的代理对象
        IAdminDao adminDao = session.getMapper(IAdminDao.class);

        Admin ad = adminDao.findByName(admin.getAdmin());
        tool.destroy();
        if (ad != null && ad.getPassword().equals(admin.getPassword())){
            model.addAttribute("admin",admin.getAdmin());
            return "redirect:/backgroundshop/index.jsp";
        }
        else
            return "redirect:/backgroundshop/login.jsp";
    }

    @RequestMapping(path = "/register.do")
    public String registerAdmin(String admin,String password,String repassword) throws IOException {

        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        //4.使用SqlSession创建Dao接口的代理对象
        IAdminDao adminDao = session.getMapper(IAdminDao.class);

        Admin ad = new Admin();
        ad.setAdmin(admin);
        ad.setPassword(password);
        boolean flag = adminDao.saveAdmin(ad);
        System.out.println(admin);
        tool.destroy();
        if (flag && repassword.equals(password)){
            return "redirect:/backgroundshop/login.jsp";
        }
        else
            return "redirect:/backgroundshop/register.jsp";
    }

    @RequestMapping("/loginout.do")
    public String loginout(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/backgroundshop/login.jsp";
    }

}
