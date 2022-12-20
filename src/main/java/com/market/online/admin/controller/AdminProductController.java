package com.market.online.admin.controller;

import com.market.online.admin.service.AdminCategoryService;
import com.market.online.admin.service.AdminPostService;
import com.market.online.admin.service.AdminProductService;
import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.ProductDTO;
import com.market.online.entity.Post;
import com.market.online.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {

    @Autowired
    private AdminProductService adminProductService;

    @Autowired
    private AdminPostService adminPostService;

    @Autowired
    private AdminCategoryService adminCategoryService;

    @GetMapping({"", "/list"})
    public String goList(Model model, ProductDTO search){
        model.addAttribute("search", search);
        model.addAttribute("categoryData", adminCategoryService.getAll());
        model.addAttribute("data", adminProductService.getDataPage(search));
        return "admin/component/product/list";
    }

    @GetMapping("/update/{id}")
    public String goUpdate(Model model, @PathVariable("id") Integer id){
        Product productInfo = adminProductService.getOne(id);
        Post postInfo = adminPostService.getByProduct(id);
        model.addAttribute("productForm", productInfo);
        model.addAttribute("mediaData", adminPostService.getMediaByIdPost(postInfo.getId()));
        model.addAttribute("metaData", adminPostService.getMetaByIdPost(postInfo.getId()));
        return "admin/component/product/update";
    }

    @PostMapping("/update/{id}")
    public String doUpdate(HttpServletRequest request, @PathVariable("id") Integer id, @ModelAttribute("productForm") Product product){
        product.setId(id);
        adminProductService.update(product);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
