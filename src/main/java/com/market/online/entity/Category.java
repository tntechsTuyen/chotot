package com.market.online.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Data
@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_media")
    private Integer idMedia;

    @Column(name = "name")
    private String name;

    @Column(name = "content")
    private String content;

    @Column(name = "is_locked")
    private Integer isLocked;

    @Transient
    private MultipartFile fileMedia;

    public Category() {
    }

    public Category(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
}