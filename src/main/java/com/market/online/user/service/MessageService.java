package com.market.online.user.service;

import com.market.online.entity.Message;
import com.market.online.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    public Message create(Message message){
        messageRepository.save(message);
    }

}
