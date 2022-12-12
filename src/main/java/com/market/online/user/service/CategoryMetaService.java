package com.market.online.user.service;

import com.market.online.dto.CategoryMetaDTO;
import com.market.online.entity.CategoryMeta;
import com.market.online.repository.CategoryMetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryMetaService {

    @Autowired
    private CategoryMetaRepository categoryMetaRepository;

    public List<CategoryMeta> getByIdCategory(CategoryMetaDTO search){
        if(search.getIdCategory() != 0){
            return categoryMetaRepository.getList(search);
        }else{
            return new ArrayList<>();
        }
    }

}
