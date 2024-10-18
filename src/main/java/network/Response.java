package network;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.DoubleStream;

public class Response {
    public double x;
    public double y;
    public double r;
    public boolean in;
    public String currentTime;
    public float execTime;

    public Response(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    @Override
    public String toString() {
        return "network.Response{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", in=" + in +
                ", currentTime=" + currentTime +
                ", execTime=" + execTime +
                '}';
    }

    public static String httpResponse(String state, String msgBody) {
        return """
                HTTP/1.1 %s
                Content-Type: application/json

                %s
                """.formatted(state, msgBody);
    }
}