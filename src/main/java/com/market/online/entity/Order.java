package com.market.online.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.Instant;
import java.util.Date;

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
    private Integer idStatus = 1;

    @Column(name = "id_type")
    private Integer idType;

    @Column(name = "id_redirect")
    private Integer idRedirect = 0;

    @Column(name = "price")
    private Integer price;

    @Column(name = "rate")
    private Integer rate;

    @CreationTimestamp
    @Column(name = "created_date", nullable = false)
    private Date createdDate;

    @UpdateTimestamp
    @Column(name = "updated_date")
    private Date updatedDate;

    public void setPrice(Integer price){
        this.price = (price > 0) ? price : 0;
    }
}