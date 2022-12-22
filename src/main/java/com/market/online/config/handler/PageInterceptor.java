package com.market.online.config.handler;

import com.market.online.user.service.CategoryService;
import com.market.online.user.service.MessageService;
import com.market.online.user.service.PostUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Component
public class PageInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PostUserService postUserService;

    @Autowired
    private MessageService messageService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute("categoryList", categoryService.getAll());
        request.setAttribute("userPostInfo", postUserService.countLikeAndFollow(request));
        request.setAttribute("messageCount", messageService.countMessageNotRead(request));
        return super.preHandle(request, response, handler);
    }
}
