package testproject.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
/**
 * error responding to user rights to an action
 */
@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class NoRightsException extends RuntimeException{

    private static final long serialVersionUID = 1L;
    private String resourceName;
    private String fieldName;
    private Object fieldValue;
    /**
     * constructor
     */
    public NoRightsException(String resourceName, String fieldName, Object fieldValue) {
        super(String.format(" the user has no rights to %s: %s : '%s'", resourceName, fieldName, fieldValue));
        this.resourceName = resourceName;
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
    }

    public String getResourceName() {
        return resourceName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public Object getFieldValue() {
        return fieldValue;
    }

}