package com.market.online.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.Instant;
import java.util.Date;

@Data
@Entity
@Table(name = "message")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private String name;

    @Column(name = "id_group")
    private Integer idGroup;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "content")
    private String content;

    @Column(name = "readed")
    private Integer read = 0;

    @CreationTimestamp
    @Column(name = "created_date")
    private Date createdDate;

}