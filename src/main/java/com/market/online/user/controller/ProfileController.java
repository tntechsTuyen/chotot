package com.market.online.user.controller;

import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.CategoryMetaDTO;
import com.market.online.dto.OrderDTO;
import com.market.online.dto.PostMetaDTO;
import com.market.online.dto.ProductDTO;
import com.market.online.entity.Order;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import com.market.online.user.service.*;
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

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @GetMapping({"", "/info"})
    public String goInfo(HttpServletRequest request, Model model){
        model.addAttribute("profileForm", userService.getUserLogin(request));
        return "user/component/profile/index";
    }

    @GetMapping("/order/buy")
    public String goOrderBuy(Model model, HttpServletRequest request, OrderDTO orderDTO){
        User userInfo = userService.getUserLogin(request);
        orderDTO.setIdBuyer(userInfo.getId());
        model.addAttribute("orderData", orderService.getMyOrder(orderDTO));
        return "user/component/profile/order_list";
    }

    @GetMapping("/order/sell")
    public String goOrderSell(Model model, HttpServletRequest request, OrderDTO orderDTO){
        User userInfo = userService.getUserLogin(request);
        orderDTO.setIdSeller(userInfo.getId());
        model.addAttribute("orderData", orderService.getMyOrder(orderDTO));
        return "user/component/profile/order_list";
    }

    @GetMapping("/order/{id}")
    public String goOrderDetail(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        Order orderInfo = orderService.getOne(id);
        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute("buyerInfo", userService.getOne(orderInfo.getIdBuyer()));
        model.addAttribute("sellerInfo", userService.getOne(orderInfo.getIdSeller()));
        model.addAttribute("productInfo", productService.getOne(orderInfo.getIdProduct()));
        return "user/component/profile/order_detail";
    }

    @GetMapping("/order/{id}/approve")
    public String goOrderApprove(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        return "user/component/profile/order_detail";
    }

    @GetMapping("/order/{id}/cancel")
    public String goOrderCancel(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        return "user/component/profile/order_detail";
    }

    @GetMapping("/product")
    public String goMyProducts(Model model, HttpServletRequest request){
        model.addAttribute("productData", productService.getMyData(request));
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
        productService.create(request, productForm);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @GetMapping("/product/{id}")
    public String goMyProductUpdate(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        return "user/component/profile/product_update";
    }
}
