package com.market.online.user.service;

import com.market.online.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<Map<String, Object>> getAllData(){
        return categoryRepository.getAllData();
    }
}
