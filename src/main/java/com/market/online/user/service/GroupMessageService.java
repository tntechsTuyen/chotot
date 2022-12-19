package com.market.online.user.service;

import com.market.online.dto.GroupDTO;
import com.market.online.entity.GroupMember;
import com.market.online.entity.GroupMessage;
import com.market.online.entity.User;
import com.market.online.repository.GroupMemberRepository;
import com.market.online.repository.GroupMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class GroupMessageService {

    @Autowired
    private GroupMessageRepository groupMessageRepository;

    @Autowired
    private GroupMemberRepository groupMemberRepository;

    @Autowired
    private UserService userService;

    public List<Map<String, Object>> getMyList(HttpServletRequest request){
        User userInfo = userService.getUserLogin(request);
        List<Map<String, Object>> lst = groupMessageRepository.getMyList(userInfo.getId());
        return lst;
    }

    public Integer create(HttpServletRequest request, Integer idUser){
        User userInfo = userService.getUserLogin(request);
        List<Map<String, Object>> lst = groupMemberRepository.checkGroupByUser(userInfo.getId(), idUser);
        Integer idGroup = 0;
        if(lst.size() > 0){
            idGroup = (Integer) lst.get(0).get("idGroup");
        }else{
            GroupMessage gms = new GroupMessage();
            gms.setIdType(1);
            groupMessageRepository.save(gms);
            idGroup = gms.getId();

            GroupMember gr = new GroupMember();
            gr.setIdGroup(idGroup);
            gr.setIdUser(idUser);
            groupMemberRepository.save(gr);
            gr.setId(0);
            gr.setIdUser(userInfo.getId());
            groupMemberRepository.save(gr);
        }
        return idGroup;
    }
}
