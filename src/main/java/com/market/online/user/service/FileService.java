package com.market.online.user.service;

import com.market.online.common.DataStatic;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Slf4j
@Service
public class FileService {

    @Value("${data.res}")
    private String dataRes;

    public List<String> updloadFiles(MultipartFile[] files) {
        List<String> resultUrl = new ArrayList<>();
        String subFolder = "media/"+ DataStatic.FILE.SUB_FOLDER(true);
        for (MultipartFile uploadedFile : files) {
            checkSubFolder(subFolder);
            File file = new File(dataRes + subFolder + uploadedFile.getOriginalFilename());

            log.info("### upload info", uploadedFile.getOriginalFilename());
            try {
                uploadedFile.transferTo(file);
                boolean isImage = checkTypeFileIsImage(file);
                String nameFile = uploadedFile.getOriginalFilename();
                if(!isImage){
                    nameFile += ".jpg";
                    file = new File(dataRes + subFolder + nameFile);
                }

                resultUrl.add("ws-data/res/" + subFolder + nameFile);
                BufferedImage img = ImageIO.read(file);
//                BufferedImage thumb = Scalr.resize(img, Scalr.Method.QUALITY, Scalr.Mode.AUTOMATIC, 200, 100, Scalr.OP_ANTIALIAS);

            } catch (IOException e) {
                log.error("### upload error", e);
                return new ArrayList<>();
            }
        }
        return resultUrl;
    }

    private void checkSubFolder(String mSubFolder){
        File theMedia = new File(dataRes+mSubFolder);
        if (!theMedia.exists()){
            theMedia.mkdirs();
        }
    }

    public boolean checkTypeFileIsImage(File mFile){
        String typeFile = FilenameUtils.getExtension(mFile.getPath());
        if (typeFile.isEmpty() || typeFile.trim().length() == 0){
            File fileExtension = new File(mFile.getPath()+".jpg");
            mFile.renameTo(fileExtension);
            return false;
        }
        return true;
    }
}
