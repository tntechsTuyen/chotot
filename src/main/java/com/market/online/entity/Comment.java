package com.market.online.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.Instant;
import java.util.Date;

@Data
@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "content")
    private String content;

    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    private Date createdDate;
}