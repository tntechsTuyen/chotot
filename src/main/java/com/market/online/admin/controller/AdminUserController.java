package com.market.online.admin.controller;

import com.market.online.admin.service.AdminUserService;
import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.UserDTO;
import com.market.online.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private AdminUserService userService;

    @GetMapping({"", "/list"})
    public String goList(Model model, UserDTO search){
        model.addAttribute("search", search);
        model.addAttribute("data", userService.getDataPage(search));
        return "admin/component/user/list";
    }

    @GetMapping("/update/{id}")
    public String goUpdate(Model model, @PathVariable("id") Integer id){
        model.addAttribute("userForm", userService.getOne(id));
        return "admin/component/user/update";
    }

    @PostMapping("/update/{id}")
    public String doUpdate(HttpServletRequest request, @PathVariable("id") Integer id, @ModelAttribute("userForm") User user) throws Exception {
        user.setId(id);
        userService.update(user);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
