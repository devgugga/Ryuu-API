package br.com.ryuu.core.response;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseEntityBuilder {
    public static <T> ResponseEntity<ApiResponse<T>> buildResponse(ApiResponse<T> apiResponse) {
        return new ResponseEntity<>(apiResponse, HttpStatus.valueOf(apiResponse.getStatus()));
    }

    public static <T> ResponseEntity<ApiResponse<T>> success(T data) {
        return buildResponse(ApiResponse.success(data));
    }

    public static <T> ResponseEntity<ApiResponse<T>> success(T data, String message) {
        return buildResponse(ApiResponse.success(data, message));
    }

    public static <T> ResponseEntity<ApiResponse<T>> error(HttpStatus status, String message) {
        return buildResponse(ApiResponse.error(status, message));
    }

    public static <T> ResponseEntity<ApiResponse<T>> error(HttpStatus status, String message, ErrorDetails error) {
        return buildResponse(ApiResponse.error(status, message, error));
    }
}
