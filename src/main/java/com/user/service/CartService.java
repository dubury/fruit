package com.user.service;

import com.admin.dao.ICommodityDao;
import com.admin.domain.Fruit;
import com.config.Config;
import com.untils.MyBatisTool;
import com.user.dao.ICartDao;
import com.user.domain.Cart;
import com.user.domain.SelfCart;
import com.user.domain.User;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CartService {

    public List<SelfCart> carts(HttpServletRequest request) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();

        String username = (String) request.getSession().getAttribute("user");

        String path = request.getSession().getServletContext().getRealPath(File.separator) + "\\cart\\";
        File file = new File(path);
        FileUtils.deleteQuietly(file);
        file.mkdirs();

        ICartDao cartDao = session.getMapper(ICartDao.class);
        //在Cart表里面通过username值查该用户所有购物车的商品id
        Cart[] findCarts = cartDao.selectByName(username);


        //用List来保存查到的购物车信息详情
        List<SelfCart> selfCarts = new ArrayList<>();

        ICommodityDao commodityDao = session.getMapper(ICommodityDao.class);

        //遍历该用户的购物车
        for (Cart findCart : findCarts) {

            if(findCart.getCart_num() <= 0)
                cartDao.deleteById(findCart);
            //遍历该用户的购物车，将查到的商品id,通过商品id通过Commodity表查找该商品
            Fruit fruit = commodityDao.findById(findCart.getId());

            SelfCart selfCart = new SelfCart();

            selfCart.setUsername(username);
            selfCart.setFruit_id(fruit.getId());
            selfCart.setCart_num(findCart.getCart_num());
            selfCart.setFruit_name(fruit.getName());
            selfCart.setSell_price(fruit.getSell());

            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            FileImageOutputStream imageOutput = new FileImageOutputStream(new File(path + uuid + ".jpg"));
            imageOutput.write(fruit.getMain_pic(), 0, fruit.getMain_pic().length);
            selfCart.setMain_pic("../cart/" + uuid + ".jpg");
            selfCarts.add(selfCart);
        }
        tool.destroy();
        return selfCarts;
    }

}
