package com.market.online.admin.controller;

import com.market.online.admin.service.AdminCategoryMetaService;
import com.market.online.admin.service.AdminCategoryService;
import com.market.online.admin.service.AdminMediaService;
import com.market.online.common.utils.UrlUtils;
import com.market.online.dto.CategoryDTO;
import com.market.online.dto.CategoryMetaDTO;
import com.market.online.entity.Category;
import com.market.online.entity.CategoryMeta;
import com.market.online.entity.Media;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {

    @Autowired
    private AdminCategoryService categoryService;

    @Autowired
    private AdminCategoryMetaService categoryMetaService;

    @Autowired
    private AdminMediaService adminMediaService;

    @GetMapping({"", "/list"})
    public String goList(Model model, CategoryDTO search){
        model.addAttribute("search", search);
        model.addAttribute("data", categoryService.getDataPage(search));
        return "admin/component/category/list";
    }

    @GetMapping("/add")
    public String goAdd(Model model){
        model.addAttribute("categoryForm", new Category());
        return "admin/component/category/add";
    }

    @PostMapping("/add")
    public String doAdd(RedirectAttributes redirectAttributes, HttpServletRequest request, Category category){
        Category cate = categoryService.addData(category);
        if(cate == null){
            redirectAttributes.addFlashAttribute("mess", "Thông tin không hợp lệ vui lòng kiểm tra lại");
            return UrlUtils.getPreviousPageByRequest(request).orElse("/");
        }
        redirectAttributes.addFlashAttribute("mess", "Cập nhật thành công");
        return "redirect:update/"+category.getId();
    }

    @GetMapping("/update/{id}")
    public String goUpdate(Model model, @PathVariable("id") Integer id){
        Category category = categoryService.getOne(id);
        model.addAttribute("categoryForm", category);
        model.addAttribute("metaData", categoryMetaService.getList(new CategoryMetaDTO(id)));
        model.addAttribute("metaForm", new CategoryMetaDTO());
        model.addAttribute("mediaData", (category.getIdMedia() != null) ? adminMediaService.getOne(category.getIdMedia()) : new Media());
        return "admin/component/category/update";
    }

    @PostMapping("/update/{id}")
    public String doUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes, @PathVariable("id") Integer id, Category category){
        category.setId(id);
        categoryService.updateData(category);
        redirectAttributes.addFlashAttribute("mess", "Cập nhật thành công");
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }

    @PostMapping("/{idCate}/meta/update")
    public String doMetaUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes, @PathVariable("idCate") Integer idCate, CategoryMeta meta){
        meta.setIdCategory(idCate);
        categoryMetaService.save(meta);
        redirectAttributes.addFlashAttribute("mess", "Cập nhật thành công");
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
