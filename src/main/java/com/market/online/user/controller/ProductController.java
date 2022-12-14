package com.market.online.user.controller;

import com.market.online.entity.Comment;
import com.market.online.entity.Post;
import com.market.online.entity.Product;
import com.market.online.user.service.PostService;
import com.market.online.user.service.PostUserService;
import com.market.online.user.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping({"", "/list"})
    public String goProducts(Model model){

        return "user/component/product/list";
    }

    @GetMapping("/{id}")
    public String goProductDetail(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        Post post = postService.getByProduct(id);
        Product product = productService.getOne(id);
        postUserService.viewPost(request, post.getId());
        model.addAttribute("productData", product);
        model.addAttribute("postData", post);
        model.addAttribute("mediaData", postService.getMediaByIdPost(post.getId()));
        model.addAttribute("metaData", postService.getMetaByIdPost(post.getId()));
        model.addAttribute("commentData", postService.getCommentPost(post.getId()));
        model.addAttribute("productSameData", productService.getDataByIdCategory(request, product.getIdCategory()));
        model.addAttribute("commentForm", new Comment());
        return "user/component/product/detail";
    }

    @GetMapping("/{id}/checkout")
    public String goCheckOut(){

        return "user/component/product/checkout";
    }
}
