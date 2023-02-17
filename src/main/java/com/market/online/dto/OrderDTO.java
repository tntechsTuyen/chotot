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
    private Integer minRate = 5;
    private Integer idRedirect = 0;

    public OrderDTO(){}

    public OrderDTO(Integer id){
        this.id = id;
    }

    public OrderDTO(Integer idBuyer, Integer idSeller){
        this.idBuyer = idBuyer;
        this.idSeller = idSeller;
        this.minRate = 0;
        this.idRedirect = -1;
    }
}
