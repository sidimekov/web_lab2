<%@ page import="network.Response" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>резы</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<header class="header">
    <h1>Веб 2</h1>
    <div class="name">Сидимеков Дмитрий<br>ИСУ 409553<br>P3222</div>
</header>

<main>
    <div class="canvas-container">
        <div class="form-container">
            <canvas id="plot-canvas" width="500" height="500"></canvas>
        </div>
        <a class="button-link" href="index.jsp">
            <button>На главную
            </button>
        </a>
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
<script src="${pageContext.request.contextPath}/js/plot.js"></script>

<script>
    drawCoordinatePlane()

    <% Response result = (Response)request.getAttribute("result"); %>
    <%
        if (result != null) {
    %>
        addPoint(<%= result.getX() %>, <%= result.getY() %>, <%= result.getR() %>, <%= result.isIn() %>);
        drawPlot(<%= result.getR() %>);
    <%
        }
    %>
</script>
</body>
</html>
