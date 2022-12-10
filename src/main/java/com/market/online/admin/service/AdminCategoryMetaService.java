package com.market.online.admin.service;

import com.market.online.dto.CategoryMetaDTO;
import com.market.online.entity.CategoryMeta;
import com.market.online.repository.CategoryMetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminCategoryMetaService {

    @Autowired
    private CategoryMetaRepository categoryMetaRepository;

    public List<CategoryMeta> getList(CategoryMetaDTO search){
        return categoryMetaRepository.getList(search);
    }

    public void save(CategoryMeta categoryMeta){
        categoryMetaRepository.save(categoryMeta);
    }
}
