package com.user.controller;

import com.admin.dao.ISoldDao;
import com.admin.domain.Fruit;
import com.admin.domain.Sold;
import com.admin.service.FindByIdFruit;
import com.config.Config;
import com.untils.MyBatisTool;
import com.user.dao.ICartDao;
import com.user.domain.Cart;
import com.user.domain.CartModel;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@SessionAttributes(value = {"fruitdetail", "picdetail"})
@RequestMapping("/front")
public class FrontFruitController {

    @RequestMapping(value = "/detail.do")
    public String detail(HttpServletRequest request, int id, Model model) throws Exception {

        FindByIdFruit findByIdFruit = (new FindByIdFruit());
        Fruit fruit = findByIdFruit.findById(id);
        String path = "down_pic4";
        Map map = findByIdFruit.downloadPicture(fruit, request, path);
        FileImageOutputStream output = (FileImageOutputStream) map.get("output");
        output.close();
        String main_pic = (String) map.get("main_pic");
        String sub_pic1 = (String) map.get("sub_pic1");
        String sub_pic2 = (String) map.get("sub_pic2");
        String sub_pic3 = (String) map.get("sub_pic3");
        String[] pics = {main_pic,sub_pic1, sub_pic2, sub_pic3};
        model.addAttribute("picdetail", pics);
        model.addAttribute("fruitdetail", fruit);
        return "redirect:/frontshop/details.jsp";
    }

    @RequestMapping(value = "/sold.do")
    public String userbuy(int sold_num, HttpSession httpSession) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ISoldDao soldDao = session.getMapper(ISoldDao.class);
        Fruit fruit = (Fruit) httpSession.getAttribute("fruitdetail");
        Sold sold = new Sold();
        sold.setId(fruit.getId());
        sold.setSold_num(sold_num);
        soldDao.addSold(sold);
        tool.destroy();
        return "redirect:/frontshop/details.jsp";
    }

    @RequestMapping(value = "/shopcart.do")
    public String addcart(int sold_num, HttpSession httpSession) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICartDao cartDao = session.getMapper(ICartDao.class);
        Fruit fruit = (Fruit) httpSession.getAttribute("fruitdetail");
        String username = (String) httpSession.getAttribute("user");
        Cart cart = new Cart();
        cart.setId(fruit.getId());
        cart.setCart_num(sold_num);
        cart.setUsername(username);
        Cart checkCart = cartDao.select(cart);
        if (checkCart == null)
            cartDao.insert(cart);
        else
            cartDao.update(cart);
        tool.destroy();
        return "redirect:/frontshop/details.jsp";
    }

    @RequestMapping(value = "/settlement.do")
    public String settlement(CartModel cartModel) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ISoldDao soldDao = session.getMapper(ISoldDao.class);
        ICartDao cartDao = session.getMapper(ICartDao.class);
        for(Cart cart:cartModel.getCarts()){
            Sold sold = new Sold();
            sold.setSold_num(cart.getCart_num());
            sold.setId(cart.getId());
            System.out.println(cart.getCart_num());
            soldDao.addSold(sold);
            cartDao.deleteById(cart);
        }
        tool.destroy();
        return "redirect:/frontshop/cart.jsp";
    }

    @RequestMapping(value = "/delCartCommodity.do")
    public String delCartCommodity(Cart cart) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICartDao cartDao = session.getMapper(ICartDao.class);
        cartDao.deleteById(cart);
        tool.destroy();
        return "redirect:/frontshop/cart.jsp";
    }

}
