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
        let r;
        rCheckboxInputs.forEach((item) => {
            if (item.checked == true) {
                r = item.
            }
        });
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

drawPlot(5);
drawCoordinatePlane();