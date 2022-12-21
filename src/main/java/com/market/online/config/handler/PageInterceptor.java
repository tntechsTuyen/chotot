package com.market.online.config.handler;

import com.market.online.user.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class PageInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private CategoryService categoryService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute("categoryList", categoryService.getAll());
        System.out.println("Path: "+request.getPathInfo());
        System.out.println("ContextPath: "+request.getContextPath());
        System.out.println("RequestURI: "+request.getRequestURI());
        return super.preHandle(request, response, handler);
    }
}
