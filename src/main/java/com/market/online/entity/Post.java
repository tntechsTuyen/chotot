package com.market.online.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.Instant;
import java.util.Date;

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

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "title", length = 50)
    private String title;

    @Column(name = "content", length = 254)
    private String content;

    @Column(name = "total_view")
    private Integer totalView = 0;

    @Column(name = "total_like")
    private Integer totalLike = 0;

    @Column(name = "total_follow")
    private Integer totalFollow = 0;

    @Column(name = "total_comment")
    private Integer totalComment = 0;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;

    @UpdateTimestamp
    @Column(name = "updated_date")
    private Date updatedDate;

    public Post() {
    }

    public Post(Product product){
        this.idProduct = product.getId();
        this.idUser = product.getIdUser();
        this.title = product.getName();

    }
}