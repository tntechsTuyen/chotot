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

    @Column(name = "meta_key", length = 50)
    private String key;

    @Column(name = "meta_value")
    private String value;

    @Column(name = "description")
    private String description;
}