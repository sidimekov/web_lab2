<%@ page import="network.Response" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Веб 2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>
<header class="header">
    <h1>Веб 2</h1>
    <div class="name">Сидимеков Дмитрий<br>ИСУ 409553<br>P3222</div>
</header>

<main>
    <div class="form-container">
<%--        <img src="img/areas.png" id="img">--%>
        <canvas id="plot-canvas" width="500" height="500"></canvas>

        <form id="submitForm" action="ControllerServlet" method="post">

            <label for="x-input">Введите координату X (от -3 до 5):</label>
            <div class="form-group">
                <input type="text" id="x-input" name="x" pattern="^(-?[0-3]|[0-5])$" required
                       title="Введите число от -3 до 5">
            </div>

            <label>Выберите координату Y:</label>
            <div class="form-group">
                <label>
                    <input type="radio" name="y" value="-5" required> -5
                </label>
                <label>
                    <input type="radio" name="y" value="-4"> -4
                </label>
                <label>
                    <input type="radio" name="y" value="-3"> -3
                </label>
                <label>
                    <input type="radio" name="y" value="-2"> -2
                </label>
                <label>
                    <input type="radio" name="y" value="-1"> -1
                </label>
                <label>
                    <input type="radio" name="y" value="0"> 0
                </label>
                <label>
                    <input type="radio" name="y" value="1"> 1
                </label>
                <label>
                    <input type="radio" name="y" value="2"> 2
                </label>
                <label>
                    <input type="radio" name="y" value="3"> 3
                </label>
            </div>

            <label>Выберите параметр R:</label>
            <div class="form-group">
                <label>
                    <input type="checkbox" name="r" value="1"> 1
                </label>
                <label>
                    <input type="checkbox" name="r" value="1.5"> 1.5
                </label>
                <label>
                    <input type="checkbox" name="r" value="2"> 2
                </label>
                <label>
                    <input type="checkbox" name="r" value="2.5"> 2.5
                </label>
                <label>
                    <input type="checkbox" name="r" value="3"> 3
                </label>
            </div>

            <button type="submit">Отправить</button>
        </form>

    </div>

    <div class="table-container">
        <table id="resultTable">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Включение точки</th>
                <th>Дата</th>
                <th>Время выполнения</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (application.getAttribute("responseList") != null) {
                    List<Response> responses = (List<Response>) application.getAttribute("responseList");
                    for (int i = responses.size() - 1; i >= 0; i--) {
                        Response resp = responses.get(i);
            %>
            <tr>
                <td><%= resp.getX() %>
                </td>
                <td><%= resp.getY() %>
                </td>
                <td><%= resp.getR() %>
                </td>
                <td><%= resp.isIn() ? "Есть пробитие" : "Мимо" %>
                </td>
                <td><%= resp.getCurrentTime() %>
                </td>
                <td><%= String.format("%.8f сек", resp.getExecTime()) %>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</main>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="${pageContext.request.contextPath}/js/plot.js"></script>

<%
    if (application.getAttribute("responseList") != null) {
        List<Response> responses = (List<Response>) application.getAttribute("responseList");
        for (int i = responses.size() - 1; i >= 0; i--) {
            Response resp = responses.get(i);
%>
    <script>
    addPoint(<%= resp.getX() %>, <%= resp.getY() %>, <%= resp.getR() %>, <%= resp.isIn() %>);
    </script>
<%
        }
    }
%>

</body>

</html>