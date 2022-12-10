package com.market.online.admin.service;

import com.market.online.dto.CategoryDTO;
import com.market.online.entity.Category;
import com.market.online.entity.CategoryMeta;
import com.market.online.repository.CategoryMetaRepository;
import com.market.online.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminCategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CategoryMetaRepository categoryMetaRepository;

    public Category getOne(Integer id){
       return categoryRepository.findById(id).get();
    }

    public Page<Category> getData(CategoryDTO search){
        return categoryRepository.getDataPage(search, search.pageable());
    }

    public Category addData(Category category){
        List<Category> cateTmp = categoryRepository.verifyInfo(new CategoryDTO(category.getId(), category.getName()));
        if(cateTmp.size() > 0) return null;
        categoryRepository.save(category);
        return category;
    }

    public Category updateData(Category category){
        List<Category> cateTmp = categoryRepository.verifyInfo(new CategoryDTO(category.getId(), category.getName()));
        if(cateTmp.size() > 0) return null;
        categoryRepository.save(category);
        return category;
    }
}
