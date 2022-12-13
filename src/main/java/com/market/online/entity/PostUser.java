package com.market.online.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "post_user")
public class PostUser {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "id_user", nullable = false)
    private Integer idUser;

    @Column(name = "had_view", columnDefinition = "integer default 0")
    private Boolean hadView;

    @Column(name = "had_like", columnDefinition = "integer default 0")
    private Boolean hadLike;

    @Column(name = "had_follow", columnDefinition = "integer default 0")
    private Boolean hadFollow;
}