package com.market.online.dto;

import lombok.Data;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

@Data
public class PageDTO {
    private Integer p = 0; //Page
    private Integer r = 10; //Row

    public Pageable pageable(){
        return PageRequest.of(p, r);
    }
}
