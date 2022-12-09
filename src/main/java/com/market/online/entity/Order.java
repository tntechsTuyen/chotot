package com.market.online.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.Instant;

@Data
@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "id_seller")
    private Integer idSeller;

    @Column(name = "id_buyer")
    private Integer idBuyer;

    @Column(name = "id_product")
    private Integer idProduct;

    @Column(name = "id_status")
    private Integer idStatus;

    @Column(name = "id_type")
    private Integer idType;

    @Column(name = "id_redirect")
    private Integer idRedirect;

    @Column(name = "price")
    private Integer price;

    @Column(name = "created_date", nullable = false)
    private Instant createdDate;

    @Column(name = "updated_date", nullable = false)
    private Instant updatedDate;

}