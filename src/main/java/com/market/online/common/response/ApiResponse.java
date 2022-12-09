package com.market.online.common.response;

import lombok.Data;
import org.springframework.http.HttpStatus;

@Data
public class ApiResponse<T> {

    private Integer status;

    private Code code;

    private String message;

    private T result;

    public enum Code {
        SUCCESS,
        FAILED
    }

    public static <T> ApiResponse<T> of (HttpStatus status, Code code, String message, T result) {
        ApiResponse<T> response = new ApiResponse<>();
        response.setStatus(status.value());
        response.setCode(code);
        response.setMessage(message);
        response.setResult(result);
        return response;
    }
}
