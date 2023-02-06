package com.market.online.user.service;

import com.market.online.common.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Slf4j
@Service
public class FileService {

    @Value("${data.path}")
    private String dataPath;

    public List<String> updloadFiles(MultipartFile[] files) {
        List<String> resultUrl = new ArrayList<>();
        String subFolder = DateUtils.format("yyyy/mm/dd");
        int i = 0;
        for (MultipartFile uploadedFile : files) {
            if(uploadedFile.isEmpty()) break;
            checkSubFolder(subFolder);
            String nameFile = DateUtils.format("yyyymmddHHMMss"+i);
            File file = new File(dataPath + subFolder + "/" + nameFile);
            try {
                uploadedFile.transferTo(file);
                boolean isImage = checkTypeFileIsImage(file);
                if(!isImage){
                    nameFile += ".jpg";
                }
                resultUrl.add(subFolder + "/" + nameFile);
            } catch (IOException e) {
                log.error("### upload error", e);
                return new ArrayList<>();
            }
            i++;
        }
        return resultUrl;
    }

    private void checkSubFolder(String mSubFolder){
        File theMedia = new File(dataPath +mSubFolder);
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
