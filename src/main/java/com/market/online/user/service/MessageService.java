package com.market.online.user.service;

import com.market.online.entity.GroupMember;
import com.market.online.entity.Message;
import com.market.online.entity.User;
import com.market.online.repository.GroupMemberRepository;
import com.market.online.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class MessageService {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    private GroupMemberRepository groupMemberRepository;

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserService userService;

    public Message create(Message message){
        User userInfo = userService.getOne(message.getIdUser());
        messageRepository.save(message);
        message.setName(userInfo.getFullName());
        List<GroupMember> members = groupMemberRepository.findByIdGroup(message.getIdGroup());
        members.forEach((el) -> {
            simpMessagingTemplate.convertAndSendToUser(el.getIdUser()+"", "/queue/messages", message);
        });
        return message;
    }

    public List<Map<String, Object>> getByGroup(Integer idGroup){
        if(idGroup == null) return new ArrayList<>();
        return messageRepository.getByGroup(idGroup);
    }
}
