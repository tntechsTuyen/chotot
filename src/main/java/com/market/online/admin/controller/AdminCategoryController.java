package com.market.online.admin.controller;

import com.market.online.admin.service.AdminCategoryMetaService;
import com.market.online.admin.service.AdminCategoryService;
import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.CategoryDTO;
import com.market.online.dto.CategoryMetaDTO;
import com.market.online.entity.Category;
import com.market.online.entity.CategoryMeta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {

    @Autowired
    private AdminCategoryService categoryService;

    @Autowired
    private AdminCategoryMetaService categoryMetaService;

    @GetMapping({"", "/list"})
    public String goList(Model model, CategoryDTO search){
        model.addAttribute("search", search);
        model.addAttribute("data", categoryService.getData(search));
        return "admin/component/category/list";
    }

    @GetMapping("/add")
    public String goAdd(Model model){
        model.addAttribute("categoryForm", new Category());
        return "admin/component/category/add";
    }

    @PostMapping("/add")
    public String doAdd(HttpServletRequest request, Category category){
        categoryService.addData(category);
        return "redirect: update/"+category.getId();
    }

    @GetMapping("/update/{id}")
    public String goUpdate(Model model, @PathVariable("id") Integer id){
        model.addAttribute("categoryForm", categoryService.getOne(id));
        model.addAttribute("metaData", categoryMetaService.getList(new CategoryMetaDTO(id)));
        model.addAttribute("metaForm", new CategoryMetaDTO());
        return "admin/component/category/update";
    }

    @PostMapping("/update/{id}")
    public String doUpdate(HttpServletRequest request, @PathVariable("id") Integer id, Category category){
        category.setId(id);
        categoryService.updateData(category);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @PostMapping("/{idCate}/meta/update")
    public String doMetaUpdate(HttpServletRequest request, @PathVariable("idCate") Integer idCate, CategoryMeta meta){
        meta.setIdCategory(idCate);
        categoryMetaService.save(meta);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
