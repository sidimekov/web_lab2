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
import java.util.ArrayList;
import java.util.List;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double x = Double.parseDouble(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));

        Response areaResponse = new Response(x, y, r);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        areaResponse.setCurrentTime(formatter.format(LocalDateTime.now()));
        Instant execStart = Instant.now();
        areaResponse.setIn(AreaChecker.areaCheck(x, y, r));
        Instant execEnd = Instant.now();
        areaResponse.setExecTime(Duration.between(execStart, execEnd).toNanos() / 1_000_000_000.0);

        if (getServletContext().getAttribute("responseList") == null) {
            getServletContext().setAttribute("responseList", new ArrayList<>());
        }
        List<Response> responseList = (List<Response>) getServletContext().getAttribute("responseList");
        responseList.add(areaResponse);
        getServletContext().setAttribute("responseList", responseList);

        req.setAttribute("result", areaResponse);
        req.getRequestDispatcher("result.jsp").forward(req, resp);
    }
}
