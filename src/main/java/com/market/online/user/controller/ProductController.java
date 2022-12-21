package com.market.online.user.controller;

import com.market.online.dto.OrderDTO;
import com.market.online.dto.ProductDTO;
import com.market.online.entity.Comment;
import com.market.online.entity.Post;
import com.market.online.entity.Product;
import com.market.online.entity.User;
import com.market.online.user.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private PostService postService;

    @Autowired
    private PostUserService postUserService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @GetMapping({"", "/list"})
    public String goProducts(Model model, HttpServletRequest request, ProductDTO search){
        model.addAttribute("search", search);
        model.addAttribute("productData", productService.getPage(request, search));
        return "user/component/product/list";
    }

    @GetMapping("/like")
    public String goLike(Model model, HttpServletRequest request, ProductDTO search){
        model.addAttribute("search", search);
        model.addAttribute("productData", productService.getList(request, search));
        return "user/component/product/list";
    }

    @GetMapping("/{id}")
    public String goProductDetail(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        Post post = postService.getByProduct(id);
        Product product = productService.getOne(id);
        User userInfo = userService.getOne(product.getIdUser());
        postUserService.viewPost(request, post.getId());
        model.addAttribute("productData", product);
        model.addAttribute("postData", post);
        model.addAttribute("userData", userInfo);
        model.addAttribute("mediaData", postService.getMediaByIdPost(post.getId()));
        model.addAttribute("metaData", postService.getMetaByIdPost(post.getId()));
        model.addAttribute("commentData", postService.getCommentPost(post.getId()));
        model.addAttribute("productSameData", productService.getDataByIdCategory(request, product.getIdCategory()));
        model.addAttribute("commentForm", new Comment());
        return "user/component/product/detail";
    }

    @GetMapping("/{id}/checkout")
    public String goCheckOut(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        Product product = productService.getOne(id);
        model.addAttribute("buyerInfo", userService.getUserLogin(request));
        model.addAttribute("sellerInfo", userService.getOne(product.getIdUser()));
        model.addAttribute("productInfo", product);
        model.addAttribute("myProductData", productService.getMyData(request));
        return "user/component/product/checkout";
    }

    @PostMapping("/{id}/checkout")
    public String doCheckOut(Model model, HttpServletRequest request, @PathVariable("id") Integer id, OrderDTO orderDTO){
        orderDTO.setIdProduct(id);
        orderService.create(request, orderDTO);
        return "redirect: /";
    }
}
