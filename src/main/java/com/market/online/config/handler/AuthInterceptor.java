package com.market.online.config.handler;

import com.market.online.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor implements HandlerInterceptor {

    @Value("${session.login}")
    private String SESSION_LOGIN;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);
        try{
            boolean permission = (session.getAttribute(SESSION_LOGIN) != null);
            if(permission){
                return true;
            }else{
                response.sendRedirect("/home");
            }
        }catch (Exception e){

        }
        return false;
    }
}
