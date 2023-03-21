package com.market.online.admin.service;

import com.market.online.dto.CategoryDTO;
import com.market.online.entity.Category;
import com.market.online.entity.CategoryMeta;
import com.market.online.entity.Media;
import com.market.online.repository.CategoryMetaRepository;
import com.market.online.repository.CategoryRepository;
import com.market.online.user.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminCategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private CategoryMetaRepository categoryMetaRepository;

    @Autowired
    private AdminMediaService adminMediaService;

    public Category getOne(Integer id){
       return categoryRepository.findById(id).get();
    }

    public List<Category> getAll(){
        return categoryRepository.findAll();
    }

    public Page<Category> getDataPage(CategoryDTO search){
        return categoryRepository.getDataPage(search, search.pageable());
    }

    public Category addData(Category category){
        List<Category> cateTmp = categoryRepository.verifyInfo(new CategoryDTO(category.getId(), category.getName()));
        if(category.getName().isEmpty()) return null;
        if(cateTmp != null && cateTmp.size() > 0) return null;
        if(category.getFileMedia().isEmpty()) return null;
        Media media = adminMediaService.uploadFile(category.getFileMedia());
        category.setIdMedia(media.getId());
        categoryRepository.save(category);
        return category;
    }

    public Category updateData(Category category){
        List<Category> cateTmp = categoryRepository.verifyInfo(new CategoryDTO(category.getId(), category.getName()));
        if(category.getName().isEmpty()) return null;
        if(cateTmp != null && cateTmp.size() > 0) return null;
        if(category.getFileMedia().isEmpty()) {
            Media media = adminMediaService.uploadFile(category.getFileMedia());
            category.setIdMedia(media.getId());
        }
        categoryRepository.save(category);
        return category;
    }

    public Category locked(Integer id){
        Category cateInfo = this.getOne(id);
        if(cateInfo.getIsLocked() == 2) return null;
        cateInfo.setIsLocked(2);
        categoryRepository.save(cateInfo);
        return cateInfo;
    }

    public Category unlocked(Integer id){
        Category cateInfo = this.getOne(id);
        if(cateInfo.getIsLocked() == 1) return null;
        cateInfo.setIsLocked(1);
        categoryRepository.save(cateInfo);
        return cateInfo;
    }
}
