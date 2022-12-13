package com.market.online.user.controller;

import com.market.online.entity.Post;
import com.market.online.user.service.PostService;
import com.market.online.user.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private PostService postService;

    @GetMapping({"", "/list"})
    public String goProducts(Model model){

        return "user/component/product/list";
    }

    @GetMapping("/{id}")
    public String goProductDetail(Model model, @PathVariable("id") Integer id){
        Post post = postService.getByProduct(id);
        model.addAttribute("productData", productService.getOne(id));
        model.addAttribute("postData", post);
        model.addAttribute("mediaData", postService.getMediaByIdPost(post.getId()));
        model.addAttribute("metaData", postService.getMetaByIdPost(post.getId()));
        return "user/component/product/detail";
    }

    @GetMapping("/{id}/checkout")
    public String goCheckOut(){

        return "user/component/product/checkout";
    }
}
