package com.market.online.common.response;

import lombok.Value;

@Value(staticConstructor = "of")
public class CommonResponse<T> {

    private Integer status;

    private ResponseCode code;

    private String message;

    private T result;

}
