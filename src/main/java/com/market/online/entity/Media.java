package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "media")
public class Media {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "url", length = 254)
    private String url;

    @Column(name = "type", length = 10)
    private String type;
}