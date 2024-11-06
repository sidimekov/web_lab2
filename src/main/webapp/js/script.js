const xTextInput = document.getElementById("x-input")
const yRadioInputs = document.getElementsByName("y-radio")
const yTextInput = document.getElementById("y-input")
const rCheckboxInputs = document.getElementsByName("r")
const submitFormBtn = document.getElementById("submitFormBtn")
const submitForm = document.getElementById("submitForm")

function checkOnlyOne(checkbox) {
    rCheckboxInputs.forEach((item) => {
        if (item !== checkbox) item.checked = false
    })
}
rCheckboxInputs.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
        checkOnlyOne(checkbox)
        let rValue = 3
        const selectedRCheckbox = Array.from(rCheckboxInputs).find(input => input.checked)
        if (selectedRCheckbox) {
            rValue = parseFloat(selectedRCheckbox.value)
        }
        drawCoordinatePlane()
        addPoints()
        drawPlot(rValue)
    })
})

function setY(n) {
    document.getElementById('y-input').value = n
}

function checkX() {
    if (xTextInput.value.trim() !== "") {
        const xValue = parseFloat(xTextInput.value)
        // console.log(xTextInput.value, xValue)
        // console.log((xValue != xTextInput.value))
        if (!(isNaN(xValue) || xValue < -3 || xValue > 5 || isNaN(xTextInput.value))) {
            return true
        }
    }
    return false
}

function updateSubmit() {
    const ySelected = Array.from(yRadioInputs).some(input => input.checked)
    const rSelected = Array.from(rCheckboxInputs).some(input => input.checked)
    const xFilled = checkX()

    submitFormBtn.disabled = (!(ySelected && xFilled && rSelected))
}
yRadioInputs.forEach(input => input.addEventListener("change", updateSubmit))
xTextInput.addEventListener("input", updateSubmit)
rCheckboxInputs.forEach(input => input.addEventListener("change", updateSubmit))

function showErrorPopup(message) {
    const popup = document.getElementById('error-popup')
    popup.textContent = message
    popup.style.display = 'block'

    setTimeout(() => {
        popup.style.display = 'none'
    }, 5000)
}