package com.market.online.admin.service;

import com.market.online.entity.PostMedia;
import com.market.online.repository.PostMediaRepository;
import com.market.online.repository.PostMetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminPostMediaService {

    @Autowired
    private PostMediaRepository postMediaRepository;

}
