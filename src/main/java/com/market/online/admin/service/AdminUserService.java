package com.market.online.admin.service;

import com.market.online.dto.UserDTO;
import com.market.online.entity.User;
import com.market.online.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public class AdminUserService {

    @Autowired
    private UserRepository userRepository;

    public User getOne(Integer id){
        return userRepository.findById(id).get();
    }

    public Page<User> getDataPage(UserDTO search){
        return userRepository.getDataPage(search, search.pageable());
    }

    public void update(User user) throws Exception {
        User userInfo = getOne(user.getId());
        userInfo.setFullName(user.getFullName());
        userInfo.setPhone(user.getPhone());
        userInfo.setAddress(user.getAddress());
        userInfo.setEmail(user.getEmail());
        userInfo.setGender(user.getGender());
        userInfo.setIdRole(user.getIdRole());

        if(user.getPassword() != null && user.getPassword().length() > 0){
            userInfo.setPassword(user.getPassword());
        }
        userRepository.save(userInfo);
    }

    public User locked(Integer id){
        User userInfo = this.getOne(id);
        if(userInfo.getIsLocked() == 2) return null;
        userInfo.setIsLocked(2);
        userRepository.save(userInfo);
        return userInfo;
    }

    public User unlocked(Integer id){
        User userInfo = this.getOne(id);
        if(userInfo.getIsLocked() == 1) return null;
        userInfo.setIsLocked(1);
        userRepository.save(userInfo);
        return userInfo;
    }
}
