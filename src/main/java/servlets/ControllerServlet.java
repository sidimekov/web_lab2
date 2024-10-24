package servlets;

import exceptions.BadRequestException;
import util.AreaChecker;
import util.Validator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String xStr = req.getParameter("x");
        String yStr = req.getParameter("y");
        String rStr = req.getParameter("r");

        if (xStr != null && yStr != null && rStr != null) {
            try {
                Validator.validate(xStr, yStr, rStr);

                req.getRequestDispatcher("/AreaCheckServlet").forward(req, resp);

            } catch (BadRequestException e) {
//                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
                getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
            } catch (ServletException e) {
//                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
                getServletContext().getRequestDispatcher("/index.jsp").forward(req,resp);
            }
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
//            try {
//                dispatcher.forward(req, resp);
//            } catch (ServletException e) {
//                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
//            }
            dispatcher.forward(req, resp);
        }
    }
}














