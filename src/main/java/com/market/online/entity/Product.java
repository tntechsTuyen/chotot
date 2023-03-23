package com.market.online.entity;

import com.market.online.dto.ProductDTO;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_category")
    private Integer idCategory;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "id_confirmer")
    private Integer idConfirmer;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "price")
    private Integer price;

    @Column(name = "price_verify")
    private Integer priceVerify;

    @Column(name = "id_status")
    private Integer idStatus;

    @Column(name = "is_locked")
    private Integer isLocked;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;

    public Product(){}

    public Product(ProductDTO productDTO){
        this.idCategory = productDTO.getIdCategory();
        this.name = productDTO.getName();
        this.price = productDTO.getPrice();
    }
}