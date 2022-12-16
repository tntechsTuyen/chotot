package com.market.online.user.service;

import com.market.online.entity.PostUser;
import com.market.online.entity.User;
import com.market.online.repository.PostRepository;
import com.market.online.repository.PostUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class PostUserService {

    @Autowired
    private PostUserRepository postUserRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private UserService userService;

    public boolean followPost(HttpServletRequest request, Integer idPost){
        User userInfo = userService.getUserLogin(request);
        if(userInfo == null) return false;
        PostUser postUser = postUserRepository.findByIdPostAndIdUser(idPost, userInfo.getId());
        if(postUser == null){
            postUser = new PostUser();
            postUser.setIdPost(idPost);
            postUser.setIdUser(userInfo.getId());
        }
        postUser.setHadFollow(!postUser.getHadFollow());
        postUserRepository.save(postUser);
        postRepository.updateDataPostUser(idPost);
        return true;
    }

    public boolean likePost(HttpServletRequest request, Integer idPost){
        User userInfo = userService.getUserLogin(request);
        if(userInfo == null) return false;
        PostUser postUser = postUserRepository.findByIdPostAndIdUser(idPost, userInfo.getId());
        if(postUser == null){
            postUser = new PostUser();
            postUser.setIdPost(idPost);
            postUser.setIdUser(userInfo.getId());
        }
        postUser.setHadLike(!postUser.getHadLike());
        postUserRepository.save(postUser);
        postRepository.updateDataPostUser(idPost);
        return true;
    }

    public boolean viewPost(HttpServletRequest request, Integer idPost){
        User userInfo = userService.getUserLogin(request);
        if(userInfo == null) return false;
        PostUser postUser = postUserRepository.findByIdPostAndIdUser(idPost, userInfo.getId());
        if(postUser == null){
            postUser = new PostUser();
            postUser.setIdPost(idPost);
            postUser.setIdUser(userInfo.getId());
            postUserRepository.save(postUser);
            postRepository.updateDataPostUser(idPost);
        }
        return true;
    }

}
