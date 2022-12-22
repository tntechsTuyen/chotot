package com.market.online.user.service;

import com.market.online.common.utils.ListUtils;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GroupMessageService {

    @Autowired
    private GroupMessageRepository groupMessageRepository;

    @Autowired
    private GroupMemberRepository groupMemberRepository;

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    public List<Map<String, Object>> getMyList(HttpServletRequest request){
        User userInfo = userService.getUserLogin(request);
        if(userInfo == null) return new ArrayList<>();
        List<Map<String, Object>> lst = groupMessageRepository.getMyList(userInfo.getId());
        List<Map<String, Object>> lstMessNotRead = messageService.countMessageNotReadByGroup(request);
        List<Map<String, Object>> result = new ArrayList<>();
        if(lstMessNotRead.size() > 0){
            Map<String, List<Map<String, Object>>> mapMessNotRead = ListUtils.toMapList(lstMessNotRead, "idGroup", true);
            for(int i = 0; i < lst.size(); i++){
                Integer idGroup = (Integer) lst.get(i).get("id");
                Map<String, Object> item = new HashMap<>(lst.get(i));
                item.replace("totalUnRead", mapMessNotRead.get(idGroup+"") == null ? 0 : mapMessNotRead.get(idGroup+"").get(0).get("total"));
                result.add(item);
            }
        }else{
            result.addAll(lst);
        }
        return result;
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
