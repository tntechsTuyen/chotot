package com.market.online.service.impl;

import com.market.online.common.utils.DateUtils;
import com.market.online.service.IFileService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

@Slf4j
@Service
public class FileService implements IFileService {

    @Value("${data.path}")
    private String dataPath;

    @Override
    public String updloadFile(MultipartFile uploadedFile) {
        String resultUrl = "";
        String subFolder = DateUtils.format("/yyyy/MM/dd/");
        String newName = DateUtils.format("yyyyMMddhhmmssSSS");
        String ext = FilenameUtils.getExtension(uploadedFile.getOriginalFilename());
        checkSubFolder(subFolder);
        File file = new File(String.format("%s%s%s%s.%s", dataPath, "/media", subFolder, newName, ext));

        log.info("### upload info", uploadedFile.getOriginalFilename());
        try {
            uploadedFile.transferTo(file);
            resultUrl = String.format("%s%s%s.%s", "static/media", subFolder, newName, ext);
            BufferedImage img = ImageIO.read(file);
        } catch (IOException e) {
            log.error("### upload error", e);
        }
        return resultUrl;
    }

    private void checkSubFolder(String mSubFolder){
        File theMedia = new File(dataPath+mSubFolder);
        if (!theMedia.exists()){
            theMedia.mkdirs();
        }
    }
}
