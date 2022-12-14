package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "post_media")
public class PostMedia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "id_media")
    private Integer idMedia;

    @Column(name = "id_type")
    private Integer idType;

    public PostMedia(){}

    public PostMedia(Integer idPost, Integer idMedia, Integer idType) {
        this.idPost = idPost;
        this.idMedia = idMedia;
        this.idType = idType;
    }
}