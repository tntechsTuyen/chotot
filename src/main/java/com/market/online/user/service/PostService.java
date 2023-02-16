package com.market.online.user.service;

import com.market.online.entity.Media;
import com.market.online.entity.Post;
import com.market.online.entity.PostMeta;
import com.market.online.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private PostMetaRepository postMetaRepository;

    @Autowired
    private MediaRepository mediaRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private PostMediaRepository postMediaRepository;

    @Autowired
    private PostUserRepository postUserRepository;

    public Post getByProduct(Integer idProduct){
        return postRepository.findByIdProduct(idProduct).get();
    }

    public List<PostMeta> getMetaByIdPost(Integer idPost){
        return postMetaRepository.findByIdPost(idPost);
    }

    public List<Media> getMediaByIdPost(Integer idPost){
        return mediaRepository.getByIdPost(idPost);
    }

    public List<Map<String, Object>> getCommentPost(Integer idPost){
        return commentRepository.getDataByIdPost(idPost);
    }

    public void deletePostByIdProduct(Integer idProduct){
        /*
         * Post_Media
         * Post_User
         * Comment
         * Post_Meta
         * Post
         * */
        Post postInfo = getByProduct(idProduct);
        postMediaRepository.deleteByIdPost(postInfo.getId());
        postUserRepository.deleteByIdPost(postInfo.getId());
        commentRepository.deleteByIdPost(postInfo.getId());
        postMetaRepository.deleteByIdPost(postInfo.getId());
        postRepository.deleteById(postInfo.getId());
    }
}
