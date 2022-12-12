package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "post")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_product")
    private Integer idProduct;

    @Column(name = "id_location")
    private Integer idLocation;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "title", length = 50)
    private String title;

    @Column(name = "content", length = 254)
    private String content;

    @Column(name = "total_view")
    private Integer totalView;

    @Column(name = "total_like")
    private Integer totalLike;

    @Column(name = "total_follow")
    private Integer totalFollow;

    @Column(name = "total_comment")
    private Integer totalComment;

    @Column(name = "created_date", nullable = false)
    private Instant createdDate;

    @Column(name = "updated_date", nullable = false)
    private Instant updatedDate;

    public Post() {
    }

    public Post(Product product){
        this.idProduct = product.getId();
        this.idUser = product.getIdUser();
        this.title = product.getName();

    }
}