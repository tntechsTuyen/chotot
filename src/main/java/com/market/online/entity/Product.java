package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

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

    @Column(name = "id_confirmer")
    private Integer idConfirmer;

    @Column(name = "name", length = 50)
    private String name;

    @Column(name = "price")
    private Integer price;

    @Column(name = "price_verify")
    private Integer priceVerify;

}