package com.market.online.user.controller;

import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.CategoryMetaDTO;
import com.market.online.dto.PostMetaDTO;
import com.market.online.dto.ProductDTO;
import com.market.online.entity.Product;
import com.market.online.user.service.CategoryMetaService;
import com.market.online.user.service.CategoryService;
import com.market.online.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryMetaService categoryMetaService;

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
    public String goMyProductAdd(Model model, ProductDTO productForm){
        model.addAttribute("productForm", productForm);
        model.addAttribute("categoryData", categoryService.getAll());
        model.addAttribute("categoryMetaData", categoryMetaService.getByIdCategory(new CategoryMetaDTO(productForm.getIdCategory())));
        return "user/component/profile/product_add";
    }

    @PostMapping("/product/add")
    public String doMyProductAdd(Model model, HttpServletRequest request, @ModelAttribute("productForm") ProductDTO productForm){
        System.out.println("Test");
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @GetMapping("/product/{id}")
    public String goMyProductUpdate(Model model, @PathVariable("id") Integer id){

        return "user/component/profile/product_update";
    }
}
