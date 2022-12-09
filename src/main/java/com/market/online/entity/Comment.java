package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_post")
    private Integer idPost;

    @Column(name = "id_user")
    private Integer idUser;

    @Lob
    @Column(name = "content")
    private String content;

    @Column(name = "created_date", nullable = false)
    private Instant createdDate;
}