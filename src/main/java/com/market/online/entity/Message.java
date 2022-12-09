package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "message")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_from")
    private Integer idFrom;

    @Column(name = "id_to")
    private Integer idTo;

    @Lob
    @Column(name = "content")
    private String content;

    @Column(name = "created_date", nullable = false)
    private Instant createdDate;

}