package br.com.ryuu.core.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;

/**
 * A class representing a standard API response with optional data and error details.
 *
 * @param <T> The type of data to be included in the response.
 */
@Data
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {

    /**
     * The timestamp of when the response was generated.
     */
    private LocalDateTime timestamp;

    /**
     * The HTTP status code of the response.
     */
    private int status;

    /**
     * An optional message describing the response.
     */
    private String message;

    /**
     * The data included in the response. This field is optional and may be null.
     */
    private T data;

    /**
     * Error details in case of an error response. This field is optional and may be null.
     */
    private ErrorDetails error;

    /**
     * Creates a success ApiResponse with the provided data and default OK status.
     *
     * @param data The data to be included in the response.
     * @param <T>  The type of data.
     * @return A success ApiResponse with the provided data.
     */
    public static <T> ApiResponse<T> success(T data) {
        return ApiResponse.<T>builder()
                .timestamp(LocalDateTime.now())
                .status(HttpStatus.OK.value())
                .data(data)
                .build();
    }

    /**
     * Creates a success ApiResponse with the provided data and message.
     *
     * @param data    The data to be included in the response.
     * @param message The message describing the response.
     * @param <T>     The type of data.
     * @return A success ApiResponse with the provided data and message.
     */
    public static <T> ApiResponse<T> success(T data, String message) {
        return ApiResponse.<T>builder()
                .timestamp(LocalDateTime.now())
                .status(HttpStatus.OK.value())
                .message(message)
                .data(data)
                .build();
    }

    /**
     * Creates an error ApiResponse with the provided HTTP status and message.
     *
     * @param status  The HTTP status of the response.
     * @param message The message describing the error.
     * @param <T>     The type of data.
     * @return An error ApiResponse with the provided HTTP status and message.
     */
    public static <T> ApiResponse<T> error(HttpStatus status, String message) {
        return ApiResponse.<T>builder()
                .timestamp(LocalDateTime.now())
                .status(status.value())
                .message(message)
                .build();
    }

    /**
     * Creates an error ApiResponse with the provided HTTP status, message, and error details.
     *
     * @param status  The HTTP status of the response.
     * @param message The message describing the error.
     * @param error   The error details.
     * @param <T>     The type of data.
     * @return An error ApiResponse with the provided HTTP status, message, and error details.
     */
    public static <T> ApiResponse<T> error(HttpStatus status, String message, ErrorDetails error) {
        return ApiResponse.<T>builder()
                .timestamp(LocalDateTime.now())
                .status(status.value())
                .message(message)
                .error(error)
                .build();
    }
}
