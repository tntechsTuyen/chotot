package com.market.online.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "order_history")
public class OrderHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "id_order")
    private Integer idOrder;

    @Column(name = "id_user")
    private Integer idUser;

    @Column(name = "id_status")
    private Integer idStatus;

    @Column(name = "description")
    private String description;

    @CreationTimestamp
    @Column(name = "created_date", nullable = false)
    private Date createdDate;

}
