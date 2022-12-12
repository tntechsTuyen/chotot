package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "post_meta")
public class PostMeta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "meta_key")
    private String key;

    @Column(name = "meta_name")
    private String name;

    @Column(name = "meta_value")
    private String value;

    @Column(name = "description")
    private String description;
}