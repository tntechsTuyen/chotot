package com.market.online.user.service;

import com.market.online.entity.Comment;
import com.market.online.entity.User;
import com.market.online.repository.CommentRepository;
import com.market.online.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private UserService userService;

    public boolean create(HttpServletRequest request, Comment comment){
        if(comment.getContent().trim().length() == 0) return false;
        User userInfo = userService.getUserLogin(request);
        comment.setId(0);
        comment.setIdUser(userInfo.getId());
        commentRepository.save(comment);
        postRepository.updateDataComment(comment.getIdPost());
        return true;
    }
}
