package com.market.online.dto;

import lombok.Data;

import java.util.Date;
import java.util.Map;

@Data
public class GroupDTO {

    private Integer id;
    private String name;
    private Date updatedDate;
    private Integer read;

    public GroupDTO(){}

    public GroupDTO(Map<String, Object> mData){
        this.id = (Integer) mData.get("id");
        this.name = (String) mData.get("name");
        this.updatedDate = (Date) mData.get("updatedDate");
        this.read = (Integer) mData.get("read");
    }

    public GroupDTO(Integer id, String name, Date updatedDate, Integer read) {
        this.id = id;
        this.name = name;
        this.updatedDate = updatedDate;
        this.read = read;
    }
}
