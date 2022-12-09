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

    @Column(name = "key", length = 50)
    private String key;

    @Column(name = "value", length = 100)
    private String value;

    @Column(name = "description", length = 254)
    private String description;
}