package com.market.online.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

    @GetMapping({"", "/list"})
    public String goProducts(Model model){

        return "user/component/product/list";
    }

    @GetMapping("/{id}")
    public String goProductDetail(){

        return "user/component/product/detail";
    }

    @GetMapping("/{id}/checkout")
    public String goCheckOut(){

        return "user/component/product/checkout";
    }
}
