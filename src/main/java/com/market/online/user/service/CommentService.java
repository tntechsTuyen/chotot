package com.market.online.user.service;

import com.market.online.entity.Comment;
import com.market.online.entity.User;
import com.market.online.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserService userService;

    public boolean create(HttpServletRequest request, Comment comment){
        if(comment.getContent().trim().length() == 0) return false;
        User userInfo = userService.getUserLogin(request);
        comment.setIdUser(userInfo.getId());
        commentRepository.save(comment);
        return true;
    }
}
