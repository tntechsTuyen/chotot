package com.market.online.admin.service;

import com.market.online.entity.Media;
import com.market.online.entity.Post;
import com.market.online.entity.PostMedia;
import com.market.online.entity.PostMeta;
import com.market.online.repository.MediaRepository;
import com.market.online.repository.PostMediaRepository;
import com.market.online.repository.PostMetaRepository;
import com.market.online.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminPostService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostMetaRepository postMetaRepository;

    @Autowired
    private MediaRepository mediaRepository;

    public Post getOne(Integer id){
        return postRepository.findById(id).get();
    }

    public Post getByProduct(Integer idProduct){
        return postRepository.findByIdProduct(idProduct).get();
    }

    public List<PostMeta> getMetaByIdPost(Integer idPost){
        return postMetaRepository.findByIdPost(idPost);
    }

    public List<Media> getMediaByIdPost(Integer idPost){
        return mediaRepository.getByIdPost(idPost);
    }
}
