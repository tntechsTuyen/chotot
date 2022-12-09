package com.market.online.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @GetMapping({"", "/home"})
    public String goHome(Model model){
        return "admin/component/home";
    }
}
