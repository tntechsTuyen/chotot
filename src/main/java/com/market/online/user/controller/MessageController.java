package com.market.online.user.controller;

import com.market.online.user.service.GroupMemberService;
import com.market.online.user.service.GroupMessageService;
import com.market.online.user.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private GroupMessageService groupMessageService;

    @Autowired
    private MessageService messageService;

    @GetMapping({"", "/index"})
    public String goIndex(Model model, HttpServletRequest request, Integer id){
        model.addAttribute("messageData", messageService.getByGroup(id));
        model.addAttribute("groupData", groupMessageService.getMyList(request));
        model.addAttribute("idGroup", id);
        return "user/component/message";
    }

    @GetMapping("/create/{idUser}")
    public String doCreate(HttpServletRequest request, @PathVariable("idUser") Integer idUser){
        Integer idGroup = groupMessageService.create(request, idUser);
        return "redirect:/message?id="+idGroup;
    }
}
