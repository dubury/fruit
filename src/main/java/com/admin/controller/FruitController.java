package com.admin.controller;

import com.admin.dao.ICommodityDao;
import com.admin.dao.ISoldDao;
import com.admin.domain.Fruit;
import com.admin.domain.SaleInfo;
import com.admin.domain.SalePercent;
import com.admin.domain.Sold;
import com.admin.service.FindByIdFruit;
import com.config.Config;
import com.untils.MyBatisTool;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@SessionAttributes(value = {"admin", "pics", "fruit", "status", "kind","saleInfos","salePercents"})
@RequestMapping("/bgfruit")
public class FruitController {
    @RequestMapping("/save.do")
    public String save(int id, String name, int purchase, int sell, int quantity, String status, String kind,
                       MultipartFile main_pic, MultipartFile[] sub_pic) throws Exception {
        Fruit fruit = new Fruit();
        byte[] pic = main_pic.getBytes();
        byte[] pic1 = sub_pic[0].getBytes();
        byte[] pic2 = sub_pic[1].getBytes();
        byte[] pic3 = sub_pic[2].getBytes();
        fruit.setId(id);
        fruit.setName(name);
        fruit.setQuantity(quantity);
        fruit.setPurchase(purchase);
        fruit.setSell(sell);
        fruit.setStatus(status);
        fruit.setKind(kind);
        fruit.setMain_pic(pic);
        fruit.setSub_pic1(pic1);
        fruit.setSub_pic2(pic2);
        fruit.setSub_pic3(pic3);
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICommodityDao addCommodity = session.getMapper(ICommodityDao.class);
        boolean flag = addCommodity.saveFruit(fruit);
        if (flag) {
            ISoldDao soldDao = session.getMapper(ISoldDao.class);
            soldDao.saveSold(fruit.getId());
            tool.destroy();
            return "redirect:/backgroundshop/index.jsp";
        }
        else{
            tool.destroy();
            return "redirect:/backgroundshop/add.jsp";
        }
    }

    @RequestMapping(value = "/update.do")
    public String update(HttpServletRequest request, int id, Model model) throws Exception {

        FindByIdFruit findByIdFruit = (new FindByIdFruit());
        Fruit fruit = findByIdFruit.findById(id);
        String path = "down_pic1";
        Map map = findByIdFruit.downloadPicture(fruit, request, path);
        FileImageOutputStream output = (FileImageOutputStream) map.get("output");
        output.close();
        String main_pic = (String) map.get("main_pic");
        String sub_pic1 = (String) map.get("sub_pic1");
        String sub_pic2 = (String) map.get("sub_pic2");
        String sub_pic3 = (String) map.get("sub_pic3");
        String[] pics = {main_pic,sub_pic1, sub_pic2, sub_pic3};
        model.addAttribute("pics", pics);
        model.addAttribute("fruit", fruit);
        String[] status = {"selected", ""};
        String[] kind = {"selected", ""};
        if (fruit.getStatus().equals("下架")) {
            status[1] = "selected";
            status[0] = "";
        }
        if (fruit.getKind().equals("热卖")) {
            kind[1] = "selected";
            kind[0] = "";
        }
        model.addAttribute("status", status);
        model.addAttribute("kind", kind);
        return "redirect:/backgroundshop/update.jsp";
    }

    @RequestMapping("/updateInfo.do")
    public String updateInfo(int id, String name, int purchase, int sell, int quantity, String status, String kind,
                             MultipartFile main_pic, MultipartFile[] sub_pic, HttpServletRequest request) throws Exception {
        FindByIdFruit findByIdFruit = (new FindByIdFruit());
        Fruit fruit = findByIdFruit.findById(id);
        byte[] pic = main_pic.getBytes();
        byte[] pic1 = sub_pic[0].getBytes();
        byte[] pic2 = sub_pic[1].getBytes();
        byte[] pic3 = sub_pic[2].getBytes();

        System.out.println(fruit);
        fruit.setId(id);
        fruit.setName(name);
        fruit.setQuantity(quantity);
        fruit.setPurchase(purchase);
        fruit.setSell(sell);
        fruit.setStatus(status);
        fruit.setKind(kind);
        if (pic.length>0)
            fruit.setMain_pic(pic);
        if (pic1.length>0)
            fruit.setSub_pic1(pic1);
        if (pic2.length>0)
            fruit.setSub_pic2(pic2);
        if (pic3.length>0)
            fruit.setSub_pic3(pic3);
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICommodityDao info = session.getMapper(ICommodityDao.class);
        info.updateInfo(fruit);
        tool.destroy();
        return "redirect:/backgroundshop/index.jsp";
    }

    @RequestMapping("/delete.do")
    public String delete(int id) throws Exception {

        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICommodityDao delete = session.getMapper(ICommodityDao.class);
        delete.deleteInfo(id);
        tool.destroy();
        return "redirect:/backgroundshop/index.jsp";
    }

    @RequestMapping(value = "/salesTotal.do")
    public String salesTotal(Model model) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ISoldDao soldDao = session.getMapper(ISoldDao.class);
        Sold[] solds = soldDao.sold_all();
        SaleInfo[] saleInfos = new SaleInfo[solds.length];
        int i = 0;
        for(Sold sold:solds){
            ICommodityDao commodityDao = session.getMapper(ICommodityDao.class);
            Fruit fruit = commodityDao.findById(sold.getId());
            SaleInfo saleInfo = new SaleInfo();
            saleInfo.setFruit_name(fruit.getName());
            saleInfo.setSold_num(sold.getSold_num());
            saleInfos[i]=saleInfo;
            System.out.println(saleInfo.getFruit_name() + saleInfo.getSold_num());
            i++;
        }
        model.addAttribute("saleInfos",saleInfos);
        tool.destroy();
        return "redirect:/backgroundshop/chartNumber.jsp";
    }

    @RequestMapping(value = "/salesPercent.do")
    public String salesPercent(Model model) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ISoldDao soldDao = session.getMapper(ISoldDao.class);
        Sold[] solds = soldDao.sold_all();
        SalePercent[] salePercents = new SalePercent[solds.length];
        int i = 0;
        for(Sold sold:solds){
            ICommodityDao commodityDao = session.getMapper(ICommodityDao.class);
            Fruit fruit = commodityDao.findById(sold.getId());
            SalePercent salePercent = new SalePercent();
            salePercent.setFruit_name(fruit.getName());
            salePercent.setMoney(sold.getSold_num()*fruit.getSell());
            salePercents[i]=salePercent;
            i++;
        }
        model.addAttribute("salePercents",salePercents);
        tool.destroy();
        return "redirect:/backgroundshop/chartPercent.jsp";
    }
}
