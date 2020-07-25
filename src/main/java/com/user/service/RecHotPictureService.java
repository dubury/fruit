package com.user.service;

import com.user.domain.RecHotEntity;
import org.apache.commons.io.FileUtils;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

public class RecHotPictureService {

    public List<RecHotEntity> downPicture(List<RecHotEntity> recommendEntities, HttpServletRequest request, String kind_path) throws Exception {
        FileImageOutputStream imageOutput = null;
        String path = request.getSession().getServletContext().getRealPath(File.separator) + "\\" + kind_path + "\\";
        File file = new File(path);
        FileUtils.deleteQuietly(file);
        file.mkdirs();
        for(RecHotEntity recHotEntity :recommendEntities) {
            byte[] pic = recHotEntity.getMain_pic();
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            if (pic != null) {
                imageOutput = new FileImageOutputStream(new File(path + uuid + ".jpg"));
                imageOutput.write(pic, 0, pic.length);
            }
            recHotEntity.setPic_path("../" + kind_path + "/" + uuid+".jpg");
        }
        imageOutput.close();
        return recommendEntities;
    }
}
