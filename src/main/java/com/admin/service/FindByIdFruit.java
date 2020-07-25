package com.admin.service;

import com.admin.dao.ICommodityDao;
import com.admin.domain.Fruit;
import com.config.Config;
import com.untils.MyBatisTool;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class FindByIdFruit {

    public Fruit findById(int id) throws Exception {
        ApplicationContext context = new AnnotationConfigApplicationContext(Config.class);
        MyBatisTool tool = context.getBean(MyBatisTool.class);
        SqlSession session = tool.init();
        ICommodityDao updateCommodity = session.getMapper(ICommodityDao.class);
        Fruit fruit = updateCommodity.findById(id);
        return fruit;
    }

    public Map downloadPicture(Fruit fruit, HttpServletRequest request, String download_path) throws IOException {
        byte[] pic = fruit.getMain_pic();
        byte[] pic1 = fruit.getSub_pic1();
        byte[] pic2 = fruit.getSub_pic2();
        byte[] pic3 = fruit.getSub_pic3();
        FileImageOutputStream imageOutput = null;
        String uuid;
        String path = request.getSession().getServletContext().getRealPath(File.separator) + "\\"+download_path+"\\";
        File file = new File(path);
        FileUtils.deleteQuietly(file);
        file.mkdirs();
        Map map = new HashMap();
        if (pic != null) {
            uuid = UUID.randomUUID().toString().replaceAll("-", "");
            imageOutput = new FileImageOutputStream(new File(path+ uuid + ".jpg"));
            imageOutput.write(pic, 0, pic.length);
            map.put("main_pic","../"+download_path+"/"+uuid + ".jpg");
        }
        if (pic1 != null) {
            uuid = UUID.randomUUID().toString().replaceAll("-", "");
            imageOutput = new FileImageOutputStream(new File(path+ uuid + ".jpg"));
            imageOutput.write(pic1, 0, pic1.length);
            map.put("sub_pic1","../"+download_path+"/"+uuid + ".jpg");
        }
        if (pic2 != null) {
            uuid = UUID.randomUUID().toString().replaceAll("-", "");
            imageOutput = new FileImageOutputStream(new File(path+ uuid + ".jpg"));
            imageOutput.write(pic2, 0, pic2.length);
            map.put("sub_pic2","../"+download_path+"/"+uuid + ".jpg");
        }
        if (pic3 != null) {
            uuid = UUID.randomUUID().toString().replaceAll("-", "");
            imageOutput = new FileImageOutputStream(new File(path+ uuid + ".jpg"));
            imageOutput.write(pic3, 0, pic3.length);
            map.put("sub_pic3","../"+download_path+"/"+uuid + ".jpg");
        }
        map.put("output",imageOutput);
        return map;
    }
}
