package com.market.online.dto;

import lombok.Data;

@Data
public class OrderDTO {
    private Integer id;
    private Integer idProduct;
    private Integer idProductSwap;
    private Integer idBuyer = 0;
    private Integer idSeller = 0;
    private Integer idType;
    private Integer value = 1; //1: next, 0: cancel
    private Integer valueRate = 0;

    public OrderDTO(){}

    public OrderDTO(Integer id){
        this.id = id;
    }
}
