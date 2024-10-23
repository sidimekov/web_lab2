package util;

import exceptions.BadRequestException;

public class Validator {
    private static final int MAX_ARG_LENGTH = 14;
    public static void validate(String xStr, String yStr, String rStr) throws BadRequestException {

        if (xStr.trim().isEmpty() || yStr.trim().isEmpty() || rStr.trim().isEmpty()) {
            throw new BadRequestException("Parameters must not be empty");
        }

        if (xStr.length() > MAX_ARG_LENGTH || yStr.length() > MAX_ARG_LENGTH || rStr.length() > MAX_ARG_LENGTH) {
            throw new BadRequestException(String.format("Parameters are too long (expected length: %s or less)", MAX_ARG_LENGTH));
        }

        try {
            double x = Double.parseDouble(xStr);
            double y = Double.parseDouble(yStr);
            double r = Double.parseDouble(rStr);

            if (x < -3.0 || x > 5.0) {
                throw new BadRequestException("Parameter X must be between -3.0 and 5.0");
            }

            if (y < -5.0 || y > 3.0) {
                throw new BadRequestException("Parameter Y must be between -5.0 and 3.0");
            }

            if (r < 1 || r > 3) {
                throw new BadRequestException("Parameter R must be between 1.0 and 3.0");
            }
        } catch (NumberFormatException e) {
            throw new BadRequestException("Parameters X, Y, and R must be numbers");
        }
    }
}
