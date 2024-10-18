package util;

public class AreaChecker {
    public static boolean areaCheck(double x, double y, double r) {
        if (x >= 0 && y >= 0) {
            if (y <= -1 * x/ Math.sqrt(3) + r/2) {
                return true;
            }
        }
        if (x <= 0 && y >= 0) {
            if (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r/2, 2)) {
                return true;
            }
        }
        if (x <= 0 && y <= 0) {
            if (x >= -r && y >= -r) {
                return true;
            }
        }
        return false;
    }
}
