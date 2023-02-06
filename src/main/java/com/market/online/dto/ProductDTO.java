package com.market.online.dto;

import com.market.online.entity.Post;
import com.market.online.entity.Product;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Data
public class ProductDTO extends PageDTO {
    private Integer id = 0;
    private Integer idUser = 0;
    private Integer idCategory = 0;
    private Integer idConfirmer = 0;
    private String name = "";
    private String content = "";
    private Integer price = 0;
    private Integer priceVerify = 0;
    private Integer idStatus = 0;
    private Integer hadLike = 0;
    private Integer hadFollow = 0;
    private List<Integer> metaId;
    private List<String> metaKey;
    private List<String> metaName;
    private List<String> metaValue;
    private MultipartFile[] media;

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

    public ProductDTO(Product product, Post post){
        this.idCategory = product.getIdCategory();
        this.name = product.getName();
        this.price = product.getPrice();
        this.content = post.getContent();
    }
}
