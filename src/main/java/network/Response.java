package network;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.DoubleStream;

public class Response {
    private double x;
    private double y;
    private double r;
    private boolean in;
    private String currentTime;
    private double execTime;

    public Response(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public double getExecTime() {
        return execTime;
    }

    public void setExecTime(double execTime) {
        this.execTime = execTime;
    }

    public void setX(double x) {
        this.x = x;
    }

    public boolean isIn() {
        return in;
    }

    public void setIn(boolean in) {
        this.in = in;
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
}