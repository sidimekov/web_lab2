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

            <div id="error-popup" class="error-popup">Ошибка: что-то пошло не так</div>

            <label for="x-input">Введите координату X (от -3 до 5):</label>
            <div class="form-group">
                <%--                <input type="text" id="x-input" name="x" pattern="^(-?[0-3]|[0-5])$" required--%>
                <%--                       title="Введите целое число от -3 до 5">--%>
                <input type="text" id="x-input" name="x"
                       maxlength="17" required
                       title="Введите число от -3 до 5">
            </div>

            <input style="display:none;" type="text" name="y" id="y-input">

            <label>Выберите координату Y:</label>
            <div class="form-group">
                <label>
                    <input type="radio" name="y-radio" value="-5" required onclick="setY(-5)"> -5
                </label>
                <label>
                    <input type="radio" name="y-radio" value="-4" onclick="setY(-4)"> -4
                </label>
                <label>
                    <input type="radio" name="y-radio" value="-3" onclick="setY(-3)"> -3
                </label>
                <label>
                    <input type="radio" name="y-radio" value="-2" onclick="setY(-2)"> -2
                </label>
                <label>
                    <input type="radio" name="y-radio" value="-1" onclick="setY(-1)"> -1
                </label>
                <label>
                    <input type="radio" name="y-radio" value="0" onclick="setY(0)"> 0
                </label>
                <label>
                    <input type="radio" name="y-radio" value="1" onclick="setY(1)"> 1
                </label>
                <label>
                    <input type="radio" name="y-radio" value="2" onclick="setY(2)"> 2
                </label>
                <label>
                    <input type="radio" name="y-radio" value="3" onclick="setY(3)"> 3
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
                    <input type="checkbox" name="r" value="3" checked> 3
                </label>
            </div>

            <button id="submitFormBtn" type="submit" disabled>Отправить</button>
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

<script>
    drawCoordinatePlane()
    drawPlot(3)

    function addPoints() {
        <%
            if (application.getAttribute("responseList") != null) {
                List<Response> responses = (List<Response>) application.getAttribute("responseList");
                for (int i = responses.size() - 1; i >= 0; i--) {
                    Response resp = responses.get(i);
        %>
        addPoint(<%= resp.getX() %>, <%= resp.getY() %>, <%= resp.getR() %>, <%= resp.isIn() %>);
        <%
                }
            }
        %>
    }

    addPoints();

    canvas.addEventListener('click', function (event) {

        const rect = canvas.getBoundingClientRect();
        const mouseX = event.clientX - rect.left;
        const mouseY = event.clientY - rect.top;

        const x = (mouseX - centerX) / scale;
        const y = (centerY - mouseY) / scale;

        let rValue = 3;
        const selectedRCheckbox = Array.from(rCheckboxInputs).find(input => input.checked);
        if (selectedRCheckbox) {
            rValue = parseFloat(selectedRCheckbox.value);
        }

        if (x >= -3 && x <= 5 && y >= -5 && y <= 3) {

            xTextInput.value = x.toFixed(2);
            yTextInput.value = y.toFixed(2)
            rCheckboxInputs.forEach(input => {
                input.checked = parseFloat(input.value) === rValue;
            })

            // console.log(x,y,rValue)
            submitForm.submit();

        } else {
            showErrorPopup('Недопустимые координаты');
        }
    });
</script>

</body>

</html>