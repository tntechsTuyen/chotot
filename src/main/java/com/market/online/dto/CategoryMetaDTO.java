package com.market.online.dto;

import lombok.Data;

@Data
public class CategoryMetaDTO extends PageDTO{
    private Integer id = 0;
    private Integer idCategory = 0;
    private String key = "";
    private String value = "";
    private String description = "";

    public CategoryMetaDTO() {
    }

    public CategoryMetaDTO(Integer idCategory) {
        this.idCategory = idCategory;
    }

    public CategoryMetaDTO(Integer idCategory, String key) {
        this.idCategory = idCategory;
        this.key = key;
    }
}
