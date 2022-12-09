package com.market.online.user.controller;

import com.market.online.common.utils.UrlUtils;
import com.market.online.entity.Product;
import com.market.online.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping({"", "/info"})
    public String goInfo(HttpServletRequest request, Model model){
        model.addAttribute("profileForm", userService.getUserLogin(request));
        return "user/component/profile/index";
    }

    @GetMapping("/order")
    public String goOrder(Model model){

        return "user/component/profile/order_list";
    }

    @GetMapping("/order/{id}")
    public String goDetail(Model model){

        return "user/component/profile/order_detail";
    }

    @GetMapping("/product")
    public String goMyProducts(Model model){

        return "user/component/profile/product_list";
    }

    @GetMapping("/product/add")
    public String goMyProductAdd(Model model){

        return "user/component/profile/product_add";
    }

    @PostMapping("/product/add")
    public String doMyProductAdd(Model model, HttpServletRequest request, Product product){

        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @GetMapping("/product/{id}")
    public String goMyProductUpdate(Model model, @PathVariable("id") Integer id){

        return "user/component/profile/product_update";
    }
}
