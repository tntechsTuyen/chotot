package com.market.online.user.service;

import com.market.online.common.utils.CryptoUtils;
import com.market.online.entity.User;
import com.market.online.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class UserService {

    @Value("${session.login}")
    private String SESSION_LOGIN;

    @Autowired
    private UserRepository userRepository;

    public boolean login(HttpServletRequest request, User user) throws Exception {
        User userInfo = userRepository.findByUsername(user.getUsername());
        String passEncode = CryptoUtils.AES.encrypt(user.getPassword());
        if(userInfo.getPassword().equals(passEncode)){
            request.getSession().setAttribute(SESSION_LOGIN, userInfo);
        }
        return userInfo.getPassword().equals(passEncode);
    }

    public User register(User user) throws Exception {
        User tmpUser = userRepository.findByUsername(user.getUsername());
        if(tmpUser != null) return null;
        user.setPassword(CryptoUtils.AES.encrypt(user.getPassword()));
        userRepository.save(user);
        return user;
    }

    public User getUserLogin(HttpServletRequest request){
        return (User) request.getSession().getAttribute(SESSION_LOGIN);
    }

    public boolean logout(HttpServletRequest request){
        request.getSession().removeAttribute(SESSION_LOGIN);
        return true;
    }
}
