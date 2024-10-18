package exceptions;

import javax.servlet.ServletException;

public class BadRequestException extends ServletException {
    public BadRequestException(String msg) {
        super(msg);
    }
}
