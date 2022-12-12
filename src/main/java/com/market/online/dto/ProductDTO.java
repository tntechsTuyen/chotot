package com.market.online.dto;

import lombok.Data;

@Data
public class ProductDTO extends PageDTO {
    private Integer id = 0;
    private Integer idCategory = 0;
    private Integer idConfirmer = 0;
    private String name = "";
    private Integer price = 0;
    private Integer priceVerify = 0;
    private Integer idStatus = 0;

    public ProductDTO() {
        super();
    }

    public ProductDTO(Integer id) {
        super();
        this.id = id;
    }

    public ProductDTO(Integer id, String name, Integer idStatus) {
        super();
        this.id = id;
        this.name = name;
        this.idStatus = idStatus;
    }
}
