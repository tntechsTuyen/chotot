package com.market.online.dto;

import com.market.online.entity.CategoryMeta;
import lombok.Data;

import java.util.List;

@Data
public class CategoryDTO extends PageDTO{
    private Integer id = 0;
    private String name = "";
    private String content = "";
    public CategoryDTO(){
        super();
    }

    public CategoryDTO(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}