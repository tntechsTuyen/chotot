package com.market.online.user.service;

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
        if(userInfo.getIsLocked() == 2) return false;
        if(userInfo.getPassword().equals(user.getPassword())){
            request.getSession().setAttribute(SESSION_LOGIN, userInfo);
        }
        return userInfo.getPassword().equals(user.getPassword());
    }

    public User register(User user) throws Exception {
        User tmpUser = userRepository.findByUsername(user.getUsername());
        if(tmpUser != null) return null;
        userRepository.save(user);
        return user;
    }

    public User getUserLogin(HttpServletRequest request){
        return (User) request.getSession().getAttribute(SESSION_LOGIN);
    }

    public User getOne(Integer id){
        User userInfo = userRepository.findById(id).get();
        userInfo.setRate(userRepository.getUserRate(userInfo.getId()));
        return userInfo;
    }

    public void update(HttpServletRequest request, User userForm){
        User userInfo = (User) request.getSession().getAttribute(SESSION_LOGIN);
        userInfo.setFullName(userForm.getFullName());
        userInfo.setEmail(userForm.getEmail());
        userInfo.setGender(userForm.getGender());
        userInfo.setPassword(userForm.getPassword());
        userInfo.setAddress(userForm.getAddress());
        userInfo.setPhone(userForm.getPhone());
        userRepository.save(userInfo);
    }

    public void logout(HttpServletRequest request){
        request.getSession().removeAttribute(SESSION_LOGIN);
    }
}
