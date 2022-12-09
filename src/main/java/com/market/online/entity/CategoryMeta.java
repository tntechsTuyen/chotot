package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "category_meta")
public class CategoryMeta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_category")
    private Integer idCategory;

    @Column(name = "key", length = 50)
    private String key;

    @Column(name = "value", length = 100)
    private String value;

    @Column(name = "description", length = 254)
    private String description;
}