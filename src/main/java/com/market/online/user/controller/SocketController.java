package com.market.online.user.controller;

import com.market.online.entity.Message;
import com.market.online.user.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SocketController {

    @Autowired
    private MessageService messageService;

    @MessageMapping("/chat")
    public void chat(HttpServletRequest request, @Payload Message message){
        messageService.create(request, message);
    }
}
