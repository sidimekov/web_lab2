const xTextInput = document.getElementById("x-input");
const yRadioInputs = document.getElementsByName("y");
const rCheckboxInputs = document.getElementsByName("r");
const submitForm = document.getElementById("submitForm");

function checkOnlyOne(checkbox) {
    rCheckboxInputs.forEach((item) => {
        if (item !== checkbox) item.checked = false;
    });
}
rCheckboxInputs.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
        checkOnlyOne(checkbox);
    });
});

function checkX() {
    if (xTextInput.value.trim() !== "") {
        const xValue = parseFloat(xTextInput.value);
        // console.log(xTextInput.value, xValue)
        // console.log((xValue != xTextInput.value))
        if (!(isNaN(xValue) || xValue < -3 || xValue > 5 || isNaN(xTextInput.value))) {
            return true;
        }
    }
    return false;
}

function updateSubmit() {
    const ySelected = Array.from(yRadioInputs).some(input => input.checked);
    const rSelected = Array.from(rCheckboxInputs).some(input => input.checked);
    const xFilled = checkX();

    submitForm.disabled = (!(ySelected && xFilled && rSelected));
}
yRadioInputs.forEach(input => input.addEventListener("change", updateSubmit));
xTextInput.addEventListener("input", updateSubmit);
rCheckboxInputs.forEach(input => input.addEventListener("change", updateSubmit));


document.getElementById('submitForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const formData = new FormData(this);
    var object = {};
    formData.forEach(function (value, key) {
        object[key] = value;
    });
    var jsonData = JSON.stringify(object);

    console.log(jsonData);

    fetch('ControllerServlet', {
        method: 'POST',
        body: jsonData
    })
        .then(response => response.json())
        .then(data => {
            addRowToTable(data);
        })
        .catch(error => {
            alert('Ошибка отправки данных.');
        });
});

function addRowToTable(data) {
    const table = document.getElementById('resultTable').getElementsByTagName('tbody')[0];

    const newRow = table.insertRow(0);

    const cellX = newRow.insertCell(0);
    const cellY = newRow.insertCell(1);
    const cellR = newRow.insertCell(2);
    const cellIn = newRow.insertCell(3);
    const cellDate = newRow.insertCell(4);
    const cellExecTime = newRow.insertCell(5);

    cellX.textContent = data.x;
    cellY.textContent = data.y;
    cellR.textContent = data.r;
    cellIn.textContent = data.in ? "Есть пробитие" : "Мимо";
    cellDate.textContent = data.currentTime;
    cellExecTime.textContent = data.execTime.toFixed(8) + " сек";
}