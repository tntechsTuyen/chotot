package com.market.online.user.controller;

import com.market.online.common.utils.UrlUtils;
import com.market.online.entity.Comment;
import com.market.online.user.service.CommentService;
import com.market.online.user.service.PostUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private PostUserService postUserService;

    @GetMapping("/{id}/follow")
    public String doFollow(HttpServletRequest request, @PathVariable("id") Integer id){
        postUserService.followPost(request, id);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @GetMapping("/{id}/like")
    public String doLike(HttpServletRequest request, @PathVariable("id") Integer id){
        postUserService.likePost(request, id);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @PostMapping("/{id}/comment")
    public String doComment(HttpServletRequest request, @PathVariable("id") Integer id, @ModelAttribute("commentForm") Comment comment){
        comment.setIdPost(id);
        commentService.create(request, comment);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
