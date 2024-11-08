package br.com.ryuu.core.response;

import lombok.Builder;
import lombok.Data;

import java.util.Map;

/**
 * Represents the details of an error that occurred during request processing.
 * This class is used to encapsulate error information including an error code,
 * a detailed description, and any validation errors that may have occurred.
 */
@Data
@Builder
public class ErrorDetails {
    /**
     * The error code associated with this error.
     */
    private String code;

    /**
     * A detailed description of the error.
     */
    private String detail;

    /**
     * A map of validation errors, where the key is the field name
     * and the value is the error message for that field.
     */
    private Map<String, String> validationErrors;
}
