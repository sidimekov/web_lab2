package servlets;

import com.google.gson.Gson;
import network.Response;
import util.AreaChecker;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        double x = Double.parseDouble(req.getParameter("x"));
//        double y = Double.parseDouble(req.getParameter("y"));
//        double r = Double.parseDouble(req.getParameter("r"));
//
//        Response areaResponse = new Response(x, y, r);
//
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        areaResponse.currentTime = formatter.format(LocalDateTime.now());
//        Instant execStart = Instant.now();
//        areaResponse.in = AreaChecker.areaCheck(x,y,r);
//        Instant execEnd = Instant.now();
//        areaResponse.execTime = (float) (Duration.between(execStart, execEnd).toNanos() / Math.pow(10, 9));
//
//        Gson gson = new Gson();
//        String jsonAreaResponse = gson.toJson(areaResponse);
//
//        resp.setContentType("application/json");
//        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        if (req.getParameter("x") != null && req.getParameter("y") != null && req.getParameter("r") != null) {
            out.printf("{\"x\": \"%s\",\"y\":\"%s\",\"r\":\"%s\"}", req.getParameter("x"), req.getParameter("y"), req.getParameter("r"));
        } else {
            out.print("{\"resp\":\"zalupa\"}");
        }
        out.flush();
    }
}