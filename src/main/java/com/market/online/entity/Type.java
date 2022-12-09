package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "type")
public class Type {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", length = 20)
    private String name;

    @Column(name = "`table`", length = 30)
    private String table;

}