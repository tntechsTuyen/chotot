package com.market.online.dto;

import lombok.Data;

import java.util.Date;

@Data
public class UserDTO extends PageDTO {
    private Integer id = 0;
    private String username = "";
    private String password;
    private String fullName = "";
    private String address = "";
    private String phone = "";
    private String email = "";
    private Integer gender = 0;
    private String idRole;
    private Date createdDate;

    public UserDTO(){
        super();
    }

    public UserDTO(Integer id){
        super();
        this.id = id;
    }

    public UserDTO(Integer id, String username){
        super();
        this.id = id;
        this.username = username;
    }
}
