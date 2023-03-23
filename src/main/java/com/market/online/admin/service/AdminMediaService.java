package com.market.online.admin.service;

import com.market.online.entity.Media;
import com.market.online.repository.MediaRepository;
import com.market.online.user.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminMediaService {

    @Autowired
    private FileService fileService;

    @Autowired
    private MediaRepository mediaRepository;

    public Media getOne(Integer id){
        return mediaRepository.findById(id).get();
    }

    public Media uploadFile(MultipartFile file){
        MultipartFile[] files = {file};
        String url = fileService.uploadFiles(files).get(0);
        Media media = new Media(url, "IMG");
        mediaRepository.save(media);
        return media;
    }
}
